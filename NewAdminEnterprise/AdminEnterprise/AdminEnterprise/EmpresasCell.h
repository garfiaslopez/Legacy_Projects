//
//  EmpresasCell.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmpresasCell : UICollectionViewCell


@property(nonatomic,retain) IBOutlet UILabel *NombreEmpresa;
@property(nonatomic,retain) IBOutlet UILabel *TotalVentas;
@property(nonatomic,retain) IBOutlet UILabel *TotalGastos;
@property(nonatomic,retain) IBOutlet UILabel *TotalEmpleados;

@property(nonatomic,retain) IBOutlet UIImageView *Logotipo;
@property(nonatomic,retain) IBOutlet UIView *View;



@end
