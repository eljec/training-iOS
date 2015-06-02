//
//  JCGeneralViewController.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/1/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"
#import "MBProgressHUD.h"
#import "UserPreferencesManager.h"

@interface JCGeneralViewController : UIViewController <NSURLConnectionDelegate, UITableViewDataSource, UITableViewDelegate, MBProgressHUDDelegate> {
	@protected
	MBProgressHUD *progressView;
	UIRefreshControl *refreshControl;
	RequestManager *reqManager;
}

@property (strong, nonatomic) IBOutlet UITableView *viewTable;
@property NSMutableArray *dataList;

- (void)loadData;
- (void)showProgressViewWithMode:(MBProgressHUDMode)mode;
- (void)hideProgressView;
- (void)handleRefresh;

@end
