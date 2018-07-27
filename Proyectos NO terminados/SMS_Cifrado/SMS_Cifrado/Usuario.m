//
//  Usuario.m
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario
@synthesize Nombre;
@synthesize Email;
@synthesize PasswordApp;
@synthesize PasswordServer;
@synthesize isStartProtected;
@synthesize isValidated;
@synthesize AccessTrys;
@synthesize Mensajes;
@synthesize Contactos;





-(id)init
{
    self = [super init];
    
    if (self) {
        
        Nombre = @"No Name";
        Email = @"No Email";
        PasswordServer = @"No PassServer";
        PasswordApp = @"No PassApp";
        isStartProtected = NO;
        isValidated = NO;
        AccessTrys = 0;
        Mensajes = [[NSMutableArray alloc]init];
        Contactos = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:Nombre forKey:@"NombreUsuario"];
    [encoder encodeObject:Email forKey:@"EmailUsuario"];
    [encoder encodeObject:PasswordServer forKey:@"PassServerUsuario"];
    [encoder encodeObject:PasswordApp forKey:@"PassAppUsuario"];
    [encoder encodeObject:Mensajes forKey:@"MensajesUsuario"];
    [encoder encodeObject:Contactos forKey:@"ContactosUsuario"];
    [encoder encodeBool:isStartProtected forKey:@"StarProtectedUsuario"];
    [encoder encodeBool:isValidated forKey:@"ValidatedUsuario"];
    [encoder encodeInt:AccessTrys forKey:@"TrysUsuario"];
}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self) {
        
        self.Nombre = [decoder decodeObjectForKey:@"NombreUsuario"];
        self.Email = [decoder decodeObjectForKey:@"EmailUsuario"];
        self.PasswordServer = [decoder decodeObjectForKey:@"PassServerUsuario"];
        self.PasswordApp = [decoder decodeObjectForKey:@"PassAppUsuario"];
        self.Mensajes = [decoder decodeObjectForKey:@"MensajesUsuario"];
        self.Contactos = [decoder decodeObjectForKey:@"ContactosUsuario"];
        self.isStartProtected = [decoder decodeBoolForKey:@"StarProtectedUsuario"];
        self.isValidated = [decoder decodeBoolForKey:@"ValidatedUsuario"];
        self.AccessTrys = [decoder decodeIntForKey:@"TrysUsuario"];

    }
    
    return self;
}





@end
