//
//  JCMainViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/18/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCMainViewController.h"
#import "JCStepOneViewController.h"
#import "Item.h"
#import "ItemTableViewCell.h"
#import "DetailViewController.h"

@interface JCMainViewController ()

- (void)loadData;
@property (nonatomic, strong) NSMutableArray *myItems;
@end

@implementation JCMainViewController


- (id)initWithItemEntity:(Item *)itemEntity {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"List of items";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Add delegates

	self.itemTable.delegate = self;
	self.itemTable.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated {
	//[self loadData];

	[self loadData];

	[self.itemTable reloadData];
}

- (void)loadData {
	// Try to load the saved objects

	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *savedData = [defaults valueForKey:@"itemsData"];

	NSMutableArray *items = nil;
	if (savedData) {
		items = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
	}

	if (!items) {
		items = [NSMutableArray array];
	}

	self.myItems = items;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
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
	Item *item = [self.myItems objectAtIndex:indexPath.row];

	DetailViewController *detailViewController = [[DetailViewController alloc] initWithItemEntity:item];

	[self.navigationController pushViewController:detailViewController
	                                     animated:YES];
}

- (IBAction)addItem:(id)sender {
	JCStepOneViewController *createItemMainDataViewController = [[JCStepOneViewController alloc] init];

	[self.navigationController pushViewController:createItemMainDataViewController
	                                     animated:YES];
}

@end
