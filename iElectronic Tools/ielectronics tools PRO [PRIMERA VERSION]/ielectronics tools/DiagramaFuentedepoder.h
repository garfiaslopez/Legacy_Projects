//
//  DiagramaFuentedepoder.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 21/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diagramas.h"

@class Diagramas;
@interface DiagramaFuentedepoder : UIViewController{

    UIImageView * imageView;
    
    Diagramas *menudiagramas;
    
    NSString *DiagramaAcargar;
}

@property(nonatomic, retain) UIImageView * imageView;

@property(nonatomic, retain) NSString *DiagramaAcargar;

-(IBAction)opciones:(UITapGestureRecognizer *)recognizer;

-(IBAction)InicioDiagramas:(id)sender;

-(IBAction)Guardarimagen:(id)sender;


@end
