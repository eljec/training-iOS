//
//  ItemManager.h
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ItemManager : NSObject

@property NSString *itemSavedKey;

- (Item *)generateNewItemWith:(NSString *)title price:(NSString *)price andImage:(UIImage *)image error:(NSError **)error;
- (void)saveItem:(Item *)item;
- (NSMutableArray *)getListOfItems;
- (NSMutableArray *)getMockListOfItems:(NSNumber *)itemNunber;
- (void)cleanAllItem;

@end
