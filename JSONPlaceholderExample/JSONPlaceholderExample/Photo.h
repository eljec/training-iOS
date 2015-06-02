//
//  Photo.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject


@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger albumId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *thumbnailUrl;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;



@end
