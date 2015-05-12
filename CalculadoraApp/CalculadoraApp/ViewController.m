//
//  ViewController.m
//  CalculadoraApp
//
//  Created by Julio Castillo on 5/12/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "ViewController.h"
#import "ToastView.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Init values

	self.firstNumber = 0;
	self.secondNumber = 0;

	self.engineOperation = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (IBAction)numberPressed:(id)sender {
	UIButton *button = (UIButton *)sender;

	if (self.typingNumber) {
		if (button == self.botonPunto && [self.pantalla.text containsString:@"."] == YES) return;
		self.pantalla.text = [self.pantalla.text stringByAppendingString:[button currentTitle]];
	}
	else {
		// First Time

		if (button != self.botonPunto) {
			self.pantalla.text = [button currentTitle];
			self.typingNumber = YES;
		}
	}
}

- (IBAction)calculationPressed:(id)sender {
	UIButton *operation = (UIButton *)sender;
	self.firstNumber = [self.pantalla.text floatValue];
	self.typingNumber = NO;
	self.operation = [operation currentTitle];
}

- (IBAction)equalsPressed:(id)sender {
	CGFloat resultado = 0;

	NSLog(@"---Start Operation---");

	// If we did not put a second value of the operation, we show a message
	if (self.typingNumber == NO && self.secondNumber == 0) {
		NSLog(@"There is not a second value !!!");

		[ToastView showToastInParentView:self.view withText:@"Complete operation, please" withDuaration:2.0];
	}
	else {
		if (self.operation == nil) {
			// Remove the text in the result's label

			NSLog(@"There is not an operation selected !!");
			self.pantalla.text = @"";
		}
		else {
			// Get second value

			self.secondNumber = [self.pantalla.text intValue];

			// Check operations

			if ([self.operation isEqualToString:@"+"]) {
				//resultado = self.firstNumber + self.secondNumber;

				resultado = [self.engineOperation suma:self.firstNumber mas:self.secondNumber];
			}
			else if ([self.operation isEqualToString:@"-"]) {
				//resultado = self.firstNumber - self.secondNumber;
				resultado = [self.engineOperation resta:self.firstNumber menos:self.secondNumber];
			}
			else if ([self.operation isEqualToString:@"/"]) {
				//resultado = self.firstNumber / self.secondNumber;

				resultado = [self.engineOperation division:self.firstNumber sobre:self.secondNumber];
			}
			else {
				//resultado = self.firstNumber / self.secondNumber;

				resultado = [self.engineOperation multiplicacion:self.firstNumber por:self.secondNumber];
			}

			self.pantalla.text = [NSString stringWithFormat:@"%f", resultado];

			NSLog(@"Operation name: %@", self.operation);
			NSLog(@"First number: %f", self.firstNumber);
			NSLog(@"Second number: %f", self.secondNumber);
			NSLog(@"Result: %f", resultado);
		}
	}
	NSLog(@"---End Operation---");

	// Reset values to a new operation

	self.typingNumber = NO;
	self.operation = nil;
	self.secondNumber = 0;
}

- (IBAction)clearAll:(id)sender {
	self.pantalla.text = @"0";
	self.typingNumber = NO;
	self.operation = nil;
	self.secondNumber = 0;
	self.firstNumber = 0;
}

@end
