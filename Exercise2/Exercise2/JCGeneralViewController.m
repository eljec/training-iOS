//
//  GeneralViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/19/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCGeneralViewController.h"
#import "Item.h"

@interface JCGeneralViewController ()

@end

@implementation JCGeneralViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Put the rigth button with text next


	UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep)];

	self.navigationItem.rightBarButtonItem = nextButton;

	//self.currentItem = [[Item alloc] init];
}

- (void)nextStep {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action not implemented" message:@"Please set the logic for this button" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

- (void)showErrorMessage {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing required data!" message:@"Please complete with all requiered information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
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
