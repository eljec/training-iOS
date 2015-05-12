//
//  ToDoListTableTableViewController.h
//  DemoApp
//
//  Created by Julio Castillo on 5/11/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableTableViewController : UITableViewController

@property NSMutableArray *toDoItems;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

- (void)loadInitialData;

@end
