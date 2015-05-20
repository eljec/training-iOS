//
//  DetailViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/20/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (nonatomic, strong) Item *shownItem;
@end

@implementation DetailViewController

- (id)initWithItemEntity:(Item *)itemEntity {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.shownItem = itemEntity;
		self.title = @"Detail item";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.detailTitleLabel.text = self.shownItem.title;
	self.detailSubtitleLabel.text = self.shownItem.subTitle;
	self.detailPriceLabel.text = [self.shownItem.price stringValue];
	self.detailImageView.image = self.shownItem.image;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
