//
//  Pendientes.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pendientes : NSManagedObject

@property (nonatomic, retain) NSString * descripcion;
@property (nonatomic, retain) NSString * empleado;
@property (nonatomic, retain) NSString * empresa;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSString * prioridad;
@property (nonatomic, retain) NSString * titulo;

@end
