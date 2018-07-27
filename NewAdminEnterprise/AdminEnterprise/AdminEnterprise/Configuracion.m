//
//  Configuracion.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Configuracion.h"

@implementation Configuracion
@synthesize isLoged;
@synthesize isCloud;
@synthesize Usuario;
@synthesize Password;
@synthesize Ciudad;
@synthesize Nombre;


-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {
        
        isLoged = NO;
        isCloud = YES;
        Usuario = @"Sin Usuario";
        Password = @"NO password";
        Ciudad = @"Sin ciudad";
        Nombre = @"Sin Nombre";
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    //Encode properties, other class variables, etc
    
    if (self) {
        
        
        [encoder encodeBool:self.isLoged forKey:@"isLoged"];
        [encoder encodeBool:self.isLoged forKey:@"isCloud"];
        
        [encoder encodeObject:self.Usuario forKey:@"Usuario"];
        [encoder encodeObject:self.Password forKey:@"Password"];
        [encoder encodeObject:self.Ciudad forKey:@"Ciudad"];
        [encoder encodeObject:self.Nombre forKey:@"Nombre"];
        
    }
    
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        //decode properties, other class vars
        
        self.isLoged = [decoder decodeBoolForKey:@"isLoged"];
        self.isCloud = [decoder decodeBoolForKey:@"isCloud"];

        self.Usuario = [decoder decodeObjectForKey:@"Usuario"];
        self.Password = [decoder decodeObjectForKey:@"Password"];
        self.Ciudad = [decoder decodeObjectForKey:@"Ciudad"];
        self.Nombre = [decoder decodeObjectForKey:@"Nombre"];


        
    }
    return self;
}






@end
