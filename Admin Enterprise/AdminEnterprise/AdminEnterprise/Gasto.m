//
//  Gasto.m
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 12/03/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Gasto.h"

@implementation Gasto
@synthesize Concepto;
@synthesize Precio;
@synthesize Fecha;


-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {

        Concepto = @"Sin Concepto";
        Precio = 0;
        Fecha = [NSDate date];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    //Encode properties, other class variables, etc
    
    if (self) {
        
        [encoder encodeObject:self.Concepto forKey:@"ConceptoG"];
        [encoder encodeDouble:self.Precio forKey:@"PrecioG"];
        [encoder encodeObject:self.Fecha forKey:@"FechaG"];

    }
    
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        //decode properties, other class vars
        self.Concepto = [decoder decodeObjectForKey:@"ConceptoG"];
        self.Precio= [decoder decodeDoubleForKey:@"PrecioG"];
        self.Fecha = [decoder decodeObjectForKey:@"FechaG"];

    }
    return self;
}

@end
