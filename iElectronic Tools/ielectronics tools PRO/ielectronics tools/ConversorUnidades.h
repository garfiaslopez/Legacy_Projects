//
//  ConversorUnidades.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConversorUnidades : UIViewController<UITextFieldDelegate>{
    
    IBOutlet UISegmentedControl *unidades;

    IBOutlet UISegmentedControl *unidades2;
    IBOutlet UITextField *valor;
    IBOutlet UILabel *nanoL;
    IBOutlet UILabel *microL;
    IBOutlet UILabel *miliL;
    IBOutlet UILabel *ohmL;
    IBOutlet UILabel *kiloL;
    IBOutlet UILabel *megaL;
    IBOutlet UILabel *gigaL;
    IBOutlet UILabel *picoL;
    
    IBOutlet UILabel *unidad;
    IBOutlet UILabel *unidad1;
    IBOutlet UILabel *unidad2;
    IBOutlet UILabel *unidad3;
    IBOutlet UILabel *unidad4;
    IBOutlet UILabel *unidad5;
    IBOutlet UILabel *unidad6;
    IBOutlet UILabel *unidad7;
    IBOutlet UILabel *unidad8;

}



-(IBAction)inicio:(id)sender;
-(IBAction)instrucciones:(id)sender;
-(IBAction)seleccionunidades:(id)sender;
-(IBAction)seleccionunidades2:(id)sender;


@property(nonatomic,retain) IBOutlet UISegmentedControl *unidades;
@property(nonatomic,retain) IBOutlet UISegmentedControl *unidades2;

@property (nonatomic,retain)IBOutlet UITextField *valor;
@property (nonatomic,retain) IBOutlet UILabel *nanoL;
@property (nonatomic,retain) IBOutlet UILabel *microL;
@property (nonatomic,retain) IBOutlet UILabel *miliL;
@property (nonatomic,retain) IBOutlet UILabel *ohmL;
@property (nonatomic,retain) IBOutlet UILabel *kiloL;
@property (nonatomic,retain) IBOutlet UILabel *megaL;
@property (nonatomic,retain) IBOutlet UILabel *gigaL;
@property (nonatomic,retain) IBOutlet UILabel *picoL;

@property (nonatomic,retain) IBOutlet UILabel *unidad;
@property (nonatomic,retain) IBOutlet UILabel *unidad1;
@property (nonatomic,retain) IBOutlet UILabel *unidad2;
@property (nonatomic,retain) IBOutlet UILabel *unidad3;
@property (nonatomic,retain) IBOutlet UILabel *unidad4;
@property (nonatomic,retain) IBOutlet UILabel *unidad5;
@property (nonatomic,retain) IBOutlet UILabel *unidad6;
@property (nonatomic,retain) IBOutlet UILabel *unidad7;
@property (nonatomic,retain) IBOutlet UILabel *unidad8;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;


@end
