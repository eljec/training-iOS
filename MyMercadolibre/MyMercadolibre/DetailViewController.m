//
//  DetailViewController.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/9/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "DetailViewController.h"
#import "RequestManager.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"


@interface DetailViewController () {
	JCItemEntity *currentItem;
	NSString *idSelectedItem;
	RequestManager *manager;
}

@end

@implementation DetailViewController

- (id)initWithModelId:(NSString *)id {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		idSelectedItem = id;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:self.progressView];
	self.progressView.delegate = self;
	self.progressView.mode = MBProgressHUDModeIndeterminate;

	manager = [[RequestManager alloc] init];
	// Get the object

	__weak typeof(self) weakSelf = self;

	// Show progress view

	[self.progressView show:YES];

	[manager getItemById:idSelectedItem callBackBlock: ^(JCItemEntity *item) {
	    [weakSelf populateView:item];
	}];
}

- (void)populateView:(JCItemEntity *)item {
	UIImage *placeholder = [UIImage imageNamed:@"placeHolder"];

	currentItem = item;

	self.titleLabel.text = item.title;
	self.priceLabel.text = [NSString localizedStringWithFormat:@"$ %.2ld", (long)item.price];
	self.itemImageView.image = placeholder;

	__weak typeof(self) weakSelf = self;

	if (item.arrayPictures) {
		NSString *urlPicture = [item.arrayPictures objectAtIndex:0];

		NSURL *url = [NSURL URLWithString:urlPicture];

		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		[self.itemImageView setImageWithURLRequest:request
		                          placeholderImage:placeholder
		                                   success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
		    weakSelf.itemImageView.image = image;

		    // Hide progress virew
		    [weakSelf.progressView hide:YES];
		} failure:nil];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
