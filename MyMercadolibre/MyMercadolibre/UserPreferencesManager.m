//
//  UserPreferencesManager.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "UserPreferencesManager.h"


@interface UserPreferencesManager ()

@property (nonatomic, strong) NSUserDefaults *defaults;

@property NSString *userIdSavedKey;

@end

@implementation UserPreferencesManager

- (id)init {
	if (self = [super init]) {
		self.defaults = [NSUserDefaults standardUserDefaults];
	}

	return (self);
}

- (void)saveSiteIdSelected:(NSString *)siteId {
	[self.defaults setObject:siteId forKey:@"siteIdSelected"];
}

- (NSString *)getSiteIdSelected {
	NSString *siteId = [self.defaults objectForKey:@"siteIdSelected"];
	return siteId;
}

@end
