//
//  ToDoItem.h
//  DemoApp
//
//  Created by Julio Castillo on 5/11/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly)NSDate *creationDate;


- (void)markAsCompleted:(BOOL)isComplete;


@end
