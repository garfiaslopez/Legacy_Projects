//
//  LedResistencia.m
//  iElectronic Tools PRO
//
//  Created by Jose De Jesus Garfias Lopez on 20/02/14.
//  Copyright (c) 2014 Jose Garfias Lopez. All rights reserved.
//

#import "LedResistencia.h"

@interface LedResistencia ()


@end


@implementation LedResistencia
@synthesize VFuenteSegmented;
@synthesize VLedSegmented;
@synthesize ILedSegmented;
@synthesize VFuenteTextField;
@synthesize VLedTextField;
@synthesize ILedTextField;
@synthesize ResultadoKOhms;
@synthesize ResultadoMOhms;
@synthesize ResultadoOhms;
@synthesize MainScroller;


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
        
        [self.MainScroller setContentOffset:CGPointZero animated:YES];
        
        [MainScroller setScrollEnabled:NO];
        
    }
    
    else{
        
        self.MainScroller.contentSize=CGSizeMake(320,592);
        [self.MainScroller setContentOffset:CGPointZero animated:YES];
    }

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dismissKeyboard {
    
    
    [VFuenteTextField resignFirstResponder];
    [VLedTextField resignFirstResponder];
    [ILedTextField resignFirstResponder];
    
}

- (IBAction)Calcular:(id)sender {
    
    //GET THE VALUES:
    
    double VoltajeF = [VFuenteTextField.text doubleValue];
    double VoltajeLED = [VLedTextField.text doubleValue];
    double IntensidadLED = [ILedTextField.text doubleValue];
    double Resultado;
    
    NSLog(@"VOLTAJE F: %f",VoltajeF);
    NSLog(@"VOLTAJE LED: %f",VoltajeLED);
    NSLog(@"INTENSIDAD LED: %f",IntensidadLED);
    
    if (VoltajeF !=0 && VoltajeLED !=0 && IntensidadLED !=0) {
        //NORMALIZAR LOS VALORES:
        
        if (VFuenteSegmented.selectedSegmentIndex == 0)
            VoltajeF = VoltajeF /1000;
        
        else if (VFuenteSegmented.selectedSegmentIndex == 1)
            VoltajeF = VoltajeF;
        
        else if (VFuenteSegmented.selectedSegmentIndex == 2)
            VoltajeF = VoltajeF*1000;
        
        
        //////////////////////////////////////
        
        if (VLedSegmented.selectedSegmentIndex == 0)
            VoltajeLED = VoltajeLED /1000;
        
        else if (VLedSegmented.selectedSegmentIndex == 1)
            VoltajeLED = VoltajeLED;
        
        else if (VLedSegmented.selectedSegmentIndex == 2)
            VoltajeLED = VoltajeLED*1000;
        
        //////////////////////////////////////
        
        if (ILedSegmented.selectedSegmentIndex == 0)
            IntensidadLED = IntensidadLED /1000;
        
        else if (ILedSegmented.selectedSegmentIndex == 1)
            IntensidadLED = IntensidadLED;
        
        else if (ILedSegmented.selectedSegmentIndex == 2)
            IntensidadLED = IntensidadLED*1000;
        
        
        // CALCULAR:
        
        NSLog(@"VOLTAJE F: %f",VoltajeF);
        NSLog(@"VOLTAJE LED: %f",VoltajeLED);
        NSLog(@"INTENSIDAD LED: %f",IntensidadLED);

        
        Resultado = (VoltajeF - VoltajeLED)/IntensidadLED;
        
        
        
        //Mostrar:
        
        
        ResultadoOhms.text = [[NSString alloc]initWithFormat:@"%.3f",Resultado];
        ResultadoKOhms.text = [[NSString alloc]initWithFormat:@"%.3f",Resultado/1000];
        ResultadoMOhms.text = [[NSString alloc]initWithFormat:@"%.6f",Resultado/1000000];

        

    }
    else{
    
        //Error:
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error:" message:@"Por favor rellena todos los campos" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [error show];
        
        
    
    }
    
    
    
    
    
    
    
}

- (IBAction)Inicio:(id)sender {
    
    [VFuenteTextField resignFirstResponder];
    [VLedTextField resignFirstResponder];
    [ILedTextField resignFirstResponder];

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)Ayuda:(id)sender {
    
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Instrucciones:" message:@"Rellena todos los campos para poder calcular el valor de la resistencia que necesitas para proteger tu LED, *Si el resultado no es alguna resistencia comercial, utiliza el valor mayor mas aproximado*." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
}
@end
