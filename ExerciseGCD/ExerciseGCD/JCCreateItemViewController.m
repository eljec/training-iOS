//
//  JCCreateItemViewController.m
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCCreateItemViewController.h"
#import "ItemManager.h"

@interface JCCreateItemViewController ()

@end

@implementation JCCreateItemViewController
UIImage *currentImage;
BOOL isReady = NO;


- (instancetype)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"New Item";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveItem)];

	self.navigationItem.rightBarButtonItem = nextButton;

	// Add click listener in the ImageView


	UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lunchImageSelector)];
	singleTap.numberOfTapsRequired = 1;
	[self.itemImageView setUserInteractionEnabled:YES];
	[self.itemImageView addGestureRecognizer:singleTap];
}

- (void)lunchImageSelector {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)saveItem {
	ItemManager *manager = [[ItemManager alloc] init];

	NSString *title = self.titleTextView.text;
	NSString *price = self.priceTextView.text;

	NSError *error = nil;

	// Try to crete a new Item
	Item *newItem = [manager generateNewItemWith:title price:price andImage:
	                 currentImage          error:&error];

	if (error == nil) {
		// Save the new Item
		[manager saveItem:newItem];

		// Go to the main panel

		[self.navigationController popToRootViewControllerAnimated:YES];
	}
	else {
		// Show the error

		[self showErrorMessage];
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	currentImage = info[UIImagePickerControllerEditedImage];
	self.itemImageView.image = currentImage;
	[picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)showErrorMessage {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing required data!" message:@"Please complete with all requiered information" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

@end
