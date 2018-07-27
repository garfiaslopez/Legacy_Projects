//
//  Configuracion.m
//  CarWash_1.0
//
//  Created by Jose De Jesus Garfias Lopez on 23/03/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Configuracion.h"

@implementation Configuracion


@synthesize DireccionIP;
@synthesize PhpName;




-(id)init   //Inicializacion de campos al ser creada la estructura.
{
    self = [super init];
    
    if (self) {
        

        DireccionIP = @"0.0.0.0";
        PhpName = @"Index.php";
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    //Encode properties, other class variables, etc
    
    if (self) {
        
        [encoder encodeObject:self.DireccionIP forKey:@"DireccionIP"];
        [encoder encodeObject:self.PhpName forKey:@"PhpName"];
        
    }
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        //decode properties, other class vars

        self.DireccionIP = [decoder decodeObjectForKey:@"DireccionIP"];
        self.PhpName = [decoder decodeObjectForKey:@"PhpName"];

        
    }
    return self;
}




@end
