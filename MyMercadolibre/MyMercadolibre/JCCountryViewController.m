//
//  JCCountryViewController.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCCountryViewController.h"

@interface JCCountryViewController () {
	NSMutableArray *countryList;
	MBProgressHUD *progressView;
	UserPreferencesManager *userPreferences;
	NSIndexPath *lastIndexSelected;
}

@end

@implementation JCCountryViewController

- (void)awakeFromNib {
	self.title = NSLocalizedString(@"COUNTRY_SELECTION_TITLE", nil);
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Change Navigation bar color

	UIColor *navBarColor = [UIColor colorWithRed:241.0f / 255.0f green:196.0f / 255.0f blue:15.0f / 255.0f alpha:1.0f];
	[self.navigationController.navigationBar setBarTintColor:navBarColor];

	// Set delegates in Tableview
	self.countryTable.delegate = self;
	self.countryTable.dataSource = self;

	// Init progress view
	progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:progressView];
	progressView.delegate = self;
	progressView.mode = MBProgressHUDModeIndeterminate;


	userPreferences = [[UserPreferencesManager alloc] init];
	// Load data

	[self loadData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [countryList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *myIdentifier = @"countryCell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];

	if (cell == false) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
	}

	JCCountry *country = [countryList objectAtIndex:indexPath.row];
	cell.textLabel.text = country.name;
	cell.imageView.image = [self getImageBy:country.id];


	// Mark the selected option

	NSString *siteIdSelected = [userPreferences getSiteIdSelected];

	if ([siteIdSelected isEqualToString:country.id]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;

		//

		lastIndexSelected = indexPath;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];

	if (lastIndexSelected) {
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;

		JCCountry *tappedCountry = [countryList objectAtIndex:indexPath.row];

		[userPreferences saveSiteIdSelected:tappedCountry.id];

		NSLog(@"Site selected(id): %@", tappedCountry.id);

		// Tell the table view to reload the row whose data you just updated.

		[tableView reloadRowsAtIndexPaths:@[indexPath, lastIndexSelected] withRowAnimation:UITableViewRowAnimationNone];


		lastIndexSelected = indexPath;
	}
	else {
		return;
	}
}

- (UIImage *)getImageBy:(NSString *)countryId {
	UIImage *imageCountry = nil;

	if ([countryId isEqualToString:@"MLA"]) {
		imageCountry = [UIImage imageNamed:@"Argentina"];
	}
	else if ([countryId isEqualToString:@"MLB"]) {
		imageCountry = [UIImage imageNamed:@"Brasil"];
	}
	else if ([countryId isEqualToString:@"MCO"]) {
		imageCountry = [UIImage imageNamed:@"Colombia"];
	}

	else if ([countryId isEqualToString:@"MCR"]) {
		imageCountry = [UIImage imageNamed:@"Costa-rica"];
	}
	else if ([countryId isEqualToString:@"MEC"]) {
		imageCountry = [UIImage imageNamed:@"Ecuador"];
	}

	else if ([countryId isEqualToString:@"MLC"]) {
		imageCountry = [UIImage imageNamed:@"Chile"];
	}

	else if ([countryId isEqualToString:@"MLM"]) {
		imageCountry = [UIImage imageNamed:@"Mexico"];
	}


	else if ([countryId isEqualToString:@"MLU"]) {
		imageCountry = [UIImage imageNamed:@"Uruguay"];
	}

	else if ([countryId isEqualToString:@"MLV"]) {
		imageCountry = [UIImage imageNamed:@"Venezuela"];
	}

	else if ([countryId isEqualToString:@"MPA"]) {
		imageCountry = [UIImage imageNamed:@"Panama"];
	}

	else if ([countryId isEqualToString:@"MPE"]) {
		imageCountry = [UIImage imageNamed:@"Peru"];
	}


	else if ([countryId isEqualToString:@"MPT"]) {
		imageCountry = [UIImage imageNamed:@"Portugal"];
	}
	else {
		imageCountry = [UIImage imageNamed:@"Dominicana"];
	}

	return imageCountry;
}

- (void)loadData {
	RequestManager *manager = [[RequestManager alloc] init];

	[progressView show:YES];

	__weak typeof(self) weakSelf = self;

	[manager getSites: ^(NSMutableArray *sitesArray) {
	    countryList = sitesArray;

	    [progressView hide:YES];

	    if (sitesArray) {
	        [weakSelf.countryTable reloadData];
		}
	}];
}

@end
