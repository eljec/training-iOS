//
//  PhotoViewController.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "Album.h"

@interface PhotoViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, MBProgressHUDDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *photoCollectionView;


- (id)initWithPost:(Album *)album;

@end
