//
//  JCCountry.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCCountry.h"

@implementation JCCountry


- (id)initWithDataResponse:(NSDictionary *)dataResponse {
	if (self = [super init]) {
		NSString *idString = [dataResponse objectForKey:@"id"];
		NSString *name = [dataResponse objectForKey:@"name"];

		self.id = idString;
		self.name = name;
	}
	return(self);
}

@end
