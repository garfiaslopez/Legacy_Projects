//
//  Dashboard.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ProductosVC;
@class ReporteVC;
@class HistorialVC;
@class NotasVC;
@class ClientesVC;
@class PendientesVC;


@interface Dashboard : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    ProductosVC *ProductosView;
    ReporteVC * ReporteView;
    HistorialVC *HistorialView;
    NotasVC *NotasView;
    ClientesVC *ClientesView;
    PendientesVC *PendientesView;

}

@property (nonatomic) NSString *EmpleadoSesion;
@property (nonatomic) NSDate *FechaSesion;
@property (nonatomic) NSString *EmpresaSesion;


@property (weak, nonatomic) IBOutlet UIImageView *LogoEmpresa;
@property (weak, nonatomic) IBOutlet UILabel *UsuarioLabel;
@property (weak, nonatomic) IBOutlet UILabel *NumVentasLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalVentasLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalGastosLabel;
@property (weak, nonatomic) IBOutlet UILabel *NumGastosLabel;
@property (weak, nonatomic) IBOutlet UILabel *FechaLabel;
@property (weak, nonatomic) IBOutlet UILabel *FechaInicioLabel;
@property (weak, nonatomic) IBOutlet UILabel *DiferenciaLabel;
@property (weak, nonatomic) IBOutlet UITableView *PendientesTable;
@property (weak, nonatomic) IBOutlet UINavigationItem *TitleBarDashboard;



- (IBAction)VentaAction:(id)sender;
- (IBAction)GastoAction:(id)sender;
- (IBAction)ProductosAction:(id)sender;
- (IBAction)ReporteAction:(id)sender;
- (IBAction)HistorialAction:(id)sender;
- (IBAction)NotasAction:(id)sender;
- (IBAction)ClientesAction:(id)sender;
- (IBAction)PendientesAction:(id)sender;




- (IBAction)Atras:(id)sender;

@end
