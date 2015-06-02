//
//  JCPostDetailViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/1/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCPostDetailViewController.h"

@interface JCPostDetailViewController () {
	Post *postSelected;
}

@end

@implementation JCPostDetailViewController


- (id)initWithPost:(Post *)post {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Detail Post";
		postSelected = post;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.titleView.text = postSelected.title;
	self.bodyView.text = postSelected.body;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
