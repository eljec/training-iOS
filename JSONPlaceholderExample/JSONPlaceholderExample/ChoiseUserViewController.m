//
//  ChoiseUserViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "ChoiseUserViewController.h"
#import "User.h"
#import "RequestManager.h"
#import "MBProgressHUD.h"
#import "UserPreferencesManager.h"

@interface ChoiseUserViewController () <MBProgressHUDDelegate> {
	MBProgressHUD *progressView;
	UserPreferencesManager *userPreferences;
	NSIndexPath *lastIndexSelected;
}

@property (nonatomic, strong) NSMutableData *responseData;

- (void)loadUsers;

@end

@implementation ChoiseUserViewController

@synthesize responseData = _responseData;

- (id)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Users";
		self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Users" image:[UIImage imageNamed:@"user"] tag:0];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	NSLog(@"viewdidload");

	// Init the internal array

	self.userList = [[NSMutableArray alloc] init];

	// Add delegates

	self.userTable.delegate = self;
	self.userTable.dataSource = self;

	// Init progress view

	progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:progressView];
	progressView.delegate = self;

	// Init user preferences

	userPreferences = [[UserPreferencesManager alloc] init];

	// Load the users

	[self loadUsers];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)loadUsers {
	// Show progress view

	[self showProgressViewWithMode:MBProgressHUDModeIndeterminate];

	// Make a Request in background

	RequestManager *reqManager = [[RequestManager alloc] init];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		// Get the mock items

		NSMutableArray *users = [reqManager getAllUsers];

		dispatch_async(dispatch_get_main_queue(), ^{
			self.userList = users;

			[self.userTable reloadData];

			[self hideProgressView];
		});
	});
}

- (void)showProgressViewWithMode:(MBProgressHUDMode)mode {
	// Hide table

	self.userTable.hidden = YES;

	progressView.mode = mode;
	[progressView show:YES];
}

- (void)hideProgressView {
	[progressView hide:YES afterDelay:1];

	// Show table

	self.userTable.hidden = NO;
}

// Table methods


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.userList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *simpleTableIdentifier = @"SimpleTableItem";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
	}

	User *user = [self.userList objectAtIndex:indexPath.row];
	cell.textLabel.text = user.userName;

	// Marke the sslected user

	NSInteger idSelected = [userPreferences getUserIdSelected];

	if (idSelected == user.id) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
		lastIndexSelected = indexPath;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//[tableView deselectRowAtIndexPath:indexPath animated:NO];

	if (lastIndexSelected && lastIndexSelected.row > 0) {
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;

		User *tappedUser = [self.userList objectAtIndex:indexPath.row];

		[userPreferences saveUserIdSelected:tappedUser.id];

		NSLog(@"User selected(id): %ld", (long)tappedUser.id);

		// Tell the table view to reload the row whose data you just updated.

		[tableView reloadRowsAtIndexPaths:@[indexPath, lastIndexSelected] withRowAnimation:UITableViewRowAnimationNone];


		lastIndexSelected = indexPath;
	}
	else {
		return;
	}
}

@end
