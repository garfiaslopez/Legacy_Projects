//
//  CondensadoresNumeros.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface CondensadoresNumeros : UIViewController<ADBannerViewDelegate>{
    
    IBOutlet UITextField *Valorentrada;
    IBOutlet UISegmentedControl *NumeroyLetra;
    IBOutlet UISegmentedControl *Letra;
    IBOutlet UISegmentedControl *marca;
    
    IBOutlet UILabel * Resultado;
    IBOutlet UILabel * Resultadonano;
    IBOutlet UILabel * Resultadomicro;
    
    IBOutlet UILabel * tolerancialabel;
    IBOutlet UILabel * voltajelabel;
    IBOutlet UILabel * marcalabel;
    
    IBOutlet UILabel * picolabel;
    IBOutlet UILabel * nanolabel;
    IBOutlet UILabel * microlabel;

    IBOutlet UILabel  * Tolerancia;
    IBOutlet UILabel * Voltaje;
    


}

-(IBAction)inicio:(id)sender;

-(IBAction)Calcular:(id)sender;

-(IBAction)instrucciones:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (nonatomic, retain)    IBOutlet UITextField *Valorentrada;
@property (nonatomic, retain)    IBOutlet UISegmentedControl *NumeroyLetra;
@property (nonatomic, retain)    IBOutlet UISegmentedControl *Letra;
@property (nonatomic, retain)    IBOutlet UISegmentedControl *marca;

@property (nonatomic, retain)    IBOutlet UILabel * Resultado;
@property (nonatomic, retain)    IBOutlet UILabel * Resultadonano;
@property (nonatomic, retain)    IBOutlet UILabel * Resultadomicro;

@property (nonatomic,retain) IBOutlet UILabel * tolerancialabel;
@property (nonatomic,retain) IBOutlet UILabel * voltajelabel;
@property (nonatomic,retain) IBOutlet UILabel * marcalabel;

@property (nonatomic,retain) IBOutlet UILabel * picolabel;
@property (nonatomic,retain) IBOutlet UILabel * nanolabel;
@property (nonatomic,retain) IBOutlet UILabel * microlabel;

@property (nonatomic, retain)    IBOutlet UILabel * Tolerancia;
@property (nonatomic, retain)    IBOutlet UILabel * Voltaje;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@end
