//
//  SearchResultViewController.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "SearchResultViewController.h"
#import "JCSearchResultTableViewCell.h"
#import "JCItemEntity.h"
#import "UIImageView+AFNetworking.h"

@interface SearchResultViewController () {
	NSMutableArray *results;
}

@end

@implementation SearchResultViewController


- (id)initWithArrayItems:(NSMutableArray *)arrayItems {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		//self.title = @"Results";
		results = arrayItems;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Add delegates to my table

	self.resultTable.delegate = self;
	self.resultTable.dataSource = self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

// Tables methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if ([results count] == 0) {
		return 1; // a single cell to report no data
	}

	return [results count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"resultCell";


	// In the case where we do not have result

	if ([results count] == 0) {
		UITableViewCell *cell = [[UITableViewCell alloc] init];
		cell.textLabel.text = @"No records to display";

		return cell;
	}
	else {
		JCSearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

		if (cell == nil) {
			[tableView registerNib:[UINib nibWithNibName:@"JCSearchResultTableViewCell" bundle:nil]
			               forCellReuseIdentifier:CellIdentifier];

			cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		}

		return cell;
	}
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(JCSearchResultTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([results count] == 0) {
		return;
	}

	JCItemEntity *itemEntity = [results objectAtIndex:indexPath.row];

	NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
	NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"es_AR"];
	UIImage *placeholder = [UIImage imageNamed:@"placeholderIcon"];

	[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
	[formatter setLocale:locale];

	cell.productTitle.text = itemEntity.title;
//	cell.productPrice.text = [NSString stringWithFormat:@"%ld", (long)itemEntity.price];

	NSString *priceString = [NSString localizedStringWithFormat:@"$ %.2ld", (long)itemEntity.price];

	cell.productPrice.text = priceString;

	cell.productImageView.image = placeholder;

	__weak JCSearchResultTableViewCell *weakCell = cell;

	if (itemEntity.urlThumbnailImage) {
		NSURL *url = [NSURL URLWithString:itemEntity.urlThumbnailImage];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		[cell.productImageView setImageWithURLRequest:request
		                             placeholderImage:placeholder
		                                      success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
		    weakCell.productImageView.image = image;
		    [weakCell setNeedsLayout];
		} failure:nil];
	}
}

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
