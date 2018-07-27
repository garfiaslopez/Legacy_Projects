//
//  Diagramas.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 21/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Diagramas.h"
#import "DiagramaFuentedepoder.h"

@interface Diagramas ()

@end

@implementation Diagramas
@synthesize Fuentedepoder;
@synthesize scroller;
@synthesize TituloNav;

-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Selecciona el diagrama que quieras ver.\nPara poder salir del diagrama toca dos veces la pantalla y a continuacion selecciona 'Regresar', Tambien puedes 'Guardar el diagrama' o consultar la 'lista de materiales'" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];

}

-(IBAction)Ledsvariables:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Leds Variables"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Pianoelectronico:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Piano Electronico"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Luznocturna:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Luz Nocturna"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Detectordehumedad:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Detector De Humedad"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Repelenteultrasonico:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Repelente Ultrasonico"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Alarmaelectronica:(id)sender{
    
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Alarma Electronica"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];



}

-(IBAction)Sirenapolicial:(id)sender{

    
      
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
        Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Sirena Policial"];
    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];
    
}




-(IBAction)Fuentedepoder:(id)sender{
        
    Fuentedepoder = [self.storyboard instantiateViewControllerWithIdentifier:@"FuentedepoderDiagrama"];
    Fuentedepoder.DiagramaAcargar = [[NSString alloc]initWithFormat:@"Fuente De Poder"];

    Fuentedepoder.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:Fuentedepoder animated:YES completion:NULL];
    

}

-(IBAction)inicio:(id)sender{
        
        
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];

    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [scroller setScrollEnabled:NO];
        
    }
    else{
        [scroller setScrollEnabled:YES];
        self.scroller.contentSize=CGSizeMake(320,592);
    }
    
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    
    return YES;
}


- (void)viewDidUnload {
    [self setTituloNav:nil];
    [super viewDidUnload];
}
@end
