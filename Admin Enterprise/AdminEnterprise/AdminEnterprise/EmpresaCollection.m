//
//  TicketOfCollection.m
//  CollectionView
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "EmpresaCollection.h"

@implementation EmpresaCollection

@synthesize ImagenFondoCell;
@synthesize VistaCell;
@synthesize NombreCell;
@synthesize VentasCell;
@synthesize GastosCell;
@synthesize EmpleadosCell;
@synthesize LogotipoCell;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

    }

    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
