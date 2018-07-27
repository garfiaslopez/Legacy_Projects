//
//  Configuraciones.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Configuraciones.h"

#import "Empresa.h"
#import "Configuracion.h"
#import "Empleado.h"


@interface Configuraciones()
{
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    

}


@end
@implementation Configuraciones
@synthesize DireccionIPtextField;
@synthesize PhpNameTextField;
@synthesize ContraAnteriorTextField;
@synthesize ContraConfirmTextField;
@synthesize ContraNewTextField;
@synthesize IndexEnterprise;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the vie
    
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    
}



-(void)viewDidAppear:(BOOL)animated
{
    
    [self RecargarDatos];
    [self RecargaLabels];
}

-(void)RecargarDatos
{
    
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];

}

-(void)RecargaLabels
{
    DireccionIPtextField.text = [[[EmpresasArray objectAtIndex:IndexEnterprise] Config] DireccionIP];
    PhpNameTextField.text = [[[EmpresasArray objectAtIndex:IndexEnterprise] Config] PhpName];

}

- (IBAction)Guardar:(id)sender
{
    
    Configuracion *NewConfig = [[Configuracion alloc]init];

    
    if (![DireccionIPtextField.text isEqual:@""])
    {
        [NewConfig setDireccionIP:DireccionIPtextField.text];
        [NewConfig setPhpName:PhpNameTextField.text];
        
    }
    
    if (![ContraAnteriorTextField.text isEqual:@""])
    {
        //buscar admin:
        for (int i = 0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count]; i++) {
            
            if ([[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] Nombre]isEqual:[UsuarioSesion Nombre]] ) {
                //empleado encontrado:
                
                if ([ContraAnteriorTextField.text isEqual:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] Password]])
                {
                    //Coinciden las contraseñas:
                    
                    if ([ContraNewTextField.text isEqual:ContraConfirmTextField.text] &&
                        ![ContraNewTextField.text isEqual:@""] && ![ContraConfirmTextField.text isEqual:@""])
                    {
                        //Coinciden las nuevas contraseñas y no son blancos:
                        
                        [[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] setPassword:ContraNewTextField.text];
                        
                        NSLog(@"Guardo la nueva contra  %@",ContraNewTextField.text);
                        
                        UsuarioSesion = [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i];
                        [self SaveEmpleado:UsuarioSesion key:@"Sesion"];
                        

                    }
                    else
                    {
                        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Contraseñas nuevas no coinciden." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [Error show];
                    }
                    
                }
                else
                {
                    UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"la contraseña anterior no coincide." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [Error show];
                }
                
            }
            
        }
    }
    
    
    
    
    
    [[EmpresasArray objectAtIndex:IndexEnterprise] setConfig:NewConfig];
    [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
    UIAlertView *Exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Las configuraciones de servidor se han guardado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [Exito show];
    
    
    [self RecargarDatos];
    [self RecargaLabels];
    
}

- (IBAction)Atras:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


- (Empleado *)LoadEmpleado:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Empleado *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

-(NSMutableArray *)loadArrayOfCustomObjectsWithKey:(NSString *)Key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:Key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
}

- (void)SaveEmpleado:(Empleado *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
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
