//
//  Photo.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "Photo.h"

@implementation Photo


- (id)initWithDataResponse:(NSDictionary *)dataResponse {
	if (self = [super init]) {
		NSString *idString = [dataResponse objectForKey:@"id"];
		NSString *albumIdString = [dataResponse objectForKey:@"albumId"];
		NSString *title = [dataResponse objectForKey:@"title"];
		NSString *url = [dataResponse objectForKey:@"url"];
		NSString *thumbnailUrl = [dataResponse objectForKey:@"thumbnailUrl"];


		self.id = [idString intValue];
		self.albumId = [albumIdString intValue];
		self.title = title;
		self.url = url;
		self.thumbnailUrl = thumbnailUrl;
	}
	return(self);
}

@end
