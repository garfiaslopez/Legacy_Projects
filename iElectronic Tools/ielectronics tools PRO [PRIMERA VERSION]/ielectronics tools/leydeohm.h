//
//  leydeohm.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface leydeohm : UIViewController{

    IBOutlet UISegmentedControl *unidadesvoltaje;
    IBOutlet UISegmentedControl *unidadesresistencia;
    IBOutlet UISegmentedControl *unidadesintensidad;
    
    IBOutlet UITextField *voltajeentrada;
    IBOutlet UITextField *resistenciaentrada;
    IBOutlet UITextField *intensidadentrada;
    
    IBOutlet UILabel *resultadoMili;
    IBOutlet UILabel *resultado;
    IBOutlet UILabel *resultadoKilo;
    IBOutlet UILabel *unidad;
    IBOutlet UILabel *unidad1;
    IBOutlet UILabel *unidad2;
    
    

}

-(IBAction)inicio:(id)sender;
-(IBAction)calcular:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@end
