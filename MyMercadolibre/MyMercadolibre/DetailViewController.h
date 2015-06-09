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
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;

@property (strong, nonatomic) IBOutlet MMScrollPresenter *viewPagerImage;

@property MBProgressHUD *progressView;

@property NSMutableDictionary *arrayRequestUrl;

- (id)initWithModelId:(NSString *)id;

@end
