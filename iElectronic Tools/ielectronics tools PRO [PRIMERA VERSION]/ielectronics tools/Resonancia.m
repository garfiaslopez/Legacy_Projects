//
//  Resonancia.m
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 16/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#include <math.h>
#import "Resonancia.h"

@interface Resonancia ()

@end

@implementation Resonancia
@synthesize ResultadoLabel;
@synthesize ResultadoLabelK;
@synthesize ResultadoLabelM;
@synthesize BobinaIN;
@synthesize CapacitorIN;
@synthesize UnidadesCap;
@synthesize UnidadesInduc;
@synthesize Scroller;
@synthesize TituloNav;
@synthesize BobinaTituloLabel;
@synthesize CapacitorTituloLabel;

-(IBAction)inicio:(id)sender{

    [CapacitorIN resignFirstResponder];
    [BobinaIN resignFirstResponder];
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
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
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    
    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:13];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [UnidadesCap setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
    [UnidadesInduc setTitleTextAttributes:attributes
                               forState:UIControlStateNormal];
    
    
    
    
    CapacitorTituloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    
    BobinaTituloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    
    ResultadoLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoLabelK.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoLabelM.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    CapacitorIN.font = [UIFont fontWithName:@"DS-Digital" size:35];
    BobinaIN.font = [UIFont fontWithName:@"DS-Digital" size:35];
    
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
    double resultadoreso=0, tempo1=0, tempo2=0,valorbobina,valorcapacitor;
    
    
    valorcapacitor = [CapacitorIN.text doubleValue];
    valorbobina = [BobinaIN.text doubleValue];
    

    NSLog(@"%.12lf",valorcapacitor);
    NSLog(@"%.12lf",valorbobina);

    switch (UnidadesCap.selectedSegmentIndex) {
        case 0:
            valorcapacitor = valorcapacitor/1000000000000;
            break;
        case 1:
            valorcapacitor = valorcapacitor/1000000000;
            break;
        case 2:
            valorcapacitor = valorcapacitor/1000000;
            break;
        case 3:
            valorcapacitor = valorcapacitor/1000;
            break;
        case 4:
            valorcapacitor= valorcapacitor;
            break;
            
        default:
            break;
    }
    switch (UnidadesInduc.selectedSegmentIndex) {
        case 0:
            valorbobina = valorbobina/1000000;
            break;
        case 1:
            valorbobina = valorbobina/1000;
            break;
        case 2:
            valorbobina = valorbobina;
            break;
        default:
            break;
    }
    NSLog(@"%.12lf",valorcapacitor);
    NSLog(@"%lf",valorbobina);
    
    
    //FRECUENCIA DE RESONANCIA
    
    tempo1 = valorbobina * valorcapacitor;
    NSLog(@"%.12lf",tempo1);
    tempo1 = sqrt(tempo1);
    NSLog(@"%.12lf",tempo1);
    tempo2 = tempo1 * 6.28318;
    NSLog(@"%.12lf",tempo2);
    resultadoreso = 1/tempo2;
    NSLog(@"%.12lf",resultadoreso);

    ResultadoLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",resultadoreso];
    ResultadoLabelK.text = [[NSString alloc]initWithFormat:@"%.3lf",resultadoreso/1000];
    ResultadoLabelM.text = [[NSString alloc]initWithFormat:@"%.3lf",resultadoreso/1000000];
    
    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Introduce el valor de tu bobina y capacitor para calcular la resonancia en tu circuito LC." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
    
}

-(void)dismissKeyboard {
    
    [CapacitorIN resignFirstResponder];
    [BobinaIN resignFirstResponder];

}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setCapacitorTituloLabel:nil];
    [self setBobinaTituloLabel:nil];
    [super viewDidUnload];
}
@end
