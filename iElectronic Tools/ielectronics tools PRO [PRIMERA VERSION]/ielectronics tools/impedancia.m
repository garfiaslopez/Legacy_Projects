//
//  impedancia.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 25/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "impedancia.h"
#include <math.h>

@interface impedancia ()

@end

@implementation impedancia

@synthesize TituloNav;
@synthesize Scroller;
@synthesize UnidadesR;
@synthesize UnidadesXL;
@synthesize UnidadesXC;
@synthesize RTextField;
@synthesize XLTextField;
@synthesize XCTextField;
@synthesize ResOhms;
@synthesize ResKohms;
@synthesize ResMohms;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:13];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [UnidadesR setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
    [UnidadesXC setTitleTextAttributes:attributes
                              forState:UIControlStateNormal];
    [UnidadesXL setTitleTextAttributes:attributes
                              forState:UIControlStateNormal];
    
    RTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    XLTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    XCTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    ResOhms.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResKohms.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResMohms.font = [UIFont fontWithName:@"DS-Digital" size:60];

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
    
    [RTextField resignFirstResponder];
    [XLTextField resignFirstResponder];
    [XCTextField resignFirstResponder];
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


- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setUnidadesR:nil];
    [self setUnidadesXL:nil];
    [self setUnidadesXC:nil];
    [self setRTextField:nil];
    [self setXLTextField:nil];
    [self setXCTextField:nil];
    [self setResOhms:nil];
    [self setResKohms:nil];
    [self setResMohms:nil];
    [super viewDidUnload];
}
- (IBAction)Inicio:(id)sender {
    
    [RTextField resignFirstResponder];
    [XLTextField resignFirstResponder];
    [XCTextField resignFirstResponder];
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Inserta los valores correspondientes, puedes insertar tanto XL o XC o Ambos para calcular la impedancia." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
}

- (IBAction)Calcular:(id)sender {
    
    double ResisValor,XLValor,XCValor,tempo1=0,tempo2=0,resul=0;
    
    ResisValor = [RTextField.text doubleValue];
    XCValor = [XCTextField.text doubleValue];
    XLValor = [XLTextField.text doubleValue];
    
    switch (UnidadesR.selectedSegmentIndex) {
        case 0:
            ResisValor = ResisValor;
            break;
        case 1:
            ResisValor = ResisValor*1000;
            break;
        case 2:
            ResisValor = ResisValor*1000000;
            break;
        default:
            break;
    }
    
    switch (UnidadesXL.selectedSegmentIndex) {
        case 0:
            XLValor = XLValor;
            break;
        case 1:
            XLValor = XLValor*1000;
            break;
        case 2:
            XLValor = XLValor*1000000;
            break;

        default:
            break;
    }
    
    switch (UnidadesXC.selectedSegmentIndex) {
        case 0:
            XCValor = XCValor;
            break;
        case 1:
            XCValor = XCValor*1000;
            break;
        case 2:
            XCValor = XCValor*1000000;
            break;
            
        default:
            break;
    }
    
    
    
    
    if (ResisValor != 0 && XLValor != 0 && XCValor != 0) {
        
        tempo1 = XLValor - XCValor;
        tempo1 = pow(tempo1, 2);
        tempo2 = pow(ResisValor, 2);
        resul = sqrt(tempo1+tempo2);
        
        ResOhms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul];
        ResKohms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul/1000];
        ResMohms.text = [[NSString alloc]initWithFormat:@"%.6lf",resul/1000000];
    }
    
    
    
    if (ResisValor != 0 && XLValor != 0 && XCValor == 0) {
        
        tempo1 = XLValor;
        tempo1 = pow(tempo1, 2);
        tempo2 = pow(ResisValor, 2);
        resul = sqrt(tempo1+tempo2);
        
        ResOhms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul];
        ResKohms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul/1000];
        ResMohms.text = [[NSString alloc]initWithFormat:@"%.6lf",resul/1000000];
    }
    
    
    if (ResisValor != 0 && XLValor == 0 && XCValor != 0) {
        
        tempo1 = XCValor;
        tempo1 = pow(tempo1, 2);
        tempo2 = pow(ResisValor, 2);
        resul = sqrt(tempo1+tempo2);
        
        ResOhms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul];
        ResKohms.text = [[NSString alloc]initWithFormat:@"%.4lf",resul/1000];
        ResMohms.text = [[NSString alloc]initWithFormat:@"%.6lf",resul/1000000];
    }
    
    if (ResisValor == 0 && XLValor == 0 && XCValor == 0) {
    
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Inserta Almenos dos valores para poder calcular la impedancia." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
    
    
    
    
}
@end
