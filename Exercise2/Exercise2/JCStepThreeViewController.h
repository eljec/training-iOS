//
//  StepThreeViewController.h
//  Exercise2
//
//  Created by Julio Castillo on 5/19/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCGeneralViewController.h"

@interface JCStepThreeViewController : JCGeneralViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageSelected;

- (id)initWithItemEntity:(Item *)itemEntity;

- (IBAction)selectImage:(id)sender;

@end
