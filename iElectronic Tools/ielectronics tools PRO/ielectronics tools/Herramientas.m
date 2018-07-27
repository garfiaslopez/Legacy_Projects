//
//  Herramientas.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 23/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "Herramientas.h"
#import "Ajustes.h"
#import "CalculadoraRes.h"
#import "ConversorUnidades.h"
#import "leydeohm.h"
#import "CalculadoraResInversa.h"
#import "Diagramas.h"
#import "DivTension.h"
#import "CondensadoresColor.h"
#import "CondensadoresNumeros.h"
#import "DecimalBinarioHexOct.h"
#import "ConversorNBase.h"
#import "CompuertasLogicas.h"
#import "Creditos.h"
#import "SerieParaleloCap.h"
#import "SerieParaleloTest.h"
#import "Inductancia.h"
#import "Resonancia.h"
#import "DiodoZener.h"
#import "Reactancia.h"
#import "TablaAWG.h"
#import "Transformadores.h"
#import "Inductancia.h"
#import "impedancia.h"
#import "Flips Flops.h"
#import "DecimalGrados.h"
#import "Decibeles.h"
#import "LedResistencia.h"



@interface Herramientas ()


@end

@implementation Herramientas
@synthesize resistenciaslabel;
@synthesize capacitorlabel;
@synthesize Leyohmlabel;
@synthesize DivTensionLabel;
@synthesize BinHexLabel;
@synthesize ConversorLabel;
@synthesize CompuertasLabel;
@synthesize ResistenciasColorLabel;
@synthesize NbaseLabel;
@synthesize ColorCapLabel;
@synthesize DiagramasLabel;
@synthesize infoLabel;
@synthesize ResistenciaSyPLabel;
@synthesize CapacitorSyPLabel;
@synthesize MainScroller;
@synthesize Tittle;
@synthesize ResonanciaLabel;
@synthesize ZenerLabel;
@synthesize ReactanciaLabel;
@synthesize TablaAWGLabel;
@synthesize InductanciaLabel;
@synthesize TransformadorLabel;
@synthesize FlipFlopsLabel;
@synthesize ImpedanciaLabel;
@synthesize GradosLabel;
@synthesize RLCLabel;


-(IBAction)cargadecimalconversiones:(id)sender{

    decimalconversiones = [self.storyboard instantiateViewControllerWithIdentifier:@"DecBinHexOct"];
    decimalconversiones.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:decimalconversiones animated:YES completion:NULL];

}

-(IBAction)cargaconvertidorNbase:(id)sender{
    
    convertidoraNbase = [self.storyboard instantiateViewControllerWithIdentifier:@"ConvertidorNBase"];
    convertidoraNbase.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:convertidoraNbase animated:YES completion:NULL];

}

-(IBAction)cargacompuertaslogicas:(id)sender{

    compuertalogica = [self.storyboard instantiateViewControllerWithIdentifier:@"Compuertalogica"];
    compuertalogica.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:compuertalogica animated:YES completion:NULL];
    

}

-(IBAction)cargaresistenciasvalor:(id)sender{
    
    calculadorainversa = [self.storyboard instantiateViewControllerWithIdentifier:@"calculadorainversa"];
    calculadorainversa.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:calculadorainversa animated:YES completion:NULL];

}

-(IBAction)Cargacondensadoresnumeros:(id)sender{
    
    Condensadornumeros = [self.storyboard instantiateViewControllerWithIdentifier:@"Condensadoresnumeros"];
    Condensadornumeros.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:Condensadornumeros animated:YES completion:NULL];

}


-(IBAction)Cargacondensadorescolor:(id)sender{

    Condensadorcolor = [self.storyboard instantiateViewControllerWithIdentifier:@"Condensadorescolor"];
    Condensadorcolor.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:Condensadorcolor animated:YES completion:NULL];


}


-(IBAction)cargadivisordetension:(id)sender{
    
    Divisortension = [self.storyboard instantiateViewControllerWithIdentifier:@"Tension"];
    Divisortension.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:Divisortension animated:YES completion:NULL];

}

-(IBAction)cargadiagramas:(id)sender{
    menudiagramas = [self.storyboard instantiateViewControllerWithIdentifier:@"Diagramas"];
    menudiagramas.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:menudiagramas animated:YES completion:NULL];

}

- (IBAction)cargaResSyP:(id)sender {
    
    resistenciasSeriePara = [self.storyboard instantiateViewControllerWithIdentifier:@"ResisSerPar"];
    resistenciasSeriePara.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:resistenciasSeriePara animated:YES completion:NULL];
    
}

- (IBAction)cargaCapSyP:(id)sender {
    
    capacitoresSeriePara = [self.storyboard instantiateViewControllerWithIdentifier:@"CapaSerPar"];
    capacitoresSeriePara.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:capacitoresSeriePara animated:YES completion:NULL];
}

- (IBAction)cargaResonancia:(id)sender {
    
    ResonanciaView = [self.storyboard instantiateViewControllerWithIdentifier:@"ReactanciaSB"];
    ResonanciaView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ResonanciaView animated:YES completion:NULL];
    
}

