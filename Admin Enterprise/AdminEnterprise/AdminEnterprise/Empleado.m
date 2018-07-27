//
//  Usuario.m
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Empleado.h"

@implementation Empleado
@synthesize Nombre;
@synthesize Password;
@synthesize FechaRegistro;
@synthesize DiaInicio;
@synthesize DiaFinal;
@synthesize Ventas;
@synthesize Gastos;
@synthesize isAdmin;

-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {
        Nombre = @"No Name";
        Password = @"0000";
        FechaRegistro = nil;
        DiaInicio = nil;
        DiaFinal = nil;
        Ventas = [[NSMutableArray alloc]init];
        Gastos = [[NSMutableArray alloc]init];
        isAdmin = FALSE;
    }
    
    return self;
}

-(id)initWithObject:(Empleado*)tmp{
    
    self = [super init];
    
    if (self) {
        Nombre = tmp.Nombre;
        Password = tmp.Password;
        FechaRegistro = tmp.FechaRegistro;
        DiaInicio = tmp.DiaInicio;
        DiaFinal = tmp.DiaFinal;
        Ventas = tmp.Ventas;
        isAdmin = tmp.isAdmin;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    
        //Encode properties, other class variables, etc
    [encoder encodeObject:self.Nombre forKey:@"NombreU"];
    [encoder encodeObject:self.Password forKey:@"PasswordU"];
    [encoder encodeObject:self.FechaRegistro forKey:@"FechaRegistroU"];
    [encoder encodeObject:self.DiaInicio forKey:@"DiaInicioU"];
    [encoder encodeObject:self.DiaFinal forKey:@"DiaFinalU"];
    [encoder encodeObject:self.Ventas forKey:@"Tickets"];
    [encoder encodeObject:self.Gastos forKey:@"GastosU"];
    [encoder encodeBool:self.isAdmin forKey:@"isAdmin"];

}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        //decode properties, other class vars
        self.Nombre = [decoder decodeObjectForKey:@"NombreU"];
        self.Password = [decoder decodeObjectForKey:@"PasswordU"];
        self.FechaRegistro = [decoder decodeObjectForKey:@"FechaRegistroU"];
        self.DiaInicio = [decoder decodeObjectForKey:@"DiaInicioU"];
        self.DiaFinal = [decoder decodeObjectForKey:@"DiaFinalU"];
        self.Ventas = [decoder decodeObjectForKey:@"Tickets"];
        self.Gastos = [decoder decodeObjectForKey:@"GastosU"];
        self.isAdmin = [decoder decodeBoolForKey:@"isAdmin"];
    }
    return self;
}





@end
