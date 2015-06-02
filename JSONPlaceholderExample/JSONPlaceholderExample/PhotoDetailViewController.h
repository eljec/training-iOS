//
//  PhotoDetailViewController.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "Photo.h"

@interface PhotoDetailViewController : UIViewController <MBProgressHUDDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *photoDetailImageView;
@property (strong, nonatomic) IBOutlet UILabel *photoDetailTitle;


- (id)initWithPhoto:(Photo *)photo;

@end
