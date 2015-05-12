//
//  ToDoItem.m
//  DemoApp
//
//  Created by Julio Castillo on 5/11/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "ToDoItem.h"

// Class extention to hide internal data

@interface ToDoItem ()

@property NSDate *completionDate;


@end

// Implementation
@implementation ToDoItem


- (void)markAsCompleted:(BOOL)isComplete {
    self.completed = isComplete;
    [self setCompletionDate];
}
- (void)setCompletionDate {
    if (self.completed) {
        self.completionDate = [NSDate date];
    } else {
        self.completionDate = nil;
    }
}

@end

