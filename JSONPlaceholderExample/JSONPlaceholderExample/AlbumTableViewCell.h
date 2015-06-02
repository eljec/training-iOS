//
//  AlbumTableViewCell.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *albumImage;
@property (strong, nonatomic) IBOutlet UILabel *albumTitle;

@end
