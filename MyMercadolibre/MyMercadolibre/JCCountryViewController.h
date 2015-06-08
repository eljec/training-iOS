//
//  JCCountryViewController.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCCountry.h"
#import "MBProgressHUD.h"
#import "RequestManager.h"
#import "UserPreferencesManager.h"

@interface JCCountryViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MBProgressHUDDelegate>

@property (strong, nonatomic) IBOutlet UITableView *countryTable;

@end
