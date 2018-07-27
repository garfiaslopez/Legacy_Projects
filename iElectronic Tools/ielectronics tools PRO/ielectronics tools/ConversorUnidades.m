//
//  ConversorUnidades.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "ConversorUnidades.h"


@interface ConversorUnidades ()

@end

@implementation ConversorUnidades

@synthesize unidades;
@synthesize unidades2;
@synthesize valor;
@synthesize nanoL;
@synthesize microL;
@synthesize miliL;
@synthesize ohmL;
@synthesize kiloL;
@synthesize megaL;
@synthesize gigaL;
@synthesize picoL;

@synthesize unidad;
@synthesize unidad1;
@synthesize unidad2;
@synthesize unidad3;
@synthesize unidad4;
@synthesize unidad5;
@synthesize unidad6;
@synthesize unidad7;
@synthesize unidad8;
@synthesize TituloNav;
@synthesize Scroller;
double Numero;

-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Inserta un valor en el campo de texto y enseguida selecciona que unidad es ese valor, presiona en calcular y convertira ese valor.\n En la barra de abajo puedes cambiar el tipo de tu valor ya sean Ohms,Volts o Faradios." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
    
}


-(IBAction)seleccionunidades:(id)sender{
    
    if (unidades.selectedSegmentIndex == 0){
        
       // [unidades2 setTitle:@"Ohms" forSegmentAtIndex:4];

        unidad.text = [[NSString alloc]initWithFormat:@"Ohms"];
        
        unidad1.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad2.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad3.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad4.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad5.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad6.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad7.text = [[NSString alloc]initWithFormat:@"Ω"];
        unidad8.text = [[NSString alloc]initWithFormat:@"Ω"];
    
    }

    if (unidades.selectedSegmentIndex == 1) {
        
       // [unidades2 setTitle:@"Volts" forSegmentAtIndex:4];
        
        unidad.text = [[NSString alloc]initWithFormat:@"Volts"];
        
        unidad1.text = [[NSString alloc]initWithFormat:@"V"];
        unidad2.text = [[NSString alloc]initWithFormat:@"V"];
        unidad3.text = [[NSString alloc]initWithFormat:@"V"];
        unidad4.text = [[NSString alloc]initWithFormat:@"V"];
        unidad5.text = [[NSString alloc]initWithFormat:@"V"];
        unidad6.text = [[NSString alloc]initWithFormat:@"V"];
        unidad7.text = [[NSString alloc]initWithFormat:@"V"];
        unidad8.text = [[NSString alloc]initWithFormat:@"V"];
        
        
    }
    
    if (unidades.selectedSegmentIndex == 2) {
        
       // [unidades2 setTitle:@"F" forSegmentAtIndex:4];

        
        unidad.text = [[NSString alloc]initWithFormat:@"Faradios"];
        
        unidad1.text = [[NSString alloc]initWithFormat:@"f"];
        unidad2.text = [[NSString alloc]initWithFormat:@"f"];
        unidad3.text = [[NSString alloc]initWithFormat:@"f"];
        unidad4.text = [[NSString alloc]initWithFormat:@"f"];
        unidad5.text = [[NSString alloc]initWithFormat:@"f"];
        unidad6.text = [[NSString alloc]initWithFormat:@"f"];
        unidad7.text = [[NSString alloc]initWithFormat:@"f"];
        unidad8.text = [[NSString alloc]initWithFormat:@"f"];
    }

}



-(IBAction)inicio:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil]; 
}


-(IBAction)seleccionunidades2:(id)sender{
    
    
    Numero = [valor.text doubleValue];
    NSLog(@"%.12lf",Numero);
    
    if (unidades2.selectedSegmentIndex == 0) {
        picoL.textColor = [UIColor blueColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];

        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        microL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
        miliL.text = [[NSString alloc]initWithFormat:@"%.9lf",Numero/1000000000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.12lf",Numero/1000000000000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -15",Numero];
        megaL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -18",Numero];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -21",Numero];
    }
    if (unidades2.selectedSegmentIndex == 1) {
        
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor blueColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        miliL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.9lf",Numero/1000000000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.12lf",Numero/1000000000000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -15",Numero];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -18",Numero];
    }
    if (unidades2.selectedSegmentIndex == 2){
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor blueColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        miliL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.9lf",Numero/1000000000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.12lf",Numero/1000000000000];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.0lf  Exp -15",Numero];
    }
    if (unidades2.selectedSegmentIndex == 3) {
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor blueColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000000];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        miliL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.9lf",Numero/1000000000];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.12lf",Numero/1000000000000];
    }
    if (unidades2.selectedSegmentIndex == 4) {
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor blueColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 12",Numero];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000000];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        miliL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.9lf",Numero/1000000000];
    }
    if (unidades2.selectedSegmentIndex == 5) {
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor blueColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 18",Numero];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 15",Numero];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000000];
        miliL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        megaL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.6lf",Numero/1000000];
    }
    if (unidades2.selectedSegmentIndex == 6) {
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor blueColor];
        gigaL.textColor = [UIColor whiteColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 21",Numero];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 18",Numero];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 15",Numero];
        miliL.text = [[NSString alloc]initWithFormat:@"%.1lf",Numero*1000000000];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero/1000];
    }
    if (unidades2.selectedSegmentIndex == 7) {
        picoL.textColor = [UIColor whiteColor];
        nanoL.textColor = [UIColor whiteColor];
        microL.textColor = [UIColor whiteColor];
        miliL.textColor = [UIColor whiteColor];
        ohmL.textColor = [UIColor whiteColor];
        kiloL.textColor = [UIColor whiteColor];
        megaL.textColor = [UIColor whiteColor];
        gigaL.textColor = [UIColor blueColor];
        
        picoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 21",Numero];
        nanoL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 18",Numero];
        microL.text = [[NSString alloc]initWithFormat:@"%.3lf  Exp 15",Numero];
        miliL.text = [[NSString alloc]initWithFormat:@"%.3lf   Exp 12",Numero];
        ohmL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000000];
        kiloL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000000];
        megaL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero*1000];
        gigaL.text = [[NSString alloc]initWithFormat:@"%.3lf",Numero];
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
    
    valor.font  = [UIFont fontWithName:@"DS-Digital" size: 30];
    picoL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    nanoL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    microL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    miliL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    ohmL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    kiloL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    megaL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];
    gigaL.font  = [UIFont fontWithName:@"DS-Digital" size: 36];

    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:10],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    Numero = [valor.text doubleValue];

    
    
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
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
