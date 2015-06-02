//
//  JCPostDetailViewController.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/1/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface JCPostDetailViewController : UIViewController

- (id)initWithPost:(Post *)post;
@property (strong, nonatomic) IBOutlet UILabel *titleView;
@property (strong, nonatomic) IBOutlet UITextView *bodyView;

@end
