//
//  Ticket.m
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Venta.h"

@implementation Venta

@synthesize NumeroVenta;
@synthesize Fecha;
@synthesize Conceptos;
@synthesize Empleado;
@synthesize Total;
@synthesize ImagenTicket;



-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {
        NumeroVenta = 0;
        Fecha = [NSDate date];
        Conceptos = [[NSMutableArray alloc]init];
        Empleado = @" ";
        Total = 0.00;
        ImagenTicket = [[UIImage alloc]init];
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    //Encode properties, other class variables, etc

    if (self) {
        
        [encoder encodeInt:self.NumeroVenta forKey:@"NumeroVenta"];
        [encoder encodeObject:self.Fecha forKey:@"Fecha"];
        [encoder encodeObject:self.Conceptos forKey:@"Conceptos"];
        [encoder encodeObject:self.Empleado forKey:@"Empleado"];
        [encoder encodeDouble:self.Total forKey:@"Total"];
        [encoder encodeObject:self.ImagenTicket forKey:@"ImagenTicket"];
    }

    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {

    
        //decode properties, other class vars
        self.NumeroVenta = [decoder decodeIntForKey:@"NumeroVenta"];
        self.Fecha = [decoder decodeObjectForKey:@"Fecha"];
        self.Conceptos= [decoder decodeObjectForKey:@"Conceptos"];
        self.Empleado = [decoder decodeObjectForKey:@"Empleado"];
        self.Total = [decoder decodeDoubleForKey:@"Total"];
        self.ImagenTicket = [decoder decodeObjectForKey:@"ImagenTicket"];
        
    }
    return self;
}



@end
