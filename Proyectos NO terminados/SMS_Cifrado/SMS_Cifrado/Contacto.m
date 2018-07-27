//
//  Contacto.m
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Contacto.h"

@implementation Contacto

@synthesize Nombre;
@synthesize Telefono;
@synthesize Password;


-(id)init
{
    self = [super init];
    
    if (self) {
        
        Nombre = @"No Name";
        Telefono = @"No Telefono";
        Password = @"No Contrasena";

    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:Nombre forKey:@"NombreContacto"];
    [encoder encodeObject:Telefono forKey:@"TelContacto"];
    [encoder encodeObject:Password forKey:@"PassContacto"];

}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self)
    {
        
        self.Nombre = [decoder decodeObjectForKey:@"NombreContacto"];
        self.Telefono = [decoder decodeObjectForKey:@"TelContacto"];
        self.Password = [decoder decodeObjectForKey:@"PassContacto"];

    }
    
    return self;
}







@end
