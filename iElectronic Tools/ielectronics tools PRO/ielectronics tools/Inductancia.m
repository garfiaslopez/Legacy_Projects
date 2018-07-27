//
//  Inductancia.m
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 13/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//
#include <math.h>
#import "Inductancia.h"



@interface Inductancia ()

@end

@implementation Inductancia

@synthesize TituloNav;
@synthesize AreaTextField;
@synthesize LongTextField;
@synthesize InductanciaTextField;
@synthesize PermTextField;
@synthesize VueltasTextField;
@synthesize UnidadesArea;
@synthesize UnidadesLongitud;
@synthesize UnidadesInductancia;
@synthesize Resultado1Label;
@synthesize Resultado2Label;
@synthesize Resultado3Label;
@synthesize Unidad1Label;
@synthesize Unidad2Label;
@synthesize Unidad3Label;
@synthesize Scroller;


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
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    AreaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    LongTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    PermTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    VueltasTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    InductanciaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    Resultado1Label.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Resultado2Label.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Resultado3Label.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
        
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    
    [AreaTextField resignFirstResponder];
    [LongTextField resignFirstResponder];
    [InductanciaTextField resignFirstResponder];
    [PermTextField resignFirstResponder];
    [VueltasTextField resignFirstResponder];

    
}


- (void)keyboardDidShow:(NSNotification *)notification {
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,710);
    }
    else{
        
        self.Scroller.contentSize=CGSizeMake(320,805);
        
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setAreaTextField:nil];
    [self setLongTextField:nil];
    [self setInductanciaTextField:nil];
    [self setPermTextField:nil];
    [self setVueltasTextField:nil];
    [self setUnidadesArea:nil];
    [self setUnidadesLongitud:nil];
    [self setUnidadesInductancia:nil];
    [self setResultado1Label:nil];
    [self setResultado2Label:nil];
    [self setResultado3Label:nil];
    [self setUnidad1Label:nil];
    [self setUnidad2Label:nil];
    [self setUnidad3Label:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
- (IBAction)Calcular:(id)sender {
    
    double constanteP = 12.56e-7;
    
    double vueltas=0, permeabilidad=0, longitud=0, Area=0, inductancia=0,tempo1=0,tempo2=0,tempo3=0,tmp=0;
    
    vueltas = [VueltasTextField.text doubleValue];
    permeabilidad = [PermTextField.text doubleValue];
    longitud = [LongTextField.text doubleValue];
    Area = [AreaTextField.text doubleValue];
    inductancia = [InductanciaTextField.text doubleValue];
    NSLog(@"Constantep %.10lf",constanteP);
    NSLog(@"Tempo1 %.10lf",tempo1);
    NSLog(@"Vueltas %.10lf",vueltas);
    NSLog(@"Permeabilidad %.10lf",permeabilidad);
    NSLog(@"Longitud %.10lf",longitud);
    NSLog(@"Area %.10lf",Area);
    NSLog(@"Inductancia %.10lf",inductancia);

    
    
    switch (UnidadesArea.selectedSegmentIndex) {
        case 0:
            Area = Area;
            break;
        case 1:
            tmp = 2*Area;
            Area = 0.785 * pow(tmp, 2);
            break;
        case 2:
            Area = 0.785 * pow(Area, 2);
            break;
        default:
            break;
    }
    
    switch (UnidadesLongitud.selectedSegmentIndex) {
        case 0:
            longitud = longitud/1000;
            break;
        case 1:
            longitud = longitud/100;
            break;
        case 2:
            longitud = longitud;
            break;
        default:
            break;
    }
    
    switch (UnidadesInductancia.selectedSegmentIndex) {
        case 0:
            inductancia = inductancia/1000000;
            break;
        case 1:
            inductancia = inductancia/1000;
            break;
        case 2:
            inductancia = inductancia;
            break;
        default:
            break;
    }
    
    
    NSLog(@"Vueltas %.10lf",vueltas);
    NSLog(@"Permeabilidad %.10lf",permeabilidad);
    NSLog(@"Longitud %.10lf",longitud);
    NSLog(@"Area %.10lf",Area);
    NSLog(@"Inductancia %.10lf",inductancia);

    
    
    if (inductancia == 0) {
        
        tempo1 =  constanteP * permeabilidad * Area * pow(vueltas, 2);
        NSLog(@"Constantep %.10lf",constanteP);
        NSLog(@"Tempo1 %.10lf",tempo1);
        inductancia = tempo1/longitud;
        
        Resultado3Label.text = [[NSString alloc]initWithFormat:@"%.4lf",inductancia];
        Resultado2Label.text = [[NSString alloc]initWithFormat:@"%.4lf",inductancia*1000];
        Resultado1Label.text = [[NSString alloc]initWithFormat:@"%.4lf",inductancia*1000000];
        
        
    }
    else if(vueltas == 0){
        
        tempo1 = inductancia * longitud;
        tempo2 = constanteP * permeabilidad * Area;
        tempo3 = tempo1/tempo2;
        vueltas = sqrt(tempo3);
        
        Resultado3Label.text = [[NSString alloc]initWithFormat:@""];
        Resultado2Label.text = [[NSString alloc]initWithFormat:@"%.4lf",vueltas];
        Resultado1Label.text = [[NSString alloc]initWithFormat:@""];

        Unidad1Label.text = [[NSString alloc]initWithFormat:@""];
        Unidad2Label.text = [[NSString alloc]initWithFormat:@"Vueltas"];
        Unidad3Label.text = [[NSString alloc]initWithFormat:@""];
        
    
    }
    else if (permeabilidad == 0){
        
        tempo1 = inductancia * longitud;
        tempo2 = constanteP * pow(vueltas, 2) * Area;
        permeabilidad = tempo1/tempo2;
        
        Resultado3Label.text = [[NSString alloc]initWithFormat:@""];
        Resultado2Label.text = [[NSString alloc]initWithFormat:@"%.4lf",permeabilidad];
        Resultado1Label.text = [[NSString alloc]initWithFormat:@""];
        
        Unidad1Label.text = [[NSString alloc]initWithFormat:@""];
        Unidad2Label.text = [[NSString alloc]initWithFormat:@"U"];
        Unidad3Label.text = [[NSString alloc]initWithFormat:@""];
        
    
    
    }
    else if(Area == 0){
        
        tempo1 = inductancia * longitud;
        tempo2 = constanteP * pow(vueltas, 2) * permeabilidad;
        Area = tempo1/tempo2;
            
        Resultado3Label.text = [[NSString alloc]initWithFormat:@""];
        Resultado2Label.text = [[NSString alloc]initWithFormat:@"%.4lf",Area];
        Resultado1Label.text = [[NSString alloc]initWithFormat:@""];
        
        Unidad1Label.text = [[NSString alloc]initWithFormat:@""];
        Unidad2Label.text = [[NSString alloc]initWithFormat:@"Mts^2"];
        Unidad3Label.text = [[NSString alloc]initWithFormat:@""];

    }
    else if(longitud == 0){
        
        tempo1 = constanteP*permeabilidad*pow(vueltas, 2)*Area;
        longitud = tempo1/inductancia;
        
        Resultado3Label.text = [[NSString alloc]initWithFormat:@"%.4lf",longitud*1000];
        Resultado2Label.text = [[NSString alloc]initWithFormat:@"%.4lf",longitud*100];
        Resultado1Label.text = [[NSString alloc]initWithFormat:@"%.4lf",longitud];
        
        Unidad1Label.text = [[NSString alloc]initWithFormat:@"Mms"];
        Unidad2Label.text = [[NSString alloc]initWithFormat:@"Cms"];
        Unidad3Label.text = [[NSString alloc]initWithFormat:@"Mts"];

    
    
    
    }
    else{
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Deja en blanco el campo de texto de la variable que quieras calcular." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    
    }
    
    NSLog(@"Vueltas %.10lf",vueltas);
    NSLog(@"Permeabilidad %.10lf",permeabilidad);
    NSLog(@"Longitud %.10lf",longitud);
    NSLog(@"Area %.10lf",Area);
    NSLog(@"Inductancia %.10lf",inductancia);

    
    
    
}

- (IBAction)Inicio:(id)sender {
    
    [AreaTextField resignFirstResponder];
    [LongTextField resignFirstResponder];
    [InductanciaTextField resignFirstResponder];
    [PermTextField resignFirstResponder];
    [VueltasTextField resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Deja en blanco la casilla de la cual quieras calcular su valor y rellena todas las demas." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
}
@end
