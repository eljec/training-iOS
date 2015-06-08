//
//  JCSearchResultTableViewCell.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCSearchResultTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *productImageView;
@property (strong, nonatomic) IBOutlet UILabel *productTitle;
@property (strong, nonatomic) IBOutlet UILabel *productPrice;

@end
