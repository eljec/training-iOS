//
//  JCCountry.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCCountry : NSObject

@property NSString *id;
@property NSString *name;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;

@end
