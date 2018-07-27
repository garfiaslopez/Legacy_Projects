//
//  Circuito RLC.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 04/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Circuito RLC.h"
#import "math.h"

@interface Circuito_RLC ()

@end

@implementation Circuito_RLC


@synthesize TituloNav;
@synthesize Scroller;
@synthesize SubScroller;
@synthesize VoltajeLabel;
@synthesize VoltsTextField;
@synthesize FrecuenciaLabel;
@synthesize FrecuenciaTextField;
@synthesize ResistenciaTextField;
@synthesize UnidadesResistencia;
@synthesize CapacitorTextField;
@synthesize UnidadesCapacitor;
@synthesize BobinaTextField;
@synthesize UnidadesBobina;
@synthesize XCLabel;
@synthesize XLlabel;
@synthesize FrecResonanciaLabe;
@synthesize ResXCLabel;
@synthesize ResXLLabel;
@synthesize ResFrecResonanciaLabel;
@synthesize ImpedanciaLabel;
@synthesize ResImpedanciaLabel;
@synthesize ImaxLabel;
@synthesize ResImaxLabel;
@synthesize VRLabel;
@synthesize ResVRLabel;
@synthesize VLLabel;
@synthesize ResVLLabel;
@synthesize VCLabel;
@synthesize ResVCLabel;
@synthesize TriangleImpLabel;
@synthesize TgAnguloLabel;
@synthesize AnguloLabel;
@synthesize ResTgAnguloLabel;
@synthesize ResGradosLabel;
@synthesize ResSegLabel;
@synthesize ResMinLabel;
@synthesize ResMsegLabel;
@synthesize TrianglePoteLabel;
@synthesize PLabel;
@synthesize QLabel;
@synthesize SLabel;
@synthesize FactorPoteLabel;
@synthesize ResPLabel;
@synthesize ResQLabel;
@synthesize ResSLabel;
@synthesize ResFatorPoteLabel;
@synthesize TriangImpeView;
@synthesize TriangPoteView;

bool ImpedanciaView = NO,PotenciaView = NO;

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
    
    VoltsTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    FrecuenciaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    BobinaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    CapacitorTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    ResistenciaTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    XCLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResXCLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    XLlabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResXLLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    FrecResonanciaLabe.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResFrecResonanciaLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ImpedanciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResImpedanciaLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ImaxLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResImaxLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    VRLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResVRLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    VLLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResVLLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    VCLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResVCLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    TriangleImpLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    TgAnguloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    AnguloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ResTgAnguloLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResGradosLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResMinLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResSegLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResMsegLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    
    TrianglePoteLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    
    PLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    QLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    SLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    FactorPoteLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    
    ResPLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResQLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResSLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResFatorPoteLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    
    
    
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
    
    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:13];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [UnidadesBobina setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
    [UnidadesCapacitor setTitleTextAttributes:attributes
                                  forState:UIControlStateNormal];
    [UnidadesResistencia setTitleTextAttributes:attributes
                                  forState:UIControlStateNormal];
    
    [SubScroller setScrollEnabled:YES];
    self.SubScroller.contentSize=CGSizeMake(320, 810);
    
    
    
}

