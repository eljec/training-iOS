//
//  Album.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject


@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger userId;
@property (nonatomic, copy) NSString *title;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;


@end
