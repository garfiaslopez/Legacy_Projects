//
//  DivTension.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 27/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DivTension : UIViewController{
    
    IBOutlet UITextField *Vinfield;
    IBOutlet UITextField *Rbottomfield;
    IBOutlet UITextField *Rtopfield;
    IBOutlet UITextField *Voutfield;
    
    IBOutlet UISegmentedControl *UnidadVinfield;
    IBOutlet UISegmentedControl *UnidadRbottomfield;
    IBOutlet UISegmentedControl *UnidadRtopfield;
    IBOutlet UISegmentedControl *UnidadVoutfield;
    
    IBOutlet UILabel *Resultadomili;
    IBOutlet UILabel *Resultado;
    IBOutlet UILabel *ResultadoKilo;
    IBOutlet UILabel *Unidadmili;
    IBOutlet UILabel *Unidad;
    IBOutlet UILabel *Unidadkilo;
    
    
}

-(IBAction)Regresarteclado:(id)sender;
-(IBAction)Calcular:(id)sender;
-(IBAction)inicio:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;


@property (nonatomic,retain) IBOutlet UITextField *Vinfield;
@property (nonatomic,retain) IBOutlet UITextField *Rbottomfield;
@property (nonatomic,retain) IBOutlet UITextField *Rtopfield;
@property (nonatomic,retain) IBOutlet UITextField *Voutfield;


@property (nonatomic,retain) IBOutlet UISegmentedControl *UnidadVinfield;
@property (nonatomic,retain) IBOutlet UISegmentedControl *UnidadRbottomfield;
@property (nonatomic,retain) IBOutlet UISegmentedControl *UnidadRtopfield;
@property (nonatomic,retain) IBOutlet UISegmentedControl *UnidadVoutfield;

@property (nonatomic,retain) IBOutlet UILabel *Resultadomili;
@property (nonatomic,retain) IBOutlet UILabel *Resultado;
@property (nonatomic,retain) IBOutlet UILabel *ResultadoKilo;
@property (nonatomic,retain) IBOutlet UILabel *Unidadmili;
@property (nonatomic,retain) IBOutlet UILabel *Unidad;
@property (nonatomic,retain) IBOutlet UILabel *Unidadkilo;

@end
