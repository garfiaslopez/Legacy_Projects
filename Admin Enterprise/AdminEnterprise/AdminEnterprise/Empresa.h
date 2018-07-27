//
//  Empresa.h
//  CarWash 2.0
//
//  Created by Jose De Jesus Garfias Lopez on 13/04/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Configuracion.h"

@interface Empresa : NSObject

@property NSString *Nombre;
@property UIImage *LogoEnterprise;
@property NSMutableArray *Servicios;
@property NSMutableArray *Empleados;
@property Configuracion *Config;


@end
