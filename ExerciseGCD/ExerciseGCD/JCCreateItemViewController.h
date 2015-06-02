//
//  JCCreateItemViewController.h
//  ExerciseGCD
//
//  Created by Julio Castillo on 5/27/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCCreateItemViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *titleTextView;
@property (strong, nonatomic) IBOutlet UITextField *priceTextView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;

@end
