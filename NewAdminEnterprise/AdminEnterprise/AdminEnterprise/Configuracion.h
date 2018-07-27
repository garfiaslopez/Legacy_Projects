//
//  Configuracion.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuracion : NSObject

//TRIGGERS FOR THE VIEWS:
@property() BOOL isLoged;
@property() BOOL isCloud;


//USER REGISTER ON SERVER DB
@property(copy) NSString *Usuario;
@property(copy) NSString *Password;
@property(copy) NSString *Ciudad;
@property(copy) NSString *Nombre;



@end
