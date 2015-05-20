//
//  StepThreeViewController.m
//  Exercise2
//
//  Created by Julio Castillo on 5/19/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCStepThreeViewController.h"
#import "JCMainViewController.h"

@interface JCStepThreeViewController ()

- (void)createNewItem;


@end

@implementation JCStepThreeViewController

Item *myItem;


- (id)initWithItemEntity:(Item *)itemEntity {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Step 3";

		NSLog(@"Init step 3");

		[itemEntity printInfo];

		myItem = itemEntity;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	//Change Next text or Save button
	UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(createNewItem)];

	self.navigationItem.rightBarButtonItem =  saveBarButtonItem;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)selectImage:(id)sender {
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

	[self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	self.imageSelected.image = chosenImage;

	[picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)createNewItem {
	if (self.imageSelected.image == nil) {
		[self showErrorMessage];

		return;
	}

	myItem.image = self.imageSelected.image;


	[self persistItem];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Item saved successfully." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
	// the user clicked OK
	if (buttonIndex == 0 && self.imageSelected.image != nil) {
		// Call the main view

		//JCMainViewController *mainController = [[JCMainViewController alloc] init];


		//[self.navigationController pushViewController:mainController
		//                                    animated:YES];

		[self.navigationController popToRootViewControllerAnimated:YES];
	}
}

- (void)persistItem {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSData *savedData = [userDefaults valueForKey:@"itemsData"];

	NSMutableArray *items = nil;
	if (savedData) {
		items = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
	}

	if (!items) {
		items = [NSMutableArray array];
	}

	[items addObject:myItem];

	//items = [NSMutableArray array];


	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:items];

	[userDefaults setObject:data forKey:@"itemsData"];
	[userDefaults synchronize];
}

@end
