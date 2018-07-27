//
//  Reporte.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Reporte : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UILabel *UsuarioLabel;


@property (nonatomic) NSInteger IndexEnterprise;
@property (weak, nonatomic) IBOutlet UILabel *HoraEntradaLabel;
@property (weak, nonatomic) IBOutlet UILabel *HoraSalidaLabel;
@property (weak, nonatomic) IBOutlet UILabel *TiempoLaboradoLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalVentasLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalGastosLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiferenciaLabel;

@property (weak, nonatomic) IBOutlet UITableView *VentasTableView;
@property (weak, nonatomic) IBOutlet UITableView *GastosTableView;
@property (weak, nonatomic) IBOutlet UIImageView *DescripVentaImage;

@property (weak, nonatomic) IBOutlet UIScrollView *VentaScrollView;

- (IBAction)Atras:(id)sender;

@end
