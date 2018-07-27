//
//  Empleados.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Empleados : NSManagedObject

@property (nonatomic, retain) NSString * empresa;
@property (nonatomic, retain) NSNumber * isAdmin;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSDate * ultimasesion;
@property (nonatomic, retain) NSString * usuario;

@end
