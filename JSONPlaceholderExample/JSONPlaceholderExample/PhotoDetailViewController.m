//
//  PhotoDetailViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Photo.h"
#import "MBProgressHUD.h"

@interface PhotoDetailViewController () {
	Photo *photoSelected;
	MBProgressHUD *progressView;
}

@end

@implementation PhotoDetailViewController


- (id)initWithPhoto:(Photo *)photo {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		photoSelected = photo;
		self.title = [NSString stringWithFormat:@"%ld", (long)photoSelected.id];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// Init progress view

	progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:progressView];
	progressView.delegate = self;
	progressView.mode = MBProgressHUDModeIndeterminate;
	[progressView show:YES];

	// Complete the view with the photo data

	self.photoDetailTitle.text = photoSelected.title;

	// Set mock image

	self.photoDetailImageView.image = [UIImage imageNamed:@"placeholder"];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoSelected.url]]];


		dispatch_async(dispatch_get_main_queue(), ^{
			self.photoDetailImageView.image = image;

			// Hide progressview

			[progressView hide:YES afterDelay:1];
		});
	});
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
