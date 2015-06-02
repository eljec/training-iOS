//
//  JCGeneralViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/1/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCGeneralViewController.h"

@interface JCGeneralViewController ()

@end

@implementation JCGeneralViewController


- (void)makeRequestToServer {
	NSLog(@"Implemente it in the Subclass");
}

- (void)viewDidLoad {
	[super viewDidLoad];


	NSLog(@"viewdidload");

	// Init the internal array

	self.dataList = [[NSMutableArray alloc] init];

	// Add delegates

	self.viewTable.delegate = self;
	self.viewTable.dataSource = self;

	// Init progress view

	progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:progressView];
	progressView.delegate = self;


	// Init refresh object of the Tableview

	refreshControl = [[UIRefreshControl alloc] init];
	[refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
	[self.viewTable addSubview:refreshControl];


	// Init Request Manager

	reqManager = [[RequestManager alloc] init];

	// Load the users

	[self loadData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// +++++++++++++++++  Method to load data +++++++++++++++++ //

- (void)loadData {
	// Show progress view

	[self showProgressViewWithMode:MBProgressHUDModeIndeterminate];

	// Make request

	[self makeRequestToServer];

	//[self.viewTable reloadData];
}

//++++++++++++++++++ Progress view methods +++++++++++++++++++++++++++++ //

- (void)showProgressViewWithMode:(MBProgressHUDMode)mode {
	// Hide table

	self.viewTable.hidden = YES;

	progressView.mode = mode;
	[progressView show:YES];
}

- (void)hideProgressView {
	[progressView hide:YES afterDelay:1];

	// Show table

	self.viewTable.hidden = NO;
}

// ++++++++++++++++++++ Refresh indicator +++++++++++++++++++++++++++++++ //


- (void)handleRefresh {
	NSLog(@"Refresh");

	[refreshControl endRefreshing];

	[self makeRequestToServer];
}

//

//+++++++++++++++++++++  Table delegate methods ++++++++++++++++++++++++//


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *simpleTableIdentifier = @"SimpleTableItem";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
	}

	// Mock values
	cell.textLabel.text = @"Mock Title";

	return cell;
}

@end
