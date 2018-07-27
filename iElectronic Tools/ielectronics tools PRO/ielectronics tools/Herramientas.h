//
//  Herramientas.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 23/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CalculadoraRes;
@class ConversorUnidades;
@class leydeohm;
@class CalculadoraResInversa;
@class Diagramas;
@class DivTension;
@class CondensadoresColor;
@class CondensadoresNumeros;
@class DecimalBinarioHexOct;
@class ConversorNBase;
@class CompuertasLogicas;
@class Creditos;
@class SerieParaleloTest;
@class SerieParaleloCap;
@class Inductancia;
@class Resonancia;
@class DiodoZener;
@class Reactancia;
@class TablaAWG;
@class Inductancia;
@class Flips_Flops;
@class Transformadores;
@class impedancia;
@class DecimalGrados;
@class LedResistencia;
@class Decibeles;


@interface Herramientas : UIViewController{

    IBOutlet UIScrollView *scroller;
    
    
    Creditos *paginacreditos;
    CalculadoraRes *cuatrobandas;
    ConversorUnidades *Conversor;
    leydeohm *calculadoraley;
    CalculadoraResInversa *calculadorainversa;
    Diagramas *menudiagramas;
    DivTension *Divisortension;
    CondensadoresColor *Condensadorcolor;
    CondensadoresNumeros * Condensadornumeros;
    DecimalBinarioHexOct * decimalconversiones;
    ConversorNBase * convertidoraNbase;
    CompuertasLogicas * compuertalogica;
    SerieParaleloCap *capacitoresSeriePara;
    SerieParaleloTest *resistenciasSeriePara;
    Inductancia *Inductanciamag;
    Resonancia *ResonanciaView;
    DiodoZener *ZenerView;
    Reactancia *ReactanciaView;
    TablaAWG *TablaAWGView;
    Inductancia *InductanciaView;
    Flips_Flops *flipflopsview;
    Transformadores *transformadoresView;
    impedancia *impedanciaView;
    DecimalGrados *decimalgradosView;
    LedResistencia *LedResistenciaView;
    Decibeles *DecibelesView;
    
    
    IBOutlet UILabel *capacitorlabel;
    IBOutlet UILabel *resistenciaslabel;
    

}
@property (strong, nonatomic) IBOutlet UINavigationBar *Tittle;

@property (strong, nonatomic) IBOutlet UIScrollView *MainScroller;

@property (weak, nonatomic) IBOutlet UILabel *idioma;

@property (nonatomic,retain) IBOutlet UILabel *capacitorlabel;

@property (nonatomic,retain) IBOutlet UILabel *resistenciaslabel;

@property (strong, nonatomic) IBOutlet UILabel *Leyohmlabel;

@property (strong, nonatomic) IBOutlet UILabel *DivTensionLabel;

@property (strong, nonatomic) IBOutlet UILabel *BinHexLabel;

@property (strong, nonatomic) IBOutlet UILabel *ConversorLabel;

@property (strong, nonatomic) IBOutlet UILabel *CompuertasLabel;

@property (strong, nonatomic) IBOutlet UILabel *ResistenciasColorLabel;

@property (strong, nonatomic) IBOutlet UILabel *NbaseLabel;

@property (strong, nonatomic) IBOutlet UILabel *ColorCapLabel;

@property (strong, nonatomic) IBOutlet UILabel *DiagramasLabel;

@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

@property (strong, nonatomic) IBOutlet UILabel *ResistenciaSyPLabel;

@property (strong, nonatomic) IBOutlet UILabel *CapacitorSyPLabel;

@property (strong, nonatomic) IBOutlet UILabel *ResonanciaLabel;

@property (strong, nonatomic) IBOutlet UILabel *ZenerLabel;

@property (strong, nonatomic) IBOutlet UILabel *ReactanciaLabel;

@property (strong, nonatomic) IBOutlet UILabel *TablaAWGLabel;

@property (strong, nonatomic) IBOutlet UILabel *InductanciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *TransformadorLabel;
@property (strong, nonatomic) IBOutlet UILabel *FlipFlopsLabel;
@property (strong, nonatomic) IBOutlet UILabel *ImpedanciaLabel;
@property (strong, nonatomic) IBOutlet UILabel *GradosLabel;

@property (strong, nonatomic) IBOutlet UILabel *RLCLabel;


-(IBAction)cargadecimalconversiones:(id)sender;

-(IBAction)cargaconvertidorNbase:(id)sender;

-(IBAction)cargacompuertaslogicas:(id)sender;

-(IBAction)cargaresistenciasvalor:(id)sender;

-(IBAction)Cargacondensadoresnumeros:(id)sender;

-(IBAction)Cargacondensadorescolor:(id)sender;

-(IBAction)cargadivisordetension:(id)sender;

-(IBAction)cargarcreditos:(id)sender;

-(IBAction)cargaresistencias:(id)sender;

-(IBAction)cargarconversor:(id)sender;

-(IBAction)cargarleydeohm:(id)sender;

-(IBAction)cargadiagramas:(id)sender;

- (IBAction)cargaResSyP:(id)sender;

- (IBAction)cargaCapSyP:(id)sender;

- (IBAction)cargaResonancia:(id)sender;

- (IBAction)CargaDiodoZener:(id)sender;

- (IBAction)cargaReactancia:(id)sender;

- (IBAction)cargaTablaAWG:(id)sender;

- (IBAction)cargaInductancia:(id)sender;

- (IBAction)cargaTransformador:(id)sender;

- (IBAction)cargaFlipFlops:(id)sender;

- (IBAction)cargaImpedancia:(id)sender;

- (IBAction)cargaGrados:(id)sender;

- (IBAction)CargaLedResistencia:(id)sender;

- (IBAction)CargaDecibeles:(id)sender;

@end
