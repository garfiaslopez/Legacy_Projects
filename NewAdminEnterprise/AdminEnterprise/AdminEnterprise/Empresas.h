//
//  Empresas.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Empresas : NSManagedObject

@property (nonatomic, retain) NSString * direccion;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) NSString * logo;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * telefono;

@end
