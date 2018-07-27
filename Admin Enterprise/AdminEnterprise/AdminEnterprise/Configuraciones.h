//
//  Configuraciones.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Configuraciones : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *DireccionIPtextField;
@property (weak, nonatomic) IBOutlet UITextField *PhpNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ContraAnteriorTextField;
@property (weak, nonatomic) IBOutlet UITextField *ContraNewTextField;
@property (weak, nonatomic) IBOutlet UITextField *ContraConfirmTextField;

@property (nonatomic) NSInteger IndexEnterprise;


- (IBAction)Guardar:(id)sender;
- (IBAction)Atras:(id)sender;


@end
