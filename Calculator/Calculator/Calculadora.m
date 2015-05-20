//
//  Calculadora.m
//  Calculator
//
//  Created by Julio Castillo on 5/8/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "Calculadora.h"

@implementation Calculadora


-(CGFloat) suma:(CGFloat) a mas:(CGFloat) b{
    
    return a + b;
}

-(CGFloat) resta:(CGFloat)a menos:(CGFloat)b{
    
    return a- b;
}

-(CGFloat) division:(CGFloat)a sobre:(CGFloat)b{
    return a / b;
}

-(CGFloat) multiplicacion:(CGFloat)a por:(CGFloat)b{
    
    return a * b;
}

@end
