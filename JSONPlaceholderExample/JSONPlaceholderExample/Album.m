//
//  Album.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "Album.h"

@implementation Album


- (id)initWithDataResponse:(NSDictionary *)dataResponse {
	if (self = [super init]) {
		NSString *idString = [dataResponse objectForKey:@"id"];
		NSString *userIdString = [dataResponse objectForKey:@"userId"];
		NSString *title = [dataResponse objectForKey:@"title"];


		self.id = [idString intValue];
		self.userId = [userIdString intValue];
		self.title = title;
	}
	return(self);
}

@end
