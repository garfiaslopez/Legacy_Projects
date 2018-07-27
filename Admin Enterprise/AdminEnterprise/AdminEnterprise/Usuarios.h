//
//  Usuarios.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Usuarios : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *MainScroller;
@property (weak, nonatomic) IBOutlet UITextField *NombreTextField;
@property (weak, nonatomic) IBOutlet UITextField *PassTextField;
@property (weak, nonatomic) IBOutlet UITextField *PassConfirmTextField;
@property (weak, nonatomic) IBOutlet UISwitch *IsAdminSwitch;

@property (weak, nonatomic) IBOutlet UITableView *UsuariosTableView;
@property (weak, nonatomic) IBOutlet UITableView *VentasTableView;
@property (weak, nonatomic) IBOutlet UILabel *VentasLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalVentasLabel;

@property (weak, nonatomic) IBOutlet UILabel *NombreUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *PassUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *FechaUserlabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalVentasUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalGastosUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiferenciaLabel;

@property (weak, nonatomic) IBOutlet UILabel *IsAdminlabel;
@property (weak, nonatomic) IBOutlet UIImageView *IsAdminImageView;

@property (weak, nonatomic) IBOutlet UILabel *UltimoIngresoLabel;
@property (weak, nonatomic) IBOutlet UILabel *UltimoCierreLabel;

@property (nonatomic) NSInteger IndexEnterprise;



- (IBAction)Atras:(id)sender;
- (IBAction)Guardar:(id)sender;
- (IBAction)Borrar:(id)sender;


@end
