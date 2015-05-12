//
//  ToastView.h
//  CalculadoraApp
//
//  Created by Julio Castillo on 5/12/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastView : UIView


@property (strong, nonatomic) NSString *text;

+ (void)showToastInParentView:(UIView *)parentView withText:(NSString *)text withDuaration:(float)duration;


@end
