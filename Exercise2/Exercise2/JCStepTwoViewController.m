//
//  StepTwoViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/18/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCStepTwoViewController.h"
#import "JCStepThreeViewController.h"

@interface JCStepTwoViewController ()

@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;
//@property (nonatomic, weak) Item *currentItem;
@end

@implementation JCStepTwoViewController

Item *currentItem;

- (id)initWithItemEntity:(Item *)itemEntity {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Step 2";

		NSLog(@"Init Step 2");

		[itemEntity printInfo];

		currentItem = itemEntity;
	}
	return self;
}

- (void)nextStep {
	if ([self.descriptionTextView.text isEqualToString:@""]) {
		//Show error message

		[self showErrorMessage];

		return;
	}

	currentItem.des = self.descriptionTextView.text;

	JCStepThreeViewController *stepThree = [[JCStepThreeViewController alloc] initWithItemEntity:currentItem];

	[self.navigationController pushViewController:stepThree animated:YES];
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
