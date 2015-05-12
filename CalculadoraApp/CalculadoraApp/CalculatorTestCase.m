//
//  CalculatorTestCase.m
//  CalculadoraApp
//
//  Created by Julio Castillo on 5/12/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorTestCase : XCTestCase

@end

@implementation CalculatorTestCase

- (void)setUp {
	[super setUp];
	// Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
	// Put teardown code here. This method is called after the invocation of each test method in the class.
	[super tearDown];
}

- (void)testExample {
	// This is an example of a functional test case.
	XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
	// This is an example of a performance test case.
	[self measureBlock: ^{
	    // Put the code you want to measure the time of here.
	}];
}

// Calculator tests

- (void)testCalculatorSumar {
	Calculator *calc = [[Calculator alloc] init];

	CGFloat test = 12;

	CGFloat result = [calc suma:6 mas:6];

	XCTAssertEqual(test, result);
}

- (void)testCalculatorRestar {
	Calculator *calc = [[Calculator alloc] init];

	CGFloat test = 6;

	CGFloat result = [calc resta:12 menos:6];

	XCTAssertEqual(test, result);
}

- (void)testCalculatorDivision {
	Calculator *calc = [[Calculator alloc] init];

	CGFloat test = 2;

	CGFloat result = [calc division:12 sobre:6];

	XCTAssertEqual(test, result);
}

- (void)testCalculatorMultiplicacion {
	Calculator *calc = [[Calculator alloc] init];

	CGFloat test = 12;

	CGFloat result = [calc multiplicacion:3 por:4];

	XCTAssertEqual(test, result);
}

@end
