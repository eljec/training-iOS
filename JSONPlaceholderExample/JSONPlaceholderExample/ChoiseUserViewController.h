//
//  ChoiseUserViewController.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiseUserViewController : UIViewController <NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *userTable;
@property NSMutableArray *userList;


@end