-(void)dismissKeyboard {
    
    [VoltsTextField resignFirstResponder];
    [FrecuenciaTextField resignFirstResponder];
    [ResistenciaTextField resignFirstResponder];
    [CapacitorTextField resignFirstResponder];
    [BobinaTextField resignFirstResponder];
    
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

- (IBAction)ImagenTrianImpe:(id)sender {
    
    if(ImpedanciaView == NO && PotenciaView == YES){
        [UIView animateWithDuration:1.0 animations:^(){
            TriangPoteView.frame = CGRectMake(320, 0, 320, 215);
        }];
        PotenciaView = NO;
        
        
        [UIView animateWithDuration:1.5 animations:^(){
            TriangImpeView.frame = CGRectMake(0, 0, 320, 215);
        }];
        
        ImpedanciaView = YES;
        
    }
    else if (ImpedanciaView == NO) {

        [UIView animateWithDuration:1.5 animations:^(){
            TriangImpeView.frame = CGRectMake(0, 0, 320, 215);
        }];
        
        ImpedanciaView = YES;
    }
    else if (ImpedanciaView == YES) {
        [UIView animateWithDuration:1.5 animations:^(){
            TriangImpeView.frame = CGRectMake(320, 0, 320, 215);
        }];
        ImpedanciaView = NO;
    }

        
}

- (IBAction)ImagenTrianPote:(id)sender {
    
    if(PotenciaView == NO && ImpedanciaView == YES){
        
        [UIView animateWithDuration:1.0 animations:^(){
            TriangImpeView.frame = CGRectMake(320, 0, 320, 215);
        }];
        ImpedanciaView = NO;
        
        [UIView animateWithDuration:1.5 animations:^(){
            TriangPoteView.frame = CGRectMake(0, 0, 320, 215);
        }];
        
        PotenciaView = YES;
    }
    else if (PotenciaView == NO) {
        
        [UIView animateWithDuration:1.5 animations:^(){
            TriangPoteView.frame = CGRectMake(0, 0, 320, 215);
        }];
        
        PotenciaView = YES;
    }
    else if (PotenciaView == YES) {
        [UIView animateWithDuration:1.5 animations:^(){
            TriangPoteView.frame = CGRectMake(320, 0, 320, 215);
        }];
        PotenciaView = NO;
    }

}

- (IBAction)Inicio:(id)sender {
    
    [VoltsTextField resignFirstResponder];
    [FrecuenciaTextField resignFirstResponder];
    [ResistenciaTextField resignFirstResponder];
    [CapacitorTextField resignFirstResponder];
    [BobinaTextField resignFirstResponder];
    
    
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Rellena todos los campos con las caracteristicas de tu circuito RLC para poder calcular los diferentes caracteristicas de el." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
}

- (IBAction)Calcular:(id)sender {
    
    double voltajevalor=0,Resistenciavalor=0,capacitorvalor=0,bobinavalor=0,frecuencia=0,resulCapatancia=0,resulInductancia=0,ResulFresonancia=0,tempo1=0,tempo2=0,resulImpedancia=0,resulImax=0,resulVR=0,resulVL=0,resulVC=0,resulP=0,resulQ=0,resulS=0,resultgAngulo=0,resulFP=0;
    
    capacitorvalor = [CapacitorTextField.text doubleValue];
    bobinavalor = [BobinaTextField.text doubleValue];
    frecuencia = [FrecuenciaTextField.text doubleValue];
    Resistenciavalor = [ResistenciaTextField.text doubleValue];
    voltajevalor = [VoltsTextField.text doubleValue];
    
    NSLog(@"CAPACITORVALOR: %lf",capacitorvalor);
    NSLog(@"BOBINAVALOR: %lf",bobinavalor);
    NSLog(@"FRECUENCIAVALOR: %lf",frecuencia);
    NSLog(@"RESISTENCIAVALOR: %lf",Resistenciavalor);
    NSLog(@"VOLTAJEVALOR: %lf",voltajevalor);
    
    switch (UnidadesCapacitor.selectedSegmentIndex) {
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
    switch (UnidadesBobina.selectedSegmentIndex) {
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
    switch (UnidadesResistencia.selectedSegmentIndex) {
        case 0:
            Resistenciavalor = Resistenciavalor;
            break;
        case 1:
            Resistenciavalor = Resistenciavalor*1000;
            break;
        case 2:
            Resistenciavalor = Resistenciavalor*1000000;
            break;
        default:
            break;
    }
    NSLog(@"CAPACITORVALOR: %lf",capacitorvalor);
    NSLog(@"BOBINAVALOR: %lf",bobinavalor);
    NSLog(@"FRECUENCIAVALOR: %lf",frecuencia);
    NSLog(@"RESISTENCIAVALOR: %lf",Resistenciavalor);
    NSLog(@"VOLTAJEVALOR: %lf",voltajevalor);

    // REACTANCIA INDUCTIVA XL: 2PI * FRECUENCIA * INDUCTANCIA   (2∏ * ƒ * L)
    //REACTANCIA CAPACITIVA XC : 1/2PI * F * C
    
    //FRECUENCIA DE RESONANCIA 1/2PI * √C*L
    
    
    //XL
    resulInductancia = 6.2832 * frecuencia * bobinavalor;
    //XC
    tempo1 = 6.2832 * frecuencia *capacitorvalor;
    resulCapatancia = 1/tempo1;
    //FRECUENCIA DE RESONANCIA
    tempo1 = bobinavalor * capacitorvalor;
    tempo1 = sqrt(tempo1);
    tempo2 = tempo1 * 6.28318;
    ResulFresonancia = 1/tempo2;
    //IMPEDANCIA (Z)
    tempo1 = resulInductancia - resulCapatancia;
    tempo1 = pow(tempo1, 2);
    tempo2 = pow(Resistenciavalor, 2);
    resulImpedancia = sqrt(tempo1+tempo2);
    //Intensidad Maxima (imax)
    resulImax = voltajevalor/resulImpedancia;
    //VR
    resulVR = Resistenciavalor * resulImax;
    //VL
    resulVL = resulInductancia * resulImax;
    //VC
    resulVC = resulCapatancia * resulImax;
    //Tg Angulo
    tempo1 = resulInductancia - resulCapatancia;
    resultgAngulo = tempo1/Resistenciavalor;
    //Angulo
    double DecimalNumero=0;
    int gradosnumero=0,MinNumero=0,SegNumero=0,MsegNumero=0;
    DecimalNumero = resultgAngulo;
    gradosnumero = DecimalNumero;
    DecimalNumero = DecimalNumero - gradosnumero;
    DecimalNumero = DecimalNumero * 60;
    MinNumero = DecimalNumero;
    DecimalNumero = DecimalNumero - MinNumero;    
    DecimalNumero = DecimalNumero * 60;
    SegNumero = DecimalNumero;    
    DecimalNumero = DecimalNumero -SegNumero;    
    DecimalNumero = DecimalNumero * 100;    
    MsegNumero = DecimalNumero;
    //P
    resulP = voltajevalor * resulImax * cos(tan(resultgAngulo));
    //Q
    resulQ = voltajevalor * resulImax * sin(tan(resultgAngulo));
    //S
    resulS = voltajevalor * resulImax;
    //FP
    resulFP = resulP/resulS;
    
    if (voltajevalor != 0 && frecuencia != 0 && Resistenciavalor !=0 && capacitorvalor != 0 && bobinavalor != 0) {
        
        ResXCLabel.text = [[NSString alloc]initWithFormat:@"%.4lf",resulCapatancia];
        ResXLLabel.text = [[NSString alloc]initWithFormat:@"%.4lf",resulInductancia];
        ResFrecResonanciaLabel.text = [[NSString alloc]initWithFormat:@"%.4lf",ResulFresonancia];
        ResImpedanciaLabel.text = [[NSString alloc]initWithFormat:@"%.4lf",resulImpedancia];
        ResImaxLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulImax];
        ResVRLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulVR];
        ResVLLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulVL];
        ResVCLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulVC];
        ResTgAnguloLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resultgAngulo];
        ResGradosLabel.text = [[NSString alloc]initWithFormat:@"%dº",gradosnumero];
        ResMinLabel.text = [[NSString alloc]initWithFormat:@"%dº",MinNumero];
        ResSegLabel.text = [[NSString alloc]initWithFormat:@"%dº",SegNumero];
        ResMsegLabel.text = [[NSString alloc]initWithFormat:@"%dº",MsegNumero];
        ResPLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulP];
        ResQLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulQ];
        ResSLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulS];
        ResFatorPoteLabel.text = [[NSString alloc]initWithFormat:@"%.2lf",resulFP];
    }
    else{
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Rellena todos los campos para poder generar una respuesta" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
        
    }
    
    

    
    
}
- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setSubScroller:nil];
    [self setSubScroller:nil];
    [self setVoltajeLabel:nil];
    [self setVoltsTextField:nil];
    [self setFrecuenciaLabel:nil];
    [self setFrecuenciaTextField:nil];
    [self setResistenciaTextField:nil];
    [self setUnidadesResistencia:nil];
    [self setCapacitorTextField:nil];
    [self setUnidadesCapacitor:nil];
    [self setBobinaTextField:nil];
    [self setUnidadesBobina:nil];
    [self setXCLabel:nil];
    [self setXLlabel:nil];
    [self setFrecResonanciaLabe:nil];
    [self setResXCLabel:nil];
    [self setResXLLabel:nil];
    [self setResFrecResonanciaLabel:nil];
    [self setImaxLabel:nil];
    [self setResImaxLabel:nil];
    [self setVRLabel:nil];
    [self setResVRLabel:nil];
    [self setVLLabel:nil];
    [self setResVLLabel:nil];
    [self setVCLabel:nil];
    [self setResVCLabel:nil];
    [self setTriangleImpLabel:nil];
    [self setTgAnguloLabel:nil];
    [self setResTgAnguloLabel:nil];
    [self setTrianglePoteLabel:nil];
    [self setPLabel:nil];
    [self setQLabel:nil];
    [self setSLabel:nil];
    [self setFactorPoteLabel:nil];
    [self setResPLabel:nil];
    [self setResQLabel:nil];
    [self setResSLabel:nil];
    [self setResFatorPoteLabel:nil];
    [self setImpedanciaLabel:nil];
    [self setResImpedanciaLabel:nil];
    [self setResGradosLabel:nil];
    [self setResMinLabel:nil];
    [self setResSegLabel:nil];
    [self setResMsegLabel:nil];
    [self setAnguloLabel:nil];
    [self setTriangImpeView:nil];
    [self setTriangPoteView:nil];
    [super viewDidUnload];
}
@end
