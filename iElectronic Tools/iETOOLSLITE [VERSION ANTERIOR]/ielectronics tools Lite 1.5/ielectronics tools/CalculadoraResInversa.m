//
//  CalculadoraResInversa.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 17/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "CalculadoraResInversa.h"

@interface CalculadoraResInversa ()

@end

@implementation CalculadoraResInversa
@synthesize unidad;
@synthesize valor;
@synthesize banda1;
@synthesize banda2;
@synthesize banda3;
@synthesize banda4;
@synthesize tolerancia;
@synthesize tolerancialabel;
@synthesize TituloNav;
@synthesize Scroller;


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}

-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Inserta en el campo de texto el valor de la resistencia en Ohms, presiona en calcular y se calculara los colores de esa resistencia." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];

}

-(IBAction)calcular:(id)sender{
    
    double Numbanda = 0;
    double Numbanda1 = 0;
    double Numbanda2 = 0;
    double NumbandaCeros = 0;
    double Divisor = 10000000000;
    double temp = 0;
    double temp2 = 0;
    double tempceros = 9;
    int tempentero = 0 ;
    
    Numbanda = [valor.text doubleValue];
    
    if (Numbanda == 0) {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Invalido" message:@"Por favor inserta un valor real para poder calcular el color de tu resistencia" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        NSLog(@"Deberia salir el puto alertview");
        
        [error show];
    }
    
    if (unidad.selectedSegmentIndex == 0) {
        Numbanda = Numbanda/1000;
    }
    if (unidad.selectedSegmentIndex == 1) {
        Numbanda = Numbanda;
    }
    if (unidad.selectedSegmentIndex == 2) {
        Numbanda = Numbanda*1000;
    }
    if (unidad.selectedSegmentIndex == 3) {
        Numbanda = Numbanda*1000000;
    }

    while (temp == 0) {
        temp2 = Numbanda/Divisor;
        
        if (temp2 == 0) {
            temp++;
        }
        
        if (temp2 >= 1) {
            tempentero = temp2;
            Numbanda1 = tempentero;
            temp2 = tempentero * Divisor;
            Numbanda = Numbanda - temp2;
            Divisor = Divisor/10;
            Numbanda2 = Numbanda/Divisor;
            temp = 1;
            NumbandaCeros = tempceros;
        }
        Divisor = Divisor/10;
        temp2 = 0;
        tempceros--;
    }
    //CORRIJE LOS DECIMALES!! XD
    
    NSLog(@"%lf",Numbanda1);
    if (Numbanda1 == 0) {
        banda1.image = [UIImage imageNamed:@"Negro.png"];
    }
    if (Numbanda1 == 1) {
        banda1.image = [UIImage imageNamed:@"Marron.png"];
    }
    if (Numbanda1 == 2) {
        banda1.image = [UIImage imageNamed:@"Rojo.png"];
    }
    if (Numbanda1 == 3) {
        banda1.image = [UIImage imageNamed:@"Naranja.png"];
    }
    if (Numbanda1 == 4) {
        banda1.image = [UIImage imageNamed:@"Amarillo.png"];
    }
    if (Numbanda1 == 5) {
        banda1.image = [UIImage imageNamed:@"Verde.png"];
    }
    if (Numbanda1 == 6) {
        banda1.image = [UIImage imageNamed:@"Azul.png"];
    }
    if (Numbanda1 == 7) {
        banda1.image = [UIImage imageNamed:@"Violeta.png"];
    }
    if (Numbanda1 == 8) {
        banda1.image = [UIImage imageNamed:@"Gris.png"];
    }
    if (Numbanda1 == 9) {
        banda1.image = [UIImage imageNamed:@"Blanco.png"];
    }
    
    NSLog(@"%lf",Numbanda2);
    if (Numbanda2 >= 0 && Numbanda2 < 1) {
        banda2.image = [UIImage imageNamed:@"Negro.png"];
    }
    if (Numbanda2 >= 1 && Numbanda2 < 2) {
        banda2.image = [UIImage imageNamed:@"Marron.png"];
    }
    if (Numbanda2 >= 2 && Numbanda2 < 3) {
        banda2.image = [UIImage imageNamed:@"Rojo.png"];
    }
    if (Numbanda2 >= 3 && Numbanda2 < 4) {
        banda2.image = [UIImage imageNamed:@"Naranja.png"];
    }
    if (Numbanda2 >= 4 && Numbanda2 < 5) {
        banda2.image = [UIImage imageNamed:@"Amarillo.png"];
    }
    if (Numbanda2 >= 5 && Numbanda2 < 6) {
        banda2.image = [UIImage imageNamed:@"Verde.png"];
    }
    if (Numbanda2 >= 6 && Numbanda2 < 7) {
        banda2.image = [UIImage imageNamed:@"Azul.png"];
    }
    if (Numbanda2 >= 7 && Numbanda2 < 8) {
        banda2.image = [UIImage imageNamed:@"Violeta.png"];
    }
    if (Numbanda2 >= 8 && Numbanda2 < 9) {
        banda2.image = [UIImage imageNamed:@"Gris.png"];
    }
    if (Numbanda2 >= 9 && Numbanda2 < 10) {
        banda2.image = [UIImage imageNamed:@"Blanco.png"];
    }
    
    NSLog(@"%lf",NumbandaCeros);
    if (NumbandaCeros == 0) {
        banda3.image = [UIImage imageNamed:@"Negro.png"];
    }
    if (NumbandaCeros == 1) {
        banda3.image = [UIImage imageNamed:@"Marron.png"];
    }
    if (NumbandaCeros == 2) {
        banda3.image = [UIImage imageNamed:@"Rojo.png"];
    }
    if (NumbandaCeros == 3) {
        banda3.image = [UIImage imageNamed:@"Naranja.png"];
    }
    if (NumbandaCeros == 4) {
        banda3.image = [UIImage imageNamed:@"Amarillo.png"];
    }
    if (NumbandaCeros == 5) {
        banda3.image = [UIImage imageNamed:@"Verde.png"];
    }
    if (NumbandaCeros == 6) {
        banda3.image = [UIImage imageNamed:@"Azul.png"];
    }
    if (NumbandaCeros == 7) {
        banda3.image = [UIImage imageNamed:@"Violeta.png"];
    }
    if (NumbandaCeros == 8) {
        banda3.image = [UIImage imageNamed:@"Gris.png"];
    }
    if (NumbandaCeros == 9) {
        banda3.image = [UIImage imageNamed:@"Blanco.png"];
    }
    
    switch (tolerancia.selectedSegmentIndex){
        case 0:
            banda4.image = [UIImage imageNamed:@"Marron.png"];
            break;
        case 1:
            banda4.image = [UIImage imageNamed:@"Rojo.png"];
            break;
        case 2:
            banda4.image = [UIImage imageNamed:@"Oro.png"];
            break;
        case 3:
            banda4.image = [UIImage imageNamed:@"Gris.png"];
            break;
        default:
            break;
    }


}

