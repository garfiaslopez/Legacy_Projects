//
//  Empresa.m
//  CarWash 2.0
//
//  Created by Jose De Jesus Garfias Lopez on 13/04/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Empresa.h"
#import "Configuracion.h"

@implementation Empresa

@synthesize Nombre;
@synthesize Servicios;
@synthesize Empleados;
@synthesize Config;
@synthesize LogoEnterprise;

-(id)init
{
    self = [super init];
    
    if (self) {
        
        Nombre = @"No Name";
        Servicios = [[NSMutableArray alloc]init];
        Empleados = [[NSMutableArray alloc]init];
        LogoEnterprise = [UIImage imageNamed:@"shop-512.png"];
        Config = [[Configuracion alloc]init];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:Nombre forKey:@"NombreEmpresa"];
    [encoder encodeObject:LogoEnterprise forKey:@"LogoEnterprise"];
    [encoder encodeObject:Servicios forKey:@"ServiciosEmpresa"];
    [encoder encodeObject:Empleados forKey:@"EmpleadosEmpresa"];
    [encoder encodeObject:Config forKey:@"ConfigEmpresa"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        
        self.Nombre = [decoder decodeObjectForKey:@"NombreEmpresa"];
        self.LogoEnterprise = [decoder decodeObjectForKey:@"LogoEnterprise"];
        self.Servicios = [decoder decodeObjectForKey:@"ServiciosEmpresa"];
        self.Empleados = [decoder decodeObjectForKey:@"EmpleadosEmpresa"];
        self.Config = [decoder decodeObjectForKey:@"ConfigEmpresa"];
    
    }
    
    return self;
}


@end
