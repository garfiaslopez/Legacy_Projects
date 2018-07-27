//
//  DivTension.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 27/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DivTension.h"

@interface DivTension ()

@end

@implementation DivTension
@synthesize Vinfield;
@synthesize Rbottomfield;
@synthesize Rtopfield;
@synthesize Voutfield;
@synthesize UnidadVinfield;
@synthesize UnidadRbottomfield;
@synthesize UnidadRtopfield;
@synthesize UnidadVoutfield;
@synthesize Resultadomili;
@synthesize Resultado;
@synthesize ResultadoKilo;
@synthesize Unidadmili;
@synthesize Unidad;
@synthesize Unidadkilo;
@synthesize TituloNav;
@synthesize Scroller;

-(IBAction)Regresarteclado:(id)sender{

    [sender resignFirstResponder];

}

-(IBAction)instrucciones:(id)sender{
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Introduce los valores con los que dispongas y deja en blanco el valor que quieras calcular en los cuadros de texto, enseguida presiona 'calcular'." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
}

-(IBAction)inicio:(id)sender{
    
    [Vinfield resignFirstResponder];
    [Rbottomfield resignFirstResponder];
    [Rtopfield resignFirstResponder];
    [Voutfield resignFirstResponder];

    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
}

-(IBAction)Calcular:(id)sender{
    
    double vin = 0;
    double Rbottom = 0;
    double Rtop = 0;
    double Vout = 0;
    double temp = 0;
    double temp2 = 0;
    
    //Extraer los valores de los textfields
    
    vin = [Vinfield.text doubleValue];
    Rbottom = [Rbottomfield.text doubleValue];
    Rtop = [Rtopfield.text doubleValue];
    Vout = [Voutfield.text doubleValue];
    
    //Convertir las unidades a base
    
    if (UnidadVinfield.selectedSegmentIndex == 0) {
        vin = vin/1000;
    }
    if (UnidadVinfield.selectedSegmentIndex == 1) {
        vin = vin;
    }
    if (UnidadVinfield.selectedSegmentIndex == 2) {
        vin = vin*1000;
    }
    
    
    if (UnidadRbottomfield.selectedSegmentIndex == 0) {
        Rbottom = Rbottom/1000;
    }
    if (UnidadRbottomfield.selectedSegmentIndex == 1) {
        Rbottom = Rbottom;
    }
    if (UnidadRbottomfield.selectedSegmentIndex == 2) {
        Rbottom = Rbottom*1000;
    }
    
    
    
    if (UnidadRtopfield.selectedSegmentIndex == 0) {
        Rtop = Rtop /1000;
    }
    if (UnidadRtopfield.selectedSegmentIndex == 1) {
        Rtop = Rtop;
    }
    if (UnidadRtopfield.selectedSegmentIndex == 2) {
        Rtop = Rtop*1000;
    }
    
    
    if (UnidadVoutfield.selectedSegmentIndex == 0) {
        Vout = Vout/1000;
    }
    if (UnidadVoutfield.selectedSegmentIndex == 1) {
        Vout = Vout;
    }
    if (UnidadVoutfield.selectedSegmentIndex == 2) {
        Vout = Vout *1000;
    }
       
    //Aplicar las formulas
    
    if (vin == 0) {
        
        temp = Rbottom + Rtop;
        temp = Rbottom/temp;
        
        vin = Vout/temp;
        
        Resultadomili.text = [[NSString alloc] initWithFormat:@"%.3f",vin*1000];
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",vin];
        ResultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",vin/1000];
        
        Unidadmili.text = [[NSString alloc]initWithFormat:@"MiliVolts"];
        Unidad.text = [[NSString alloc]initWithFormat:@"Volts"];
        Unidadkilo.text = [[NSString alloc]initWithFormat:@"KiloVolts"];
        
    }
    if (Vout == 0) {
        
        temp = Rbottom + Rtop;
        temp = Rbottom / temp;

        Vout = temp * vin;

        Resultadomili.text = [[NSString alloc] initWithFormat:@"%.3f",Vout*1000];
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",Vout];
        ResultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",Vout/1000];
        
        Unidadmili.text = [[NSString alloc]initWithFormat:@"MiliVolts"];
        Unidad.text = [[NSString alloc]initWithFormat:@"Volts"];
        Unidadkilo.text = [[NSString alloc]initWithFormat:@"KiloVolts"];
        
    }
    if (Rbottom == 0) {
        
        temp = Vout * Rtop;
        temp2 = vin - Vout;
        
        Rbottom = temp/temp2;
        
        Resultadomili.text = [[NSString alloc] initWithFormat:@"%.3f",Rbottom*1000];
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",Rbottom];
        ResultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",Rbottom/1000];
        
        Unidadmili.text = [[NSString alloc]initWithFormat:@"MiliOhms"];
        Unidad.text = [[NSString alloc]initWithFormat:@"Ohms"];
        Unidadkilo.text = [[NSString alloc]initWithFormat:@"KiloOhms"];
        
        
    }
    if (Rtop == 0) {
        
        temp = Rbottom/Vout;
        temp = temp * vin;
        
        Rtop = temp - Rbottom;
        
        Resultadomili.text = [[NSString alloc] initWithFormat:@"%.3f",Rtop*1000];
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",Rtop];
        ResultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",Rtop/1000];
        
        Unidadmili.text = [[NSString alloc]initWithFormat:@"MiliOhms"];
        Unidad.text = [[NSString alloc]initWithFormat:@"Ohms"];
        Unidadkilo.text = [[NSString alloc]initWithFormat:@"KiloOhms"];
    }
    
    
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
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:20]}];
    
    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:13];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [UnidadVinfield setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
    [UnidadRtopfield setTitleTextAttributes:attributes
                                  forState:UIControlStateNormal];
    [UnidadVoutfield setTitleTextAttributes:attributes
                                  forState:UIControlStateNormal];
    [UnidadRbottomfield setTitleTextAttributes:attributes
                                  forState:UIControlStateNormal];
    
    Vinfield.font = [UIFont fontWithName:@"DS-Digital" size:30];
    Rbottomfield.font = [UIFont fontWithName:@"DS-Digital" size:30];
    Rtopfield.font = [UIFont fontWithName:@"DS-Digital" size:30];
    Voutfield.font = [UIFont fontWithName:@"DS-Digital" size:30];

    
    
    Resultado.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Resultadomili.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoKilo.font = [UIFont fontWithName:@"DS-Digital" size:60];
    


    
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


-(void)dismissKeyboard {
    
    [Vinfield resignFirstResponder];
    [Rbottomfield resignFirstResponder];
    [Rtopfield resignFirstResponder];
    [Voutfield resignFirstResponder];

    
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
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
