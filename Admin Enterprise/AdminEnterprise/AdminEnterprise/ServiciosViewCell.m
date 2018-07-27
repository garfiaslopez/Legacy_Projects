//
//  ServiciosViewCell.m
//  CarWash 2.0
//
//  Created by Jose De Jesus Garfias Lopez on 16/04/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "ServiciosViewCell.h"

@implementation ServiciosViewCell
@synthesize NombreServ;
@synthesize PrecioServ;
@synthesize StockServ;
@synthesize LogoServ;
@synthesize BackImage;
@synthesize Background;
@synthesize CantVentaLabel;
@synthesize Stepper;
@synthesize CantidadSelected;
@synthesize CantidadStock;

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

- (IBAction)ChangeValueSteppe:(UIStepper *)sender
{
    NSLog(@"Entro a cambiar el valor:");
    
    CantidadSelected = (int)[sender value];
    [CantVentaLabel setText:[NSString stringWithFormat:@"%d", CantidadSelected]];
    
    StockServ.text = [NSString stringWithFormat:@"%d",CantidadStock-CantidadSelected];
}
@end
