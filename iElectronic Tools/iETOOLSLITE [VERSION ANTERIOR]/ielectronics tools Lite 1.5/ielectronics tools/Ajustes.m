//
//  Ajustes.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 23/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "Ajustes.h"
#import "Herramientas.h"

@interface Ajustes ()

@end

@implementation Ajustes


-(IBAction)guardaingles:(id)sender{
    
    
    NSString *savestringingles = @"ingles";
    NSUserDefaults *defaultsingles = [NSUserDefaults standardUserDefaults];
    [defaultsingles setObject:savestringingles forKey:@"savedstring"];
    [defaultsingles synchronize];

    UIAlertView *mensaje = [[UIAlertView alloc] initWithTitle:@"¡Right!" message:@"Now The App Will Be In English Language" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [mensaje show];
    

    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboardIngles" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

    
}
-(IBAction)guardaespanol:(id)sender{
    
    
    NSString *savestringespanol = @"espanol";
    NSUserDefaults *defaultsespanol = [NSUserDefaults standardUserDefaults];
    [defaultsespanol setObject:savestringespanol forKey:@"savedstring"]; [defaultsespanol synchronize];
    
    UIAlertView *mensaje = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"Ahora la aplicacion estara en idioma español" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [mensaje show];
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

    
}

-(IBAction)cerrar:(id)sender{

    [self dismissViewControllerAnimated:YES completion:NULL];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
