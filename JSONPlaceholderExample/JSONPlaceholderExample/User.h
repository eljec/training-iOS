//
//  User.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *email;
@property BOOL completed;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;
@end
