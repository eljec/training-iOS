//
//  PhotoCollectionViewCell.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *photoTitle;

@end
