//
//  Diagramas.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 21/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiagramaFuentedepoder.h"

@class DiagramaFuentedepoder;

@interface Diagramas : UIViewController{
    
    IBOutlet UIScrollView * scroller;

    DiagramaFuentedepoder *Fuentedepoder;

}

@property (nonatomic, retain)    DiagramaFuentedepoder *Fuentedepoder;

@property (nonatomic, retain) IBOutlet UIScrollView * scroller;

-(IBAction)inicio:(id)sender;

-(IBAction)instrucciones:(id)sender;

-(IBAction)Fuentedepoder:(id)sender;

-(IBAction)Ledsvariables:(id)sender;

-(IBAction)Pianoelectronico:(id)sender;

-(IBAction)Luznocturna:(id)sender;

-(IBAction)Detectordehumedad:(id)sender;

-(IBAction)Repelenteultrasonico:(id)sender;

-(IBAction)Alarmaelectronica:(id)sender;

-(IBAction)Sirenapolicial:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;




@end
