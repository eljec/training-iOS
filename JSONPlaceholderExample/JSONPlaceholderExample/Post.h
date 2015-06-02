//
//  Post.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject


@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger userId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;

@end
