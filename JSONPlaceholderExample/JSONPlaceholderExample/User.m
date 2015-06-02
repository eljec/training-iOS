//
//  User.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDataResponse:(NSDictionary *)dataResponse {
	if (self = [super init]) {
		NSString *idString = [dataResponse objectForKey:@"id"];

		NSLog(@"id: %@", idString);

		NSString *userName = [dataResponse objectForKey:@"username"];
		NSString *name = [dataResponse objectForKey:@"name"];
		NSString *email = [dataResponse objectForKey:@"email"];


		self.id = [idString intValue];
		self.userName = userName;
		self.name = name;
		self.email = email;
	}
	return(self);
}

@end
