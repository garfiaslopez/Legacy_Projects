//
//  TicketOfCollection.h
//  CollectionView
//
//  Created by Jose De Jesus Garfias Lopez on 25/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmpresaCollection: UICollectionViewCell

@property(nonatomic, retain) IBOutlet UILabel *NombreCell;

@property(nonatomic, retain) IBOutlet UILabel *VentasCell;
@property(nonatomic, retain) IBOutlet UILabel *GastosCell;
@property(nonatomic, retain) IBOutlet UILabel *EmpleadosCell;

@property(nonatomic, retain) IBOutlet UIView *VistaCell;
@property(nonatomic, retain) IBOutlet UIImageView *ImagenFondoCell;
@property(nonatomic, retain) IBOutlet UIImageView *LogotipoCell;



//IMAGEVIEW FOR LOGO:


@end
