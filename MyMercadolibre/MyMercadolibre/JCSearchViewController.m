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
	NSString *searchText;
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

	// Set localized text

	self.title = NSLocalizedString(@"SEARCH_VIEW_TITLE", nil);
	[self.btnSearch setTitle:NSLocalizedString(@"SEARCH_BUTTON_TEXT", nil) forState:UIControlStateNormal];
	[self.searchTextView setPlaceholder:NSLocalizedString(@"HINT_SEARCH_TEXT_VIEW", nill)];

	// Set Toolbar

	UIToolbar *toolbar = [[UIToolbar alloc] init];
	[toolbar setBarStyle:UIBarStyleBlackTranslucent];
	[toolbar sizeToFit];

	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];

	NSArray *itemsArray = [NSArray arrayWithObjects:doneButton, nil];

	[toolbar setItems:itemsArray];

	[self.searchTextView setInputAccessoryView:toolbar];


	self.searchTextView.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)resignKeyboard {
	[self.searchTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)search:(id)sender {
	// Close the keyboard

	[self.searchTextView resignFirstResponder];

	// Check the text of the textView

	searchText = self.searchTextView.text;


	if ([searchText isEqual:@""]) {
		// SHow erroe message

		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ALERT_TILE_ERROR_NOT_COMPLETED_DATA", nil) message:NSLocalizedString(@"ALERT_MESSAGE_ERROR_NOT_COMPLETED_DATA", nil)  delegate:self cancelButtonTitle:NSLocalizedString(@"ALERT_OK_BUTTON_TEXT", nil) otherButtonTitles:nil];
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
	resultsViewController.title = [NSString stringWithFormat:NSLocalizedString(@"SEARCH_RESULT_TITLE", nil), searchText];

	[self.navigationController pushViewController:resultsViewController
	                                     animated:YES];
}

@end
