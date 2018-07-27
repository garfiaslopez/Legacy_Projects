//
//  Decibeles.m
//  iElectronic Tools PRO
//
//  Created by Jose De Jesus Garfias Lopez on 20/02/14.
//  Copyright (c) 2014 Jose Garfias Lopez. All rights reserved.
//

#import "Decibeles.h"
#include <math.h>

@interface Decibeles ()

@end

@implementation Decibeles
@synthesize IntensidadTextField;
@synthesize RefIntensidadTextField;
@synthesize DecibelTextField;
@synthesize Resultado;
@synthesize UnidadResul;
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


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}


-(void)dismissKeyboard {
    
    
    [IntensidadTextField resignFirstResponder];
    [RefIntensidadTextField resignFirstResponder];
    [DecibelTextField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Calcular:(id)sender {
    
    double I = [IntensidadTextField.text doubleValue];
    double Io = [RefIntensidadTextField.text doubleValue];
    double IL = [DecibelTextField.text doubleValue];
    
    
    if (I!=0 && Io != 0) {
        //calcula IL:
        
        IL =10* log10(I/Io);
        
        NSLog(@"%f",IL);
        
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",IL];
        UnidadResul.text = [[NSString alloc]initWithFormat:@"Db"];
    }
    
    else if (I!=0 && IL != 0) {
        //calcula IL:
        
        Io = I/(pow(10, IL/10));
        
        NSLog(@"%f",Io);
        
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",Io];
        UnidadResul.text = [[NSString alloc]initWithFormat:@"Watts"];
    }
    
    
    else if (Io!=0 && IL != 0) {
        //calcula IL:
        
        I = Io*(pow(10, IL/10));
        
        NSLog(@"%f",I);
        
        Resultado.text = [[NSString alloc]initWithFormat:@"%.3f",I];
        UnidadResul.text = [[NSString alloc]initWithFormat:@"Watts"];
    }
    else{
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Error:" message:@"Rellena los campos con los dos datos que tengas, deja libre el campo del cual quieras calcular." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [error show];
    
    }
    
    
    
    
}

- (IBAction)Inicio:(id)sender {
    
    [IntensidadTextField resignFirstResponder];
    [RefIntensidadTextField resignFirstResponder];
    [DecibelTextField resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Ayuda:(id)sender {
    
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Instrucciones:" message:@"Rellena los campos con los dos datos que tengas, deja libre el campo del cual quieras calcular." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
}
@end
