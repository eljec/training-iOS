//
//  JCSearchViewController.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCSearchViewController.h"
#import "RequestManager.h"
#import "SearchResultViewController.h"
#import "MBProgressHUD.h"

@interface JCSearchViewController () {
	RequestManager *manager;
	MBProgressHUD *progressView;
}

@end

@implementation JCSearchViewController

- (void)viewDidLoad {
	[super viewDidLoad];


	UIColor *navBarColor = [UIColor colorWithRed:241.0f / 255.0f green:196.0f / 255.0f blue:15.0f / 255.0f alpha:1.0f];

	[self.navigationController.navigationBar setBarTintColor:navBarColor];

	manager = [[RequestManager alloc] init];

	progressView = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:progressView];
	progressView.delegate = self;
	progressView.mode = MBProgressHUDModeIndeterminate;
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

- (IBAction)search:(id)sender {
	if ([self.searchTextView.text isEqual:@""]) {
		// SHow erroe message

		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing required data!" message:@"Please complete with all requiered information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
	}
	else {
		__weak typeof(self) weakSelf = self;

		[progressView show:YES];

		NSString *searchString = [self.searchTextView.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

		[manager searchWith:searchString callBackBlock: ^(NSMutableArray *arrayResult) {
		    // Load the result list


		    [progressView hide:YES];

		    [weakSelf showResults:arrayResult];
		}];
	}
}

- (void)showResults:(NSMutableArray *)results {
	SearchResultViewController *resultsViewController = [[SearchResultViewController alloc] initWithArrayItems:results];

	[self.navigationController pushViewController:resultsViewController
	                                     animated:YES];
}

@end
