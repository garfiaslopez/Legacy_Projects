//
//  Registro.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Registro : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *Nombre_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Fecha_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Empresa_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Ciudad_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Correo_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Telefono_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Usuario_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Pass_TextField;
@property (weak, nonatomic) IBOutlet UITextField *PassCon_TextField;




- (IBAction)Aceptar:(id)sender;
- (IBAction)Back:(id)sender;

@end
