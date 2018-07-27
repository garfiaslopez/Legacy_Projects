//
//  Reactancia.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 22/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Reactancia : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UILabel *CapacitorLabel;
@property (strong, nonatomic) IBOutlet UILabel *BobinaLabel;
@property (strong, nonatomic) IBOutlet UILabel *FrecuenciaLabel;


@property (strong, nonatomic) IBOutlet UILabel *InductivaLabel;
@property (strong, nonatomic) IBOutlet UILabel *CapacitivaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResonanciaLabel;
@property (strong, nonatomic) IBOutlet UITextField *CapacitorTextField;
@property (strong, nonatomic) IBOutlet UITextField *BobinaTextField;
@property (strong, nonatomic) IBOutlet UITextField *FrecuenciaTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadCapacitor;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadBobina;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadFrecuencia;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoInductancia;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoCapacitancia;

@property (strong, nonatomic) IBOutlet UILabel *ResutaldoFresonancia;

- (IBAction)Calcular:(id)sender;

- (IBAction)Inicio:(id)sender;

- (IBAction)Ayuda:(id)sender;























@end
