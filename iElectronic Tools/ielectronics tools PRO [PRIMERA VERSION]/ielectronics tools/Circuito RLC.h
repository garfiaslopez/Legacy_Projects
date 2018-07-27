//
//  Circuito RLC.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 04/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Circuito_RLC : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UIScrollView *SubScroller;
@property (strong, nonatomic) IBOutlet UILabel *VoltajeLabel;
@property (strong, nonatomic) IBOutlet UITextField *VoltsTextField;
@property (strong, nonatomic) IBOutlet UILabel *FrecuenciaLabel;
@property (strong, nonatomic) IBOutlet UITextField *FrecuenciaTextField;
@property (strong, nonatomic) IBOutlet UITextField *ResistenciaTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesResistencia;
@property (strong, nonatomic) IBOutlet UITextField *CapacitorTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesCapacitor;
@property (strong, nonatomic) IBOutlet UITextField *BobinaTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesBobina;
@property (strong, nonatomic) IBOutlet UILabel *XCLabel;
@property (strong, nonatomic) IBOutlet UILabel *XLlabel;
@property (strong, nonatomic) IBOutlet UILabel *FrecResonanciaLabe;
@property (strong, nonatomic) IBOutlet UILabel *ResXCLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResXLLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResFrecResonanciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ImpedanciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResImpedanciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *ImaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResImaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *VRLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResVRLabel;
@property (strong, nonatomic) IBOutlet UILabel *VLLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResVLLabel;
@property (strong, nonatomic) IBOutlet UILabel *VCLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResVCLabel;
@property (strong, nonatomic) IBOutlet UILabel *TriangleImpLabel;
@property (strong, nonatomic) IBOutlet UILabel *TgAnguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *AnguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResTgAnguloLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResGradosLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResMinLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResSegLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResMsegLabel;
@property (strong, nonatomic) IBOutlet UILabel *TrianglePoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *PLabel;
@property (strong, nonatomic) IBOutlet UILabel *QLabel;
@property (strong, nonatomic) IBOutlet UILabel *SLabel;
@property (strong, nonatomic) IBOutlet UILabel *FactorPoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResPLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResQLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResSLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResFatorPoteLabel;
@property (strong, nonatomic) IBOutlet UIView *TriangImpeView;
@property (strong, nonatomic) IBOutlet UIView *TriangPoteView;


- (IBAction)ImagenTrianImpe:(id)sender;
- (IBAction)ImagenTrianPote:(id)sender;

- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;
- (IBAction)Calcular:(id)sender;

@end
