//
//  Ticket.h
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venta : NSObject

@property()int NumeroVenta;
@property(copy)NSDate *Fecha;
@property(copy)NSMutableArray *Conceptos;
@property(copy)NSString *Empleado;
@property()double Total;
@property(copy)UIImage *ImagenTicket;



@end
