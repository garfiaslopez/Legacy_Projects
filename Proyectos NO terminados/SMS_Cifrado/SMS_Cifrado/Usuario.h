//
//  Usuario.h
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property(copy) NSString* Nombre;
@property(copy) NSString* Email;
@property(copy) NSString* PasswordServer;
@property(copy) NSString* PasswordApp;
@property()BOOL isStartProtected;
@property()BOOL isValidated;
@property()int AccessTrys;
@property(copy)NSMutableArray *Mensajes;
@property(copy)NSMutableArray *Contactos;


@end
