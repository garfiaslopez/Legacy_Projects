//
//  Servicio.m
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 14/03/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Servicio.h"

@implementation Servicio

@synthesize Concepto;
@synthesize Precio;
@synthesize Imagen;
@synthesize Cantidad;


-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {
        
        Concepto = @"Sin Servcicio";
        Precio = 0.0;
        Imagen = [[UIImage alloc]init];
        Cantidad = 0;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    //Encode properties, other class variables, etc
    
    if (self) {
        
        [encoder encodeObject:self.Concepto forKey:@"ConceptoServ"];
        [encoder encodeDouble:self.Precio forKey:@"PrecioServ"];
        [encoder encodeObject:self.Imagen forKey:@"ImagenServ"];
        [encoder encodeInt:self.Cantidad forKey:@"CantidadServ"];
        
    }
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        //decode properties, other class vars
        self.Concepto = [decoder decodeObjectForKey:@"ConceptoServ"];
        self.Precio= [decoder decodeDoubleForKey:@"PrecioServ"];
        self.Imagen = [decoder decodeObjectForKey:@"ImagenServ"];
        self.Cantidad = [decoder decodeIntForKey:@"CantidadServ"];
    }
    return self;
}


@end
