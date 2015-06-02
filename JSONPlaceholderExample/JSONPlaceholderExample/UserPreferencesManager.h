//
//  UserPreferencesManager.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserPreferencesManager : NSObject

- (void)saveUserIdSelected:(NSInteger)userId;
- (NSInteger)getUserIdSelected;

@end
