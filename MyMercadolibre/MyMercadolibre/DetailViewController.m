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

	self.arrayRequestUrl = [[NSMutableDictionary alloc] init];

	// Get the object

	__weak typeof(self) weakSelf = self;

	// Show progress view

	//[self.progressView show:YES];

	[manager getItemById:idSelectedItem callBackBlock: ^(JCItemEntity *item) {
	    [weakSelf populateView:item];
	}];
}

- (void)populateView:(JCItemEntity *)item {
	self.titleLabel.text = item.title;
	self.priceLabel.text = [NSString localizedStringWithFormat:@"$ %.2ld", (long)item.price];

	// Image

	if (item.arrayPictures) {
		self.pagerImages.contentSize = CGSizeMake(self.pagerImages.frame.size.width * item.arrayPictures.count, self.pagerImages.frame.size.height);

		UIImage *placeholder = [UIImage imageNamed:@"placeHolder"];
		__weak typeof(self) weakSelf = self;

		int i = 0;

		for (NSString *urlPicture in item.arrayPictures) {
			UIImageView *itemImage = [[UIImageView alloc] initWithImage:placeholder];
			[itemImage setFrame:CGRectMake(0, 0, self.pagerImages.frame.size.width, self.pagerImages.frame.size.height)];

			// Adding to the array request url

			[self.arrayRequestUrl setObject:itemImage forKey:urlPicture];

			// Load view in bg

			NSURL *url = [NSURL URLWithString:urlPicture];

			NSURLRequest *request = [NSURLRequest requestWithURL:url];
			[itemImage setImageWithURLRequest:request
			                 placeholderImage:placeholder
			                          success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
			    NSString *requestPath = [[request URL] absoluteString];
			    UIImageView *aux = [weakSelf.arrayRequestUrl objectForKey:requestPath];
			    aux.image = image;
			    [aux setNeedsDisplay];
			} failure:nil];

			// Create Panel

			CGRect frame;
			frame.origin.x = self.pagerImages.frame.size.width * i;
			frame.origin.y = 0;
			frame.size = self.pagerImages.frame.size;

			UIView *subview = [[UIView alloc] initWithFrame:frame];
			[subview addSubview:itemImage];

			[self.pagerImages addSubview:subview];

			i++;
		}
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
