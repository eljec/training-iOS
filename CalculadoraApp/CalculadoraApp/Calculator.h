//
//  Calculator.h
//  CalculadoraApp
//
//  Created by Julio Castillo on 5/12/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Calculator : NSObject

- (CGFloat)suma:(CGFloat)a mas:(CGFloat)b;

- (CGFloat)resta:(CGFloat)a menos:(CGFloat)b;

- (CGFloat)multiplicacion:(CGFloat)a por:(CGFloat)b;

- (CGFloat)division:(CGFloat)a sobre:(CGFloat)b;
@end
