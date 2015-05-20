//
//  JCStepOneViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/18/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCStepOneViewController.h"
#import "JCStepTwoViewController.h"

@interface JCStepOneViewController ()

@end

@implementation JCStepOneViewController

- (id)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Step 1";
		//self.currentItem = [[Item alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)nextStep {
	// Check if the date is completed


	if ([self.titleTextField.text isEqualToString:@""] ||
	    [self.subtitleTextField.text isEqualToString:@""] ||
	    [self.priceTextField.text isEqualToString:@""]) {
		// Show error message

		[self showErrorMessage];

		return;
	}

	Item *item = [[Item alloc] init];

	item.title = self.titleTextField.text;
	item.subTitle = self.subtitleTextField.text;

	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	item.price = [numberFormatter numberFromString:self.priceTextField.text];


	JCStepTwoViewController *stepTwoController = [[JCStepTwoViewController alloc] initWithItemEntity:item];

	[self.navigationController pushViewController:stepTwoController
	                                     animated:YES];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
