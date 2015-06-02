//
//  ItemTableViewCell.h
//  Exercise2
//
//  Created by Julio Castillo on 5/20/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (strong, nonatomic) IBOutlet UILabel *itemSubtitle;
@property (strong, nonatomic) IBOutlet UILabel *itemPrice;

@end
