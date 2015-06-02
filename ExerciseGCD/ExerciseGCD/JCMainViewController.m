//
//  JCMainViewController.m
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCMainViewController.h"
#import "MBProgressHUD.h"
#import "JCCreateItemViewController.h"
#import "ItemTableViewCell.h"
#import "ItemManager.h"
#import "Item.h"

@interface JCMainViewController () <MBProgressHUDDelegate> {
	MBProgressHUD *progressView;
	ItemManager *manager;
	NSNumber *totalMockItems;
}

@property (nonatomic, strong) NSMutableArray *myItems;

@end

@implementation JCMainViewController


- (instancetype)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Option";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Add button on the navigator controller

	UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Actions" style:UIBarButtonItemStylePlain target:self action:@selector(openActionOptions)];

	self.navigationItem.rightBarButtonItem = nextButton;


	// Add delegates

	self.itemTable.delegate = self;
	self.itemTable.dataSource = self;

	// Create the progress view

	progressView = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:progressView];
	progressView.delegate = self;

	// Create ItemManager

	manager = [[ItemManager alloc] init];

	// Set total items

	totalMockItems = @100;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)openActionOptions {
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select the operation to proceed?" delegate:self cancelButtonTitle:@"Cancel"           destructiveButtonTitle:nil otherButtonTitles:@"Create an Item", @"Load a lot of Items", @"Clean Items", nil];

	[actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
		NSLog(@"Create an Item");

		[self openCreateItemView];
	}
	else if (buttonIndex == 1) {
		NSLog(@"Load a lot of Items");

		[self loadAlotOfItems];
	}
	else if (buttonIndex == 2) {
		NSLog(@"Clean Items");

		[manager cleanAllItem];

		[self loadData];

		[self.itemTable reloadData];
	}
	else if (buttonIndex == 3) {
		NSLog(@"Cancel Button Clicked");
	}
}

- (void)openCreateItemView {
	JCCreateItemViewController *createItemController = [[JCCreateItemViewController alloc] init];

	[self.navigationController pushViewController:createItemController animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[self loadData];

	[self.itemTable reloadData];
}

- (void)loadData {
	// Show progress view

	[self showProgressViewWithMode:MBProgressHUDModeIndeterminate];

	// Load items

	self.myItems = [manager getListOfItems];

	// Hide progress view

	[self hideProgressView];
}

- (void)loadAlotOfItems {
	// Put in a async queue a task to create and save a lot of items

	[self showProgressViewWithMode:MBProgressHUDModeDeterminateHorizontalBar];


	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		// Get the mock items

		NSMutableArray *items = [manager getMockListOfItems:totalMockItems];

		int i = 1;

		for (Item *item in items) {
		    [manager saveItem:item];

		    NSLog(@"Item saved: %d", i);


		    dispatch_async(dispatch_get_main_queue(), ^{
				progressView.progress = ((float)i / [totalMockItems intValue]);
				usleep(50000);
			});

		    i++;
		}

		dispatch_async(dispatch_get_main_queue(), ^{
			self.myItems = [manager getListOfItems];

			[self.itemTable reloadData];

			[self hideProgressView];
		});
	});
}

- (void)showProgressViewWithMode:(MBProgressHUDMode)mode {
	progressView.mode = mode;
	[progressView show:YES];
}

- (void)hideProgressView {
	if (progressView.mode == MBProgressHUDModeDeterminateHorizontalBar) {
		progressView.mode = MBProgressHUDModeText;
		progressView.labelText = @"Done!";
	}

	[progressView hide:YES afterDelay:1];
}

// Tables methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.myItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MyIdentifier = @"myItemCellView";

	Item *item = [self.myItems objectAtIndex:indexPath.row];

	ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ItemTableViewCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];
	}

	cell.itemTitle.text = item.title;
	cell.imageView.image = item.image;


	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//Item *item = [self.myItems objectAtIndex:indexPath.row];

//	DetailViewController *detailViewController = [[DetailViewController alloc] initWithItemEntity:item];
//
//	[self.navigationController pushViewController:detailViewController
//	                                     animated:YES];
}

@end
