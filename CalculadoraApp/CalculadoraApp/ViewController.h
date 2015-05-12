//
//  ViewController.h
//  CalculadoraApp
//
//  Created by Julio Castillo on 5/12/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController

// Resultados

@property (weak, nonatomic) IBOutlet UILabel *pantalla;


// Botones
@property (weak, nonatomic) IBOutlet UIButton *botonUno;
@property (weak, nonatomic) IBOutlet UIButton *botonDos;
@property (weak, nonatomic) IBOutlet UIButton *botonTres;
@property (weak, nonatomic) IBOutlet UIButton *botonCuatro;
@property (weak, nonatomic) IBOutlet UIButton *botonCinco;
@property (weak, nonatomic) IBOutlet UIButton *botonSeis;
@property (weak, nonatomic) IBOutlet UIButton *botonSiete;
@property (weak, nonatomic) IBOutlet UIButton *botonOcho;
@property (weak, nonatomic) IBOutlet UIButton *botonNueve;
@property (weak, nonatomic) IBOutlet UIButton *botonCero;
@property (weak, nonatomic) IBOutlet UIButton *botonPunto;

// Operaciones
@property (weak, nonatomic) IBOutlet UIButton *botonIgual;
@property (weak, nonatomic) IBOutlet UIButton *botonMultiplicacion;
@property (weak, nonatomic) IBOutlet UIButton *botonDivision;
@property (weak, nonatomic) IBOutlet UIButton *botonResta;
@property (weak, nonatomic) IBOutlet UIButton *botonSuma;



@property (nonatomic) BOOL typingNumber; //check if user is typing a number
@property (nonatomic) CGFloat firstNumber;
@property (nonatomic) CGFloat secondNumber;
@property (nonatomic, copy) NSString *operation; // plus or minus operation

@property (nonatomic) Calculator *engineOperation;

- (IBAction)numberPressed:(id)sender;
- (IBAction)calculationPressed:(id)sender;
- (IBAction)equalsPressed:(id)sender;
- (IBAction)clearAll:(id)sender;

@end
