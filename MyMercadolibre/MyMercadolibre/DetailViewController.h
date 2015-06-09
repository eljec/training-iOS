//
//  DetailViewController.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/9/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCItemEntity.h"
#import "MBProgressHUD.h"
#import "MMScrollPresenter.h"
#import "MMScrollPage.h"


@interface DetailViewController : UIViewController <MBProgressHUDDelegate>
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property MBProgressHUD *progressView;
@property (strong, nonatomic) IBOutlet UIScrollView *pagerImages;

@property NSMutableDictionary *arrayRequestUrl;

- (id)initWithModelId:(NSString *)id;

@end
