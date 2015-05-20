//
//  JCStepOneViewController.h
//  Exercise2
//
//  Created by Julio Castillo on 5/18/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCGeneralViewController.h"
#import "Item.h"

@interface JCStepOneViewController : JCGeneralViewController


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *subtitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;


//@property (nonatomic, strong) Item *currentItem;

@end
