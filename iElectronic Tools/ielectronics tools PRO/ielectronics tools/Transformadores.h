//
//  Transformadores.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 02/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Transformadores : UIViewController



@property (strong, nonatomic) IBOutlet UILabel *Salida2Label;

@property (strong, nonatomic) IBOutlet UILabel *SalidaLabel;
@property (strong, nonatomic) IBOutlet UILabel *EntradaLabel;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller2;
@property (strong, nonatomic) IBOutlet UITextField *EntradaVoltsTextField;
@property (strong, nonatomic) IBOutlet UITextField *SalidaVoltsTextField;
@property (strong, nonatomic) IBOutlet UITextField *EntradaAmpTextField;
@property (strong, nonatomic) IBOutlet UITextField *EntradaVolts2TextField;
@property (strong, nonatomic) IBOutlet UITextField *EntradaAmp2TextField;

@property (strong, nonatomic) IBOutlet UILabel *PotenciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResPotenciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *NucleoLabel;
@property (strong, nonatomic) IBOutlet UILabel *AreaNucleoLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAreaNucleoLabel;
@property (strong, nonatomic) IBOutlet UILabel *DevanadoPrimarioLabel;
@property (strong, nonatomic) IBOutlet UILabel *DevanadoSecLabel;
@property (strong, nonatomic) IBOutlet UILabel *DevanadoAdicLabel;

@property (strong, nonatomic) IBOutlet UILabel *AWG1Label;
@property (strong, nonatomic) IBOutlet UILabel *Vueltas1Label;
@property (strong, nonatomic) IBOutlet UILabel *Amperaje1Label;
@property (strong, nonatomic) IBOutlet UILabel *AWG2Label;
@property (strong, nonatomic) IBOutlet UILabel *Vueltas2Label;
@property (strong, nonatomic) IBOutlet UILabel *Amperaje2Label;

@property (strong, nonatomic) IBOutlet UILabel *AWG3Label;
@property (strong, nonatomic) IBOutlet UILabel *Vueltas3Label;
@property (strong, nonatomic) IBOutlet UILabel *Amperaje3Label;

@property (strong, nonatomic) IBOutlet UILabel *ResVueltasPrimLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAWGPrimLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAmpPrimLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAWGSecLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResVueltasSecLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAmpSecLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAWGAdicLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResVueltasAdicLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResAmpAdicLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResNucleoMedLabel;



- (IBAction)Calcular:(id)sender;

- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;


@end
