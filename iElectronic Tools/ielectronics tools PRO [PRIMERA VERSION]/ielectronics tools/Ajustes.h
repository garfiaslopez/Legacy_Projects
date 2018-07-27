//
//  Ajustes.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 23/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Herramientas.h"

@class Herramientas;

@interface Ajustes : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *idiomaconfigurado;

-(IBAction)guardaingles:(id)sender;
-(IBAction)guardaespanol:(id)sender;
-(IBAction)cerrar:(id)sender;

@end
