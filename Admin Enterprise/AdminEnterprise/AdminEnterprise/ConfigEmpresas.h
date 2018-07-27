//
//  ConfigEmpresas.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Empresa.h"
#import "Empleado.h"
#import "Servicio.h"
#import "Venta.h"
#import "Gasto.h"


@interface ConfigEmpresas : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *NombreEmpresaTextField;

@property (weak, nonatomic) IBOutlet UILabel *NombreEmpresaLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalVentasLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalGastosLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiferenciaLabel;


@property (weak, nonatomic) IBOutlet UITableView *EmpresasTableView;
@property (weak, nonatomic) IBOutlet UITableView *EmpleadosTableView;
@property (weak, nonatomic) IBOutlet UITableView *VentasTableView;
@property (weak, nonatomic) IBOutlet UITableView *GastosTableView;

@property (weak, nonatomic) IBOutlet UIView *LoginView;
@property (weak, nonatomic) IBOutlet UITextField *UserLoginTextField;
@property (weak, nonatomic) IBOutlet UITextField *ContraLoginTExtField;


- (IBAction)Guardar:(id)sender;
- (IBAction)Borrar:(id)sender;
- (IBAction)Atras:(id)sender;
- (IBAction)LoginAdmin:(id)sender;


@end
