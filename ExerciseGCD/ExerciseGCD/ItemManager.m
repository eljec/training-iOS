//
//  ItemManager.m
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "ItemManager.h"

@implementation ItemManager



- (id)init {
	self = [super init];
	if (self) {
		self.itemSavedKey = @"ArrayItems";
	}
	return self;
}

- (Item *)generateNewItemWith:(NSString *)title price:(NSString *)price andImage:(UIImage *)image error:(NSError **)error {
	// Check if the texts are empty


	if ([title isEqualToString:@""] || [price isEqualToString:@""] || image == nil) {
		//An error occurred
		NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
		[errorDetail setValue:@"DataEntryError" forKey:NSLocalizedDescriptionKey];
		*error = [NSError errorWithDomain:@"ItemManager" code:100 userInfo:errorDetail];

		return nil;
	}
	else {
		// Create the Item


		Item *item = [[Item alloc] init];

		item.title = title;

		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
		[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
		item.price = [numberFormatter numberFromString:price];

		item.image = image;

		return item;
	}
}

- (void)saveItem:(Item *)item {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSData *savedData = [userDefaults valueForKey:self.itemSavedKey];

	NSMutableArray *items = nil;
	if (savedData) {
		items = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
	}

	if (!items) {
		items = [NSMutableArray array];
	}

	[items addObject:item];

	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:items];

	[userDefaults setObject:data forKey:self.itemSavedKey];
	[userDefaults synchronize];
}

- (NSMutableArray *)getListOfItems {
	// Try to load the saved objects

	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *savedData = [defaults valueForKey:self.itemSavedKey];

	NSMutableArray *items = nil;
	if (savedData) {
		items = [NSKeyedUnarchiver unarchiveObjectWithData:savedData];
	}

	if (!items) {
		items = [NSMutableArray array];
	}

	return items;
}

- (NSMutableArray *)getMockListOfItems:(NSNumber *)itemNunber {
	NSMutableArray *result = [NSMutableArray array];
	Item *aux = nil;
	UIImage *auxImage = [UIImage imageNamed:@"mock_1.jpeg"];

	for (int i = 1; i <= [itemNunber intValue]; i++) {
		aux = [self generateNewItemWith:[NSString stringWithFormat:@"%@/%d", @"Item", i] price:[NSString stringWithFormat:@"%d", i] andImage:auxImage error:nil];

		[result addObject:aux];

		NSLog(@"Item created: %d", i);
	}

	return result;
}

- (void)cleanAllItem {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray *items = [NSMutableArray array];
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:items];

	[userDefaults setObject:data forKey:self.itemSavedKey];
	[userDefaults synchronize];
}

@end
