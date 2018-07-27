//
//  Clientes.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Clientes : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * telefono;
@property (nonatomic, retain) NSString * direccion;
@property (nonatomic, retain) NSString * correo;
@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * empresa;

@end
