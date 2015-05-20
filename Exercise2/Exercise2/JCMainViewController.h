//
//  JCMainViewController.h
//  Exercise2
//
//  Created by Julio Castillo on 5/18/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) IBOutlet UITableView *itemTable;

- (IBAction)addItem:(id)sender;

@end