-(IBAction)inicio:(id)sender{
    
    [valor resignFirstResponder];
    
    //liberar el teclado antes de cambiar  a inicio.
    
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
    
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    [self.TituloNav setTitleTextAttributes:@{
                                          UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:10],
                                          UITextAttributeTextColor:[UIColor whiteColor]
                                          }];
    valor.font = [UIFont fontWithName:@"DS-Digital" size:30];

    /*

    tolerancialabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:15];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [unidad setTitleTextAttributes:attributes
                          forState:UIControlStateNormal];
    
    [tolerancia setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:20]}];
*/
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
}
- (void)keyboardDidShow:(NSNotification *)notification {
        
        if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
            
            [Scroller setScrollEnabled:YES];
            self.Scroller.contentSize=CGSizeMake(320,608);
        }
        else{
            
            self.Scroller.contentSize=CGSizeMake(320,700);
            
        }
}
    
-(void)keyboardDidHide:(NSNotification *)notification{
        
        
        if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
            
            [self.Scroller setContentOffset:CGPointZero animated:YES];
            
            [Scroller setScrollEnabled:NO];
            
        }
        
        else{
            
            self.Scroller.contentSize=CGSizeMake(320,592);
            [self.Scroller setContentOffset:CGPointZero animated:YES];
        }
        
}

    


-(void)dismissKeyboard {
    
    [valor resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    
    return NO;
}

- (void)viewDidUnload {
    [self setScroller:nil];
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
