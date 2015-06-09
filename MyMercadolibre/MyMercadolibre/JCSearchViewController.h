//
//  JCSearchViewController.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface JCSearchViewController : UIViewController <MBProgressHUDDelegate>

- (IBAction)search:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *searchTextView;
@property (strong, nonatomic) IBOutlet UIButton *btnSearch;

@end