- (IBAction)CargaDiodoZener:(id)sender {
    
    ZenerView = [self.storyboard instantiateViewControllerWithIdentifier:@"Zener"];
    ZenerView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ZenerView animated:YES completion:NULL];

}

- (IBAction)cargaReactancia:(id)sender {
    
    ZenerView = [self.storyboard instantiateViewControllerWithIdentifier:@"CircuitoRLCSB"];
    ZenerView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:ZenerView animated:YES completion:NULL];
}

- (IBAction)cargaTablaAWG:(id)sender {
    
    TablaAWGView = [self.storyboard instantiateViewControllerWithIdentifier:@"TablaAWGSB"];
    TablaAWGView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:TablaAWGView animated:YES completion:NULL];
    
}

- (IBAction)cargaInductancia:(id)sender {
    
    InductanciaView = [self.storyboard instantiateViewControllerWithIdentifier:@"InductanciaSB"];
    InductanciaView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:InductanciaView animated:YES completion:NULL];
    

}

- (IBAction)cargaTransformador:(id)sender {
    
    
    transformadoresView = [self.storyboard instantiateViewControllerWithIdentifier:@"TransformadoresSB"];
    transformadoresView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:transformadoresView animated:YES completion:NULL];
    

}

- (IBAction)cargaFlipFlops:(id)sender {
    
    
    flipflopsview = [self.storyboard instantiateViewControllerWithIdentifier:@"FlipFlopsSB"];
    flipflopsview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:flipflopsview animated:YES completion:NULL];
    

}

- (IBAction)cargaImpedancia:(id)sender {
    
    impedanciaView = [self.storyboard instantiateViewControllerWithIdentifier:@"impedanciaSB"];
    impedanciaView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:impedanciaView animated:YES completion:NULL];
    

}

- (IBAction)cargaGrados:(id)sender {
    
    decimalgradosView = [self.storyboard instantiateViewControllerWithIdentifier:@"DecimalGradosSB"];
    decimalgradosView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:decimalgradosView animated:YES completion:NULL];
    

    
}

- (IBAction)CargaLedResistencia:(id)sender {
    
    LedResistenciaView = [self.storyboard instantiateViewControllerWithIdentifier:@"LedResistenciaSB"];
    LedResistenciaView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:LedResistenciaView animated:YES completion:NULL];
    

}

- (IBAction)CargaDecibeles:(id)sender {
    
    DecibelesView = [self.storyboard instantiateViewControllerWithIdentifier:@"DecibelesSB"];
    DecibelesView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:DecibelesView animated:YES completion:NULL];
}


-(IBAction)cargarleydeohm:(id)sender{

    calculadoraley = [self.storyboard instantiateViewControllerWithIdentifier:@"leydeohm"];
    
    calculadoraley.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:calculadoraley animated:YES completion:NULL];

}

-(IBAction)cargarconversor:(id)sender{
    
    Conversor = [self.storyboard instantiateViewControllerWithIdentifier:@"conversorunidades"];
    
    Conversor.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:Conversor animated:YES completion:NULL];
    

}

-(IBAction)cargaresistencias:(id)sender{
    
    cuatrobandas = [self.storyboard instantiateViewControllerWithIdentifier:@"cuatrobandas"];
    
    cuatrobandas.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:cuatrobandas animated:YES completion:NULL];


}

-(IBAction)cargarcreditos:(id)sender{

    paginacreditos = [self.storyboard instantiateViewControllerWithIdentifier:@"Creditos"];
    
    paginacreditos.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:paginacreditos animated:YES completion:NULL];
    
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

    
    [UIView animateWithDuration:1.5 animations:^(){
            Tittle.frame = CGRectMake(0, 20, 320, 44);
        }];

    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320, 1190);
    }
    else{
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320,1290);
    }
    
    [self.Tittle setTitleTextAttributes:@{
                                          UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                          UITextAttributeTextColor:[UIColor whiteColor]
                                          }];

    /*
    resistenciaslabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    capacitorlabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    Leyohmlabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    DivTensionLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    BinHexLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ConversorLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    CompuertasLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ResistenciasColorLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    NbaseLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ColorCapLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    DiagramasLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    infoLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ResistenciaSyPLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    CapacitorSyPLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    
    ResonanciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    ZenerLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    ReactanciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    TablaAWGLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    InductanciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    TransformadorLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    FlipFlopsLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    ImpedanciaLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    GradosLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];
    RLCLabel.font = [UIFont fontWithName:@"Coming Soon" size:15];

    
   
 
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadstring = [defaults objectForKey:@"savedstring"];
    
    if ([loadstring isEqualToString: @"ingles"]){
        
        UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboardIngles" bundle:nil];
        
        UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
        
        InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
        
    }
    */
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setInductanciaLabel:nil];
    [self setTransformadorLabel:nil];
    [self setFlipFlopsLabel:nil];
    [self setImpedanciaLabel:nil];
    [self setGradosLabel:nil];
    [self setRLCLabel:nil];
    [super viewDidUnload];
}
@end
