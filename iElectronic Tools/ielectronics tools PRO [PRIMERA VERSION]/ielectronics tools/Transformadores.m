//
//  Transformadores.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 02/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Transformadores.h"

@interface Transformadores ()

@end

@implementation Transformadores
@synthesize SalidaLabel;
@synthesize EntradaLabel;
@synthesize TituloNav;
@synthesize Scroller;
@synthesize EntradaVoltsTextField;
@synthesize EntradaAmpTextField;
@synthesize SalidaVoltsTextField;
@synthesize PotenciaLabel;
@synthesize ResPotenciaLabel;
@synthesize NucleoLabel;
@synthesize AreaNucleoLabel;
@synthesize ResAreaNucleoLabel;
@synthesize DevanadoPrimarioLabel;
@synthesize DevanadoSecLabel;
@synthesize AWG1Label;
@synthesize Vueltas1Label;
@synthesize Amperaje1Label;
@synthesize AWG2Label;
@synthesize Vueltas2Label;
@synthesize Amperaje2Label;
@synthesize ResVueltasPrimLabel;
@synthesize ResAWGPrimLabel;
@synthesize ResAmpPrimLabel;
@synthesize ResAWGSecLabel;
@synthesize ResVueltasSecLabel;
@synthesize ResAmpSecLabel;
@synthesize Salida2Label;
@synthesize EntradaAmp2TextField;
@synthesize EntradaVolts2TextField;
@synthesize Amperaje3Label;
@synthesize AWG3Label;
@synthesize Vueltas3Label;
@synthesize ResAmpAdicLabel;
@synthesize ResAWGAdicLabel;
@synthesize ResVueltasAdicLabel;
@synthesize ResNucleoMedLabel;
@synthesize DevanadoAdicLabel;



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
    
    EntradaVoltsTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    EntradaAmpTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    EntradaVolts2TextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    EntradaAmp2TextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    SalidaVoltsTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    
    PotenciaLabel.font  = [UIFont fontWithName:@"Coming Soon" size:15];
    NucleoLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    AreaNucleoLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    DevanadoPrimarioLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    AWG1Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    AWG2Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    AWG3Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Vueltas1Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Vueltas2Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Vueltas3Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Amperaje1Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Amperaje2Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    Amperaje3Label.font = [UIFont fontWithName:@"Coming Soon" size:15];
    DevanadoSecLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    DevanadoAdicLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ResPotenciaLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResNucleoMedLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAreaNucleoLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAWGPrimLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResVueltasPrimLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAmpPrimLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAWGSecLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResVueltasSecLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAmpSecLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAWGAdicLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResVueltasAdicLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResAmpAdicLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    
    
    
    
    
    
    
    self.Scroller2.contentSize=CGSizeMake(320,438);
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
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
    
    [EntradaVoltsTextField resignFirstResponder];
    [SalidaVoltsTextField resignFirstResponder];
    [EntradaAmpTextField resignFirstResponder];
    [EntradaAmp2TextField resignFirstResponder];
    [EntradaVolts2TextField resignFirstResponder];

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
    [self setSalidaLabel:nil];
    [self setEntradaLabel:nil];
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setEntradaVoltsTextField:nil];
    [self setSalidaVoltsTextField:nil];
    [self setPotenciaLabel:nil];
    [self setResPotenciaLabel:nil];
    [self setNucleoLabel:nil];
    [self setAreaNucleoLabel:nil];
    [self setResAreaNucleoLabel:nil];
    [self setDevanadoPrimarioLabel:nil];
    [self setDevanadoSecLabel:nil];
    [self setAWG1Label:nil];
    [self setVueltas1Label:nil];
    [self setAmperaje1Label:nil];
    [self setAWG2Label:nil];
    [self setVueltas2Label:nil];
    [self setAmperaje2Label:nil];
    [self setResAWGPrimLabel:nil];
    [self setResVueltasPrimLabel:nil];
    [self setResAmpPrimLabel:nil];
    [self setResAWGSecLabel:nil];
    [self setResVueltasSecLabel:nil];
    [self setResAmpSecLabel:nil];
    [self setEntradaAmpTextField:nil];
    [self setSalida2Label:nil];
    [self setScroller2:nil];
    [self setEntradaVolts2TextField:nil];
    [self setEntradaAmp2TextField:nil];
    [self setDevanadoAdicLabel:nil];
    [self setAWG3Label:nil];
    [self setVueltas3Label:nil];
    [self setAmperaje3Label:nil];
    [self setResAWGAdicLabel:nil];
    [self setResVueltasAdicLabel:nil];
    [self setResAmpAdicLabel:nil];
    [self setResNucleoMedLabel:nil];
    [super viewDidUnload];
}
- (IBAction)Calcular:(id)sender {
    
    double VoltajeIn=0,VoltajePrimOut=0,VoltajeAdicOut=0,AmperajePrimOut=0,AmperajeAdicOut=0,potencia=0,vueltasporvoltio=0,Areanucleo=0,potenciamax=0,AmpDevPrim=0,AWGDevPrim=0,AWGDevSec=0,AWGDevAdic=0,vueltasDevPrim=0,vueltasDevSec=0,vueltasDevAdic=0;
    NSString *Nucleo;
    
    VoltajeIn = [SalidaVoltsTextField.text doubleValue];
    VoltajePrimOut = [EntradaVoltsTextField.text doubleValue];
    VoltajeAdicOut = [EntradaVolts2TextField.text doubleValue];
    AmperajePrimOut = [EntradaAmpTextField.text  doubleValue];
    AmperajeAdicOut = [EntradaAmp2TextField.text doubleValue];
    
    potencia = VoltajePrimOut*AmperajePrimOut;
    NSLog(@"POTENCIA:%lf",potencia);
    if (potencia > 0 && potencia <=9) {
        Nucleo = @"1.6 X 1.9";
        vueltasporvoltio = 14;
        Areanucleo = 3.04;
        potenciamax = 9;
    }
    else if (potencia > 9 && potencia <=17) {
        Nucleo = @"2.8 X 1.5";
        vueltasporvoltio = 10;
        Areanucleo = 4.21;
        potenciamax = 17;
    }
    else if (potencia > 17 && potencia <=20) {
        Nucleo = @"2.5 X 1.8";
        vueltasporvoltio = 9.3;
        Areanucleo = 4.5;
        potenciamax = 20;
    }
    else if (potencia > 20 && potencia <=37) {
        Nucleo = @"2.2 X 2.8";
        vueltasporvoltio = 7;
        Areanucleo = 6.16;
        potenciamax = 37;
    }
    else if (potencia > 37 && potencia <=49) {
        Nucleo = @"2.5 X 2.8";
        vueltasporvoltio = 6;
        Areanucleo = 7;
        potenciamax = 49;
    }
    else if (potencia > 49 && potencia <=96) {
        Nucleo = @"2.8 X 3.5";
        vueltasporvoltio = 4.3;
        Areanucleo = 9.8;
        potenciamax = 96;
    }
    else if (potencia > 96 && potencia <=125) {
        Nucleo = @"3.2 X 3.5";
        vueltasporvoltio = 3.75;
        Areanucleo = 11.2;
        potenciamax = 125;
    }
    else if (potencia > 125 && potencia <=163) {
        Nucleo = @"3.2 X 4";
        vueltasporvoltio = 3.3;
        Areanucleo = 12.8;
        potenciamax = 163;
    }
    else if (potencia > 163 && potencia <=196) {
        Nucleo = @"2.8 X 5";
        vueltasporvoltio = 3;
        Areanucleo = 14;
        potenciamax = 196;
    }
    else if (potencia > 196 && potencia <= 231) {
        Nucleo = @"3.8 X 4";
        vueltasporvoltio = 2.76;
        Areanucleo = 15.2;
        potenciamax = 231;
    }
    else if (potencia > 231 && potencia <=256) {
        Nucleo = @"3.2 X 5";
        vueltasporvoltio = 2.625;
        Areanucleo = 16;
        potenciamax = 256;
    }
    else if (potencia > 256 && potencia <=361) {
        Nucleo = @"3.8 X 5";
        vueltasporvoltio = 2.21;
        Areanucleo = 19;
        potenciamax = 361;
    }
    else if (potencia > 361 && potencia <=519) {
        Nucleo = @"3.8 X 6";
        vueltasporvoltio = 1.85;
        Areanucleo = 22.8;
        potenciamax = 519;
    }
    else if (potencia > 519 && potencia <=707) {
        Nucleo = @"3.8 X 7";
        vueltasporvoltio = 1.58;
        Areanucleo = 26.6;
        potenciamax = 707;
    }
    else if (potencia > 797 && potencia <=924) {
        Nucleo = @"3.8 X 8";
        vueltasporvoltio = 1.38;
        Areanucleo = 30.4;
        potenciamax = 924;
    }
    else if (potencia > 924 && potencia <= 1170) {
        Nucleo = @"3.8 X 9";
        vueltasporvoltio = 1.22;
        Areanucleo = 34.2;
        potenciamax = 1170;
    }
    else if (potencia > 1170 && potencia <=1444) {
        Nucleo = @"3.8 X 10";
        vueltasporvoltio = 1.1;
        Areanucleo = 38;
        potenciamax = 1444;
    }
    else if (potencia > 1444 && potencia <=1568) {
        Nucleo = @"4.4 X 9";
        vueltasporvoltio = 1.06;
        Areanucleo = 39.6;
        potenciamax = 1568;
    }
    else if (potencia > 1568 && potencia <=1747) {
        Nucleo = @"3.8 X 11";
        vueltasporvoltio = 1.004;
        Areanucleo = 41.8;
        potenciamax = 1747;
    }
    else if (potencia > 1747 && potencia <=1940) {
        Nucleo = @"4.4 X 10";
        vueltasporvoltio = 0.95;
        Areanucleo = 44;
        potenciamax = 1940;
    }
    else if (potencia > 1940 && potencia <=2079) {
        Nucleo = @"3.8 X 12";
        vueltasporvoltio = 0.921;
        Areanucleo = 45.6;
        potenciamax = 2079;
    }
    else if (potencia > 2079 && potencia <=2342) {
        Nucleo = @"4.4 X 11";
        vueltasporvoltio = 0.867;
        Areanucleo = 48.4;
        potenciamax = 2342;
    }
    else if (potencia > 2342 && potencia <=2787) {
        Nucleo = @"4.4 X 12";
        vueltasporvoltio = 0.795;
        Areanucleo = 52.8;
        potenciamax = 2787;
    }
    else if (potencia > 2787) {
       
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"La potencia del transformador es muy alta para esta version de calculadora de transformadores, lo siento :( ¡Pronto Actualizaremos!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];

    }
    
    
    vueltasDevPrim = vueltasporvoltio * VoltajeIn;
    
    NSLog(@"POTENCIAMAX:%lf",potenciamax);
    AmpDevPrim = potenciamax/VoltajeIn;
    
    if (AmpDevPrim >0 && AmpDevPrim <= 0.22) {
        AWGDevPrim = 30;
    }
    else if (AmpDevPrim >0.22 && AmpDevPrim <= 0.29) {
        AWGDevPrim = 29;
    }
    else if (AmpDevPrim >0.29 && AmpDevPrim <= 0.3) {
        AWGDevPrim = 28;
    }
    else if (AmpDevPrim >0.3 && AmpDevPrim <= 0.4) {
        AWGDevPrim = 27;
    }
    else if (AmpDevPrim >0.4 && AmpDevPrim <= 0.5) {
        AWGDevPrim = 26;
    }
    else if (AmpDevPrim >0.5 && AmpDevPrim <= 0.6) {
        AWGDevPrim = 25;
    }
    else if (AmpDevPrim >0.6 && AmpDevPrim <= 0.8) {
        AWGDevPrim = 24;
    }
    else if (AmpDevPrim >0.8 && AmpDevPrim <= 1) {
        AWGDevPrim = 23;
    }
    else if (AmpDevPrim > 1 && AmpDevPrim <= 1.2) {
        AWGDevPrim = 22;
    }
    else if (AmpDevPrim >1.2 && AmpDevPrim <= 1.6) {
        AWGDevPrim = 21;
    }
    else if (AmpDevPrim >1.6 && AmpDevPrim <= 2.0) {
        AWGDevPrim = 20;
    }
    else if (AmpDevPrim >2.0 && AmpDevPrim <= 2.6) {
        AWGDevPrim = 19;
    }
    else if (AmpDevPrim >2.6 && AmpDevPrim <= 3.2) {
        AWGDevPrim = 18;
    }
    else if (AmpDevPrim >3.2 && AmpDevPrim <= 4.1) {
        AWGDevPrim = 17;
    }
    else if (AmpDevPrim >4.1 && AmpDevPrim <= 5.2) {
        AWGDevPrim = 16;
    }
    else if (AmpDevPrim >5.2 && AmpDevPrim <= 6.6) {
        AWGDevPrim = 15;
    }
    else if (AmpDevPrim >6.6 && AmpDevPrim <= 8.3) {
        AWGDevPrim = 14;
    }
    else if (AmpDevPrim >8.3 && AmpDevPrim <= 10.5) {
        AWGDevPrim = 13;
    }
    else if (AmpDevPrim >10.5 && AmpDevPrim <= 13.5) {
        AWGDevPrim = 12;
    }
    else if (AmpDevPrim >13.5 && AmpDevPrim <= 16.6) {
        AWGDevPrim = 11;
    }
    else if (AmpDevPrim >16.5 && AmpDevPrim <= 21.2) {
        AWGDevPrim = 10;
    }
    else if (AmpDevPrim >21.2 && AmpDevPrim <= 26.5) {
        AWGDevPrim = 9;
    }
    else if (AmpDevPrim >26.5 && AmpDevPrim <= 33.3) {
        AWGDevPrim = 8;
    }
    else if (AmpDevPrim >33.3 && AmpDevPrim <= 44.2) {
        AWGDevPrim = 7;
    }
    else if (AmpDevPrim >44.2){
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"El amperaje resultante para el devanado primario es muy alto para poder ser calculado por esta version de calculadora, lo sentimos. ¡Pronto Actualizaremos!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
    
    ////////////////////////////////////////////////////
    
    if (AmperajePrimOut >0 && AmperajePrimOut <= 0.22) {
        AWGDevSec = 30;
    }
    else if (AmperajePrimOut >0.22 && AmperajePrimOut <= 0.29) {
        AWGDevSec = 29;
    }
    else if (AmperajePrimOut >0.29 && AmperajePrimOut <= 0.3) {
        AWGDevSec = 28;
    }
    else if (AmperajePrimOut >0.3 && AmperajePrimOut <= 0.4) {
        AWGDevSec = 27;
    }
    else if (AmperajePrimOut >0.4 && AmperajePrimOut <= 0.5) {
        AWGDevSec = 26;
    }
    else if (AmperajePrimOut >0.5 && AmperajePrimOut <= 0.6) {
        AWGDevSec = 25;
    }
    else if (AmperajePrimOut >0.6 && AmperajePrimOut <= 0.8) {
        AWGDevSec = 24;
    }
    else if (AmperajePrimOut >0.8 && AmperajePrimOut <= 1) {
        AWGDevSec = 23;
    }
    else if (AmperajePrimOut > 1 && AmperajePrimOut <= 1.2) {
        AWGDevSec = 22;
    }
    else if (AmperajePrimOut >1.2 && AmperajePrimOut <= 1.6) {
        AWGDevSec = 21;
    }
    else if (AmperajePrimOut >1.6 && AmperajePrimOut <= 2.0) {
        AWGDevSec = 20;
    }
    else if (AmperajePrimOut >2.0 && AmperajePrimOut <= 2.6) {
        AWGDevSec = 19;
    }
    else if (AmperajePrimOut >2.6 && AmperajePrimOut <= 3.2) {
        AWGDevSec = 18;
    }
    else if (AmperajePrimOut >3.2 && AmperajePrimOut <= 4.1) {
        AWGDevSec = 17;
    }
    else if (AmperajePrimOut >4.1 && AmperajePrimOut <= 5.2) {
        AWGDevSec = 16;
    }
    else if (AmperajePrimOut >5.2 && AmperajePrimOut <= 6.6) {
        AWGDevSec = 15;
    }
    else if (AmperajePrimOut >6.6 && AmperajePrimOut <= 8.3) {
        AWGDevSec = 14;
    }
    else if (AmperajePrimOut >8.3 && AmperajePrimOut <= 10.5) {
        AWGDevSec = 13;
    }
    else if (AmperajePrimOut >10.5 && AmperajePrimOut <= 13.5) {
        AWGDevSec = 12;
    }
    else if (AmperajePrimOut >13.5 && AmperajePrimOut <= 16.6) {
        AWGDevSec = 11;
    }
    else if (AmperajePrimOut >16.5 && AmperajePrimOut <= 21.2) {
        AWGDevSec = 10;
    }
    else if (AmperajePrimOut >21.2 && AmperajePrimOut <= 26.5) {
        AWGDevSec = 9;
    }
    else if (AmperajePrimOut >26.5 && AmperajePrimOut <= 33.3) {
        AWGDevSec = 8;
    }
    else if (AmperajePrimOut >33.3 && AmperajePrimOut <= 44.2) {
        AWGDevSec = 7;
    }
    else if (AmperajePrimOut >44.2){
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"El amperaje para el devanado secundario es muy alto para poder ser calculado por esta version de calculadora, lo sentimos. ¡Pronto Actualizaremos!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
    
//////////////////////////////////////////////////////////
    if (AmperajeAdicOut >0) {

    if (AmperajeAdicOut >0 && AmperajeAdicOut <= 0.22) {
        AWGDevAdic = 30;
    }
    else if (AmperajeAdicOut >0.22 && AmperajeAdicOut <= 0.29) {
        AWGDevAdic = 29;
    }
    else if (AmperajeAdicOut >0.29 && AmperajeAdicOut <= 0.3) {
        AWGDevAdic = 28;
    }
    else if (AmperajeAdicOut >0.3 && AmperajeAdicOut <= 0.4) {
        AWGDevAdic = 27;
    }
    else if (AmperajeAdicOut >0.4 && AmperajeAdicOut <= 0.5) {
        AWGDevAdic = 26;
    }
    else if (AmperajeAdicOut >0.5 && AmperajeAdicOut <= 0.6) {
        AWGDevAdic = 25;
    }
    else if (AmperajeAdicOut >0.6 && AmperajeAdicOut <= 0.8) {
        AWGDevAdic = 24;
    }
    else if (AmperajeAdicOut >0.8 && AmperajeAdicOut <= 1) {
        AWGDevAdic= 23;
    }
    else if (AmperajeAdicOut > 1 && AmperajeAdicOut <= 1.2) {
        AWGDevAdic= 22;
    }
    else if (AmperajeAdicOut >1.2 && AmperajeAdicOut <= 1.6) {
        AWGDevAdic = 21;
    }
    else if (AmperajeAdicOut >1.6 && AmperajeAdicOut <= 2.0) {
        AWGDevAdic = 20;
    }
    else if (AmperajeAdicOut >2.0 && AmperajeAdicOut <= 2.6) {
        AWGDevAdic = 19;
    }
    else if (AmperajeAdicOut >2.6 && AmperajeAdicOut <= 3.2) {
        AWGDevAdic = 18;
    }
    else if (AmperajeAdicOut >3.2 && AmperajeAdicOut <= 4.1) {
        AWGDevAdic = 17;
    }
    else if (AmperajeAdicOut >4.1 && AmperajeAdicOut <= 5.2) {
        AWGDevAdic = 16;
    }
    else if (AmperajeAdicOut >5.2 && AmperajeAdicOut <= 6.6) {
        AWGDevAdic = 15;
    }
    else if (AmperajeAdicOut >6.6 && AmperajeAdicOut <= 8.3) {
        AWGDevAdic = 14;
    }
    else if (AmperajeAdicOut >8.3 && AmperajeAdicOut <= 10.5) {
        AWGDevAdic = 13;
    }
    else if (AmperajeAdicOut >10.5 && AmperajeAdicOut <= 13.5) {
        AWGDevAdic = 12;
    }
    else if (AmperajeAdicOut >13.5 && AmperajeAdicOut <= 16.6) {
        AWGDevAdic = 11;
    }
    else if (AmperajeAdicOut>16.5 && AmperajeAdicOut <= 21.2) {
        AWGDevAdic = 10;
    }
    else if (AmperajeAdicOut >21.2 && AmperajeAdicOut <= 26.5) {
        AWGDevAdic= 9;
    }
    else if (AmperajeAdicOut >26.5 && AmperajeAdicOut <= 33.3) {
        AWGDevPrim = 8;
    }
    else if (AmperajeAdicOut >33.3 && AmperajeAdicOut <= 44.2) {
        AWGDevPrim = 7;
    }
    else if (AmperajeAdicOut >44.2){
    
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"El amperaje para el devanado adicional es muy alto para poder ser calculado por esta version de calculadora, lo sentimos. ¡Pronto Actualizaremos!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
    
    }
    
    
    
    vueltasDevSec = vueltasporvoltio * VoltajePrimOut;
    vueltasDevAdic = vueltasporvoltio * VoltajeAdicOut;
    

    
    
    ResPotenciaLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",potencia];
    
    ResNucleoMedLabel.text = [[NSString alloc]initWithString:Nucleo];
    
    ResAreaNucleoLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",Areanucleo];
    
    ResAWGPrimLabel.text = [[NSString alloc]initWithFormat:@"%.0lf",AWGDevPrim];
    ResAWGSecLabel.text = [[NSString alloc]initWithFormat:@"%.0lf",AWGDevSec];
    ResAWGAdicLabel.text = [[NSString alloc]initWithFormat:@"%.0lf",AWGDevAdic];
    
    ResVueltasPrimLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",vueltasDevPrim];
    ResVueltasSecLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",vueltasDevSec];
    ResVueltasAdicLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",vueltasDevAdic];
    
    ResAmpPrimLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",AmpDevPrim];
    ResAmpSecLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",AmperajePrimOut];
    ResAmpAdicLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",AmperajeAdicOut];
 
    
    
}

- (IBAction)Inicio:(id)sender {
    
    
    [EntradaVoltsTextField resignFirstResponder];
    [SalidaVoltsTextField resignFirstResponder];
    [EntradaAmpTextField resignFirstResponder];
    [EntradaAmp2TextField resignFirstResponder];
    [EntradaVolts2TextField resignFirstResponder];
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"MENSAGE" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];

}
@end
