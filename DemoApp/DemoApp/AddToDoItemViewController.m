//
//  AddToDoItemViewController.m
//  DemoApp
//
//  Created by Julio Castillo on 5/11/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.

	if (sender != self.saveButton) {
		return;
	}
	else {
		if (self.textField.text.length > 0) {
			//Create a new Item

			self.toDoItem = [[ToDoItem alloc] init];
			self.toDoItem.itemName = self.textField.text;
			self.toDoItem.completed = NO;
		}
	}
}

@end
