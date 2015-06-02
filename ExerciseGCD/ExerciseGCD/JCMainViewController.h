//
//  JCMainViewController.h
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMainViewController : UIViewController <UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *itemTable;

- (void)openActionOptions;
@end
