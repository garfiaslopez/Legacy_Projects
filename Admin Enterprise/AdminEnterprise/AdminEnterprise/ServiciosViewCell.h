//
//  ServiciosViewCell.h
//  CarWash 2.0
//
//  Created by Jose De Jesus Garfias Lopez on 16/04/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServiciosViewCell : UICollectionViewCell

@property(nonatomic, retain) IBOutlet UILabel *NombreServ;
@property(nonatomic, retain) IBOutlet UILabel *PrecioServ;
@property(nonatomic, retain) IBOutlet UILabel *StockServ;
@property(nonatomic, retain) IBOutlet UIImageView *LogoServ;
@property(nonatomic, retain) IBOutlet UIImageView *BackImage;
@property(nonatomic, retain) IBOutlet UIView *Background;
@property (weak, nonatomic) IBOutlet UILabel *CantVentaLabel;
@property (weak, nonatomic) IBOutlet UIStepper *Stepper;

@property (nonatomic)int CantidadSelected;
@property (nonatomic)int CantidadStock;


- (IBAction)ChangeValueSteppe:(UIStepper *)sender;


@end
