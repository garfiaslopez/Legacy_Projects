//
//  Mensaje.m
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Mensaje.h"

@implementation Mensaje

@synthesize Fecha;
@synthesize Cuerpo;
@synthesize Remitente;
@synthesize Destinatario;




-(id)init
{
    self = [super init];
    
    if (self) {
        
        Fecha = [NSDate date];
        Cuerpo = @"No Cuerpo";
        Remitente = @"No Remitente";
        Destinatario = @"No destinatario";
        
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:Fecha forKey:@"FechaMensaje"];
    [encoder encodeObject:Cuerpo forKey:@"CuerpoMensaje"];
    [encoder encodeObject:Remitente forKey:@"RemiMensaje"];
    [encoder encodeObject:Destinatario forKey:@"DestiMensaje"];

}

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self)
    {
        
        self.Fecha = [decoder decodeObjectForKey:@"FechaMensaje"];
        self.Cuerpo = [decoder decodeObjectForKey:@"CuerpoMensaje"];
        self.Remitente = [decoder decodeObjectForKey:@"RemiMensaje"];
        self.Destinatario= [decoder decodeObjectForKey:@"DestiMensaje"];

    }
    
    return self;
}









@end
