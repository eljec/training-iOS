//
//  Item.h
//  Exercise2
//
//  Created by Julio Castillo on 5/19/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Item : NSObject


@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) UIImage *image;


- (void)printInfo;
@end
