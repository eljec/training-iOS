//
//  DetailViewController.h
//  Exercise2
//
//  Created by Julio Castillo on 5/20/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController


- (id)initWithItemEntity:(Item *)itemEntity;
@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;
@property (strong, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailSubtitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailPriceLabel;

@end
