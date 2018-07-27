//
//  Usuario.h
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empleado : NSObject


@property(copy)NSString *Nombre;
@property(copy)NSString *Password;
@property(copy)NSDate *FechaRegistro;
@property(copy)NSDate *DiaInicio;
@property(copy)NSDate *DiaFinal;
@property(copy)NSMutableArray *Ventas;
@property(copy)NSMutableArray *Gastos;
@property()BOOL isAdmin;


-(id)initWithObject:(Empleado*)tmp;




@end
