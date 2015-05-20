//
//  main.m
//  Calculator
//
//  Created by Julio Castillo on 5/8/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculadora.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"Calculadora");
        
        Calculadora *calc = [[Calculadora alloc] init];
        
        CGFloat a = 3.4f;
        
        CGFloat b = 6.3f;
        
        CGFloat result = [calc suma:a mas:b];
        
        NSLog(@"Resultado: %f", result);
        
    }
    return 0;
}
