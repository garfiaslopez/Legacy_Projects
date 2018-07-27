//
//  ConfigInicial.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "ConfigInicial.h"
#import "Empresa.h"
#import "Empleado.h"

@interface ConfigInicial ()
{
    NSMutableArray *Empresas;
    Empresa *Enterprise;
    Empleado *Administrador;
    NSMutableArray *ArregloEmpleados;
    
}

@end

@implementation ConfigInicial
@synthesize AdminTextField;
@synthesize PassConfirmTextField;
@synthesize PassTextField;
@synthesize NameEnterTextField;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Empresas = [[NSMutableArray alloc]init];
    Administrador = [[Empleado alloc]init];
    ArregloEmpleados = [[NSMutableArray alloc]init];
    Enterprise = [[Empresa alloc]init];
    
    
    
    
    //Gesto para liberar teclado:
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    

    
    
}

- (IBAction)Guardar:(id)sender
{
    
    if (![AdminTextField.text isEqual:@""] && ![PassTextField.text isEqual:@""] && [PassTextField.text isEqual:PassConfirmTextField.text])
    {
        //Agrega Valores a administrador:
        [Administrador setNombre:AdminTextField.text];
        [Administrador setFechaRegistro:[NSDate date]];
        [Administrador setPassword:PassTextField.text];
        [Administrador setIsAdmin:YES];
        
        [ArregloEmpleados addObject:Administrador];
        
        if (![NameEnterTextField.text isEqual:@""])
        {
            //Agrega Valores a empresa:
            [Enterprise setNombre:NameEnterTextField.text];
            [Enterprise setEmpleados:ArregloEmpleados];
            
            
            [Empresas addObject:Enterprise];
            
            [self saveArrayOfCustomObjects:Empresas key:@"Empresas"];
            
            
            //Notificacion:
            UIAlertView *Exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Las configuraciones iniciales se han guardado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [Exito show];
            
            //salva un bool que diga que ya se hizo el ajuste inicial:
            NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
            BOOL Count = YES;
            [ContadorUserDefault setBool: Count forKey:@"FirstSession"];
            [ContadorUserDefault synchronize];
            
            //quita la vista:
            [self dismissViewControllerAnimated:YES completion:Nil];

        }
        else
        {
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Nombre Empresa Incorrecto" message:@"Ingrese un nombre para su empresa." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
        }
        
    }
    else
    {
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Contraseñas Invalidas" message:@"Ingrese contraseñas iguales en los campos para poder confirmar." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
        
        PassTextField.text = @"";
        PassConfirmTextField.text = @"";
    
    }
    
    
}

-(void)dismissKeyboard {
    [AdminTextField resignFirstResponder];
    [PassConfirmTextField resignFirstResponder];
    [PassTextField resignFirstResponder];
}


-(void)saveArrayOfCustomObjects:(NSMutableArray*)Arreglo key:(NSString*)Key{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:Arreglo];
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    [Salvar setObject:encodedObject forKey:Key];
    [Salvar synchronize];
}



-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

@end
