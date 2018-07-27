//
//  Reactancia.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 22/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//
#import <math.h>
#import "Reactancia.h"

@interface Reactancia ()


@end

@implementation Reactancia
@synthesize CapacitivaLabel;
@synthesize CapacitorTextField;
@synthesize BobinaTextField;
@synthesize FrecuenciaTextField;
@synthesize ResultadoCapacitancia;
@synthesize ResultadoInductancia;
@synthesize ResutaldoFresonancia;
@synthesize InductivaLabel;
@synthesize UnidadBobina;
@synthesize UnidadCapacitor;
@synthesize UnidadFrecuencia;
@synthesize TituloNav;
@synthesize Scroller;
@synthesize CapacitorLabel;
@synthesize BobinaLabel;
@synthesize FrecuenciaLabel;
@synthesize ResonanciaLabel;



- (IBAction)Calcular:(id)sender {
    
    double capacitorvalor=0,bobinavalor=0,frecuencia=0,resulCapatancia=0,resulInductancia=0,ResulFresonancia=0,tempo1=0,tempo2=0;
    
    capacitorvalor = [CapacitorTextField.text doubleValue];
    bobinavalor = [BobinaTextField.text doubleValue];
    frecuencia = [FrecuenciaTextField.text doubleValue];
    
    
    switch (UnidadCapacitor.selectedSegmentIndex) {
        case 0:
            capacitorvalor = capacitorvalor/1000000000000;
            break;
        case 1:
            capacitorvalor = capacitorvalor/1000000000;
            break;
        case 2:
            capacitorvalor = capacitorvalor/1000000;
            break;
        case 3:
            capacitorvalor = capacitorvalor/1000;
            break;
        case 4:
            capacitorvalor= capacitorvalor;
            break;
            
        default:
            break;
    }
    switch (UnidadBobina.selectedSegmentIndex) {
        case 0:
            bobinavalor = bobinavalor/1000000;
            break;
        case 1:
            bobinavalor = bobinavalor/1000;
            break;
        case 2:
            bobinavalor = bobinavalor;
            break;
        default:
            break;
    }
    switch (UnidadFrecuencia.selectedSegmentIndex) {
        case 0:
            frecuencia = frecuencia/1000;
            break;
        case 1:
            frecuencia = frecuencia;
            break;
        case 2:
            frecuencia = frecuencia*1000;
            break;
        default:
            break;
    }
    
    // REACTANCIA INDUCTIVA XL: 2PI * FRECUENCIA * INDUCTANCIA   (2∏ * ƒ * L)
    //REACTANCIA CAPACITIVA XC : 1/2PI * F * C
    
    //FRECUENCIA DE RESONANCIA 1/2PI * √C*L
    
    
    
    resulInductancia = 6.2832 * frecuencia * bobinavalor;
    
    resulCapatancia = 1/6.2832 * frecuencia *capacitorvalor;
    
    NSLog(@"%.12lf",capacitorvalor);
    NSLog(@"%lf",bobinavalor);
    
    
    //FRECUENCIA DE RESONANCIA
    
    tempo1 = bobinavalor * capacitorvalor;
    NSLog(@"%.12lf",tempo1);
    tempo1 = sqrt(tempo1);
    NSLog(@"%.12lf",tempo1);
    tempo2 = tempo1 * 6.28318;
    NSLog(@"%.12lf",tempo2);
    ResulFresonancia = 1/tempo2;
    NSLog(@"%.12lf",ResulFresonancia);
    
    
    if (bobinavalor != 0 && frecuencia != 0) {
        
        ResultadoInductancia.text = [[NSString alloc]initWithFormat:@"%.3lf",resulInductancia];
        ResultadoCapacitancia.text = [[NSString alloc]initWithFormat:@"00.0"];
        ResutaldoFresonancia.text = [[NSString alloc]initWithFormat:@"00.0"];
    }
    else if(capacitorvalor != 0 && frecuencia != 0){
        ResultadoCapacitancia.text = [[NSString alloc]initWithFormat:@"%.3lf",resulCapatancia];
        ResultadoInductancia.text = [[NSString alloc]initWithFormat:@"00.0"];
        ResutaldoFresonancia.text = [[NSString alloc]initWithFormat:@"00.0"];
    }
    else if (capacitorvalor != 0 && bobinavalor != 0){
        
        ResultadoCapacitancia.text = [[NSString alloc]initWithFormat:@"0.00"];
        ResultadoInductancia.text = [[NSString alloc]initWithFormat:@"0.00"];
        ResutaldoFresonancia.text = [[NSString alloc]initWithFormat:@"%.3lf",ResulFresonancia];
        
    }
    else if(bobinavalor >0 && capacitorvalor > 0 && frecuencia >0){
        
        ResultadoCapacitancia.text = [[NSString alloc]initWithFormat:@"%.3lf",resulCapatancia];
        ResultadoInductancia.text = [[NSString alloc]initWithFormat:@"%.3lf",resulInductancia];
        ResutaldoFresonancia.text = [[NSString alloc]initWithFormat:@"%.3lf",ResulFresonancia];
    }
    else{
    
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Rellena almenos dos campos para poder generar una respuesta" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    
    }

    
    
    
}

-(IBAction)Inicio:(id)sender{
    
    [CapacitorTextField resignFirstResponder];
    [BobinaTextField resignFirstResponder];
    [FrecuenciaTextField resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Para calcular XC o XL rellena solo los campos de capacitor o bobina y frecuencia. Si deseas calcular la frecuencia de resonancia rellena todos los campos." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
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
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    CapacitorTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    BobinaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    FrecuenciaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    ResultadoCapacitancia.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoInductancia.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResutaldoFresonancia.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
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
-(void)dismissKeyboard {
    
    [CapacitorTextField resignFirstResponder];
    [FrecuenciaTextField resignFirstResponder];
    [BobinaTextField resignFirstResponder];
    
}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setResonanciaLabel:nil];
    [self setCapacitorLabel:nil];
    [self setBobinaLabel:nil];
    [self setFrecuenciaLabel:nil];
    [super viewDidUnload];
}
@end
