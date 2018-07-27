//
//  DiodoZener.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 20/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DiodoZener.h"

@interface DiodoZener ()

@end

@implementation DiodoZener

@synthesize VoutLabel;
@synthesize VinTextField;
@synthesize VoutTextField;
@synthesize IoutLabel;
@synthesize IoutTextField;
@synthesize VinLabel;
@synthesize ZenerLabel;
@synthesize ResistenciaLabel;
@synthesize RpRes;
@synthesize RpZener;
@synthesize Rres;
@synthesize Rzener;
@synthesize TituloNav;
@synthesize Scroller;


double VoltajeEntrada=0,VoltajeSalida=0,IntenSalida=0,RVoltsZener=0,RwattsZener=0,ROhmsRes=0,RwattsRes=0,temporal=0,temporal1=0,temporal2=0,temporal3=0;

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
    
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    
    VinLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];
    VoutLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];
    IoutLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];

    VinTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    VoutTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    IoutTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    ZenerLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];
    ResistenciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];
    
    Rzener.font = [UIFont fontWithName:@"DS-Digital" size:60];
    RpZener.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    Rres.font = [UIFont fontWithName:@"DS-Digital" size:60];
    RpRes.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
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

- (IBAction)Calcular:(id)sender {
    
    
    VoltajeEntrada = [VinTextField.text doubleValue];
    VoltajeSalida = [VoutTextField.text doubleValue];
    IntenSalida = [IoutTextField.text doubleValue];
    

    
    IntenSalida = IntenSalida/1000;
    temporal3 = VoltajeEntrada-VoltajeSalida;
    NSLog(@"%lf    %lf",IntenSalida,temporal3);
    
    temporal = 1.1 * IntenSalida;
    temporal = temporal3/temporal;
    NSLog(@"%lf",temporal);
    
    temporal1 = temporal3/temporal;
    temporal1 = temporal1 * VoltajeSalida;
    NSLog(@"%lf",temporal1);
    
    temporal2 = IntenSalida * IntenSalida * temporal;
    NSLog(@"%lf",temporal2);
    
    Rzener.text = [[NSString alloc]initWithFormat:@"%.2lf",VoltajeSalida];
    
    RpZener.text = [[NSString alloc]initWithFormat:@"%.3lf",temporal1];
    
    Rres.text = [[NSString alloc]initWithFormat:@"%.3lf",temporal];
    RpRes.text = [[NSString alloc]initWithFormat:@"%.3lf",temporal2];
    
    if (VoltajeSalida > VoltajeEntrada) {
        //Mandalos a la veerggaa!con un alertview
        
        UIAlertView *Alerta = [[UIAlertView alloc]initWithTitle:@"Error" message:@"El Voltaje de salida no puede ser mayor que el de entrada." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:NULL, nil];
        [Alerta show];
        
        Rres.text = [[NSString alloc]initWithFormat:@"0.00"];
        RpRes.text = [[NSString alloc]initWithFormat:@"0.00"];

        
    }
}
-(IBAction)Inicio:(id)sender{
    
    [VinTextField resignFirstResponder];
    [VoutTextField resignFirstResponder];
    [IoutTextField resignFirstResponder];
    
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
    
}
-(void)dismissKeyboard {
    
    [VinTextField resignFirstResponder];
    [VoutTextField resignFirstResponder];
    [IoutTextField resignFirstResponder];
    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Ingresa el voltaje de entrada, voltaje de salida e intensidad de salida que desees en tu regulador de voltaje con diodo zener y se calculara el valor del diodo zener y la resistencia necesarios." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
    
}
- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
