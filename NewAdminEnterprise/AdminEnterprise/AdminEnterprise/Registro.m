//
//  Registro.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Registro.h"

@interface Registro ()

@end

@implementation Registro

@synthesize Nombre_TextField;
@synthesize Fecha_TextField;
@synthesize Empresa_TextField;
@synthesize Ciudad_TextField;
@synthesize Correo_TextField;
@synthesize Telefono_TextField;
@synthesize Usuario_TextField;
@synthesize Pass_TextField;
@synthesize PassCon_TextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Aceptar:(id)sender {
    
    //INTRODUCIR FECHA CON FORMATO DD-MM-YYYY: PARA QUE PUEDA SER VALIDO:
    
    
    // Create your request string with parameter name as defined in PHP file
    NSString *myRequestString = [NSString stringWithFormat:
                                 @"Nombre=%@&Edad=%@&Empresa=%@&Ciudad=%@&Correo=%@&Telefono=%@&Usuario=%@&Password=%@&PasswordAgain=%@",
                                 Nombre_TextField.text,
                                 Fecha_TextField.text,
                                 Empresa_TextField.text,
                                 Ciudad_TextField.text,
                                 Correo_TextField.text,
                                 Telefono_TextField.text,
                                 Usuario_TextField.text,
                                 Pass_TextField.text,
                                 PassCon_TextField.text
                                 ];
    
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://adminenterprise.com/php/iOS_Api/Registro.php"]];
    // set Request Type
    [request setHTTPMethod: @"POST"];
    // Set content-type
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    // Set Request Body
    [request setHTTPBody: myRequestData];
    // Now send a request and get Response
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",response);
    
    
    if ([response isEqual:@"1" ]) {
        //registro exitoso
        
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Registro Exitoso" message:@"Favor de verificar su correo para confirmar su cuenta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
        
        Nombre_TextField.text = @"";
        Fecha_TextField.text = @"";
        Empresa_TextField.text = @"";
        Ciudad_TextField.text = @"";
        Correo_TextField.text = @"";
        Telefono_TextField.text = @"";
        Usuario_TextField.text = @"";
        Pass_TextField.text = @"";
        PassCon_TextField.text = @"";
        
        //DISMISVIEW: OR LOGIN VIEW? ....
        [self dismissViewControllerAnimated:YES completion:Nil];

        
        
    }else{
        
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error al registrar" message:response delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
    
    }
    
    
    
}

- (IBAction)Back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];

}
@end
