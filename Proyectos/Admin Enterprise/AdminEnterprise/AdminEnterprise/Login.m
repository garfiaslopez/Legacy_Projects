//
//  Login.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Login.h"
#import "MainWindow.h"
#import "Empresa.h"
#import "Empleado.h"

@interface Login ()
{
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    
    
}

@end

@implementation Login
@synthesize UsuarioTextFiled;
@synthesize PassTextField;
@synthesize IndexEnterprise;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    //Gesto para ocultar teclado al tocar la pantalla.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    


}


-(void)viewDidAppear:(BOOL)animated
{

    [self RecargaDatos];
}



-(void)RecargaDatos
{

    NSLog(@"INDEX: %lu",IndexEnterprise);
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];

}

- (IBAction)Login:(id)sender
{
    
    BOOL Encontrado = false;
    
    for ( int i = 0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count]; i++) {
        
        
        if ([UsuarioTextFiled.text isEqual:[[[[EmpresasArray objectAtIndex:IndexEnterprise]Empleados] objectAtIndex:i] Nombre]]  &&
            [PassTextField.text isEqual:[[[[EmpresasArray objectAtIndex:IndexEnterprise]Empleados] objectAtIndex:i] Password]]) {
            
            Encontrado = true;
            NSLog(@"ENCONTRADO");
            
            //Set The Day:
            [[[[EmpresasArray objectAtIndex:IndexEnterprise]Empleados] objectAtIndex:i] setDiaInicio:[NSDate date]];
            
            //save empleado sesion:
            [self SaveEmpleado:[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] key:@"Sesion"];
            
            
            UsuarioTextFiled.text = @"";
            PassTextField.text = @"";
            
            
            //LOAD THE MAINVIEW:
            
            UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
            
            MainView = [Main instantiateViewControllerWithIdentifier:@"MainView"];
            MainView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            MainView.IndexEnterprise = IndexEnterprise;
            
            [self presentViewController:MainView animated:YES completion:NULL];
            
            
        }
        
    }
    
    if (Encontrado == false)
    {
        
        UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Usuario No Encontrado" message:@"Por favor escriba de manera correcta su nombre y su contraseña." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
        
    }
    
    
    
}

- (IBAction)Atras:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dismissKeyboard
{
    [UsuarioTextFiled resignFirstResponder];
    [PassTextField resignFirstResponder];
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


-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}


@end
