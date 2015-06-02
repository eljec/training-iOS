//
//  Item.m
//  Exercise2
//
//  Created by Julio Castillo on 5/19/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "Item.h"

@implementation Item


- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];

	if (self) {
		self.title = [aDecoder decodeObjectForKey:@"title"];
		self.price = [aDecoder decodeObjectForKey:@"price"];
		self.image = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"image"]];
	}

	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.price forKey:@"price"];
	[aCoder encodeObject:UIImagePNGRepresentation(self.image) forKey:@"image"];
}

- (void)printInfo {
	NSLog(@"---------------");
	NSLog(@"Title: %@", self.title);
	NSLog(@"Price: %@", self.price);

	if (self.image == nil) {
		NSLog(@"Have not image");
	}
	else {
		NSLog(@"Has image");
	}

	NSLog(@"---------------");
}

@end
