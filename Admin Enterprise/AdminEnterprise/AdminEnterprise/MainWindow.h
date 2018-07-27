//
//  MainWindow.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Servicios;
@class Reporte;
@class Historial;
@class Usuarios;
@class Configuraciones;

@interface MainWindow : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{

    Servicios*ServicioView;
    Reporte *ReporteView;
    Historial *HistorialView;
    Usuarios *UsuariosView;
    Configuraciones *ConfigView;
}
@property (nonatomic) NSInteger IndexEnterprise;

@property (weak, nonatomic) IBOutlet UINavigationItem *TitleBarNav;
@property (weak, nonatomic) IBOutlet UILabel *FechaLabel;
@property (weak, nonatomic) IBOutlet UILabel *HoraInicioLabel;
@property (weak, nonatomic) IBOutlet UILabel *UsuarioLabel;
@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImage;



- (IBAction)CerrarSesion:(id)sender;
- (IBAction)Configuraciones:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *VentaButton;
@property (weak, nonatomic) IBOutlet UIButton *gastoButton;
@property (weak, nonatomic) IBOutlet UIButton *ServiciosButton;
@property (weak, nonatomic) IBOutlet UIButton *ReporteButton;
@property (weak, nonatomic) IBOutlet UIButton *HistorialButton;
@property (weak, nonatomic) IBOutlet UIButton *UsuariosButton;

- (IBAction)VentaAction:(id)sender;
- (IBAction)GastoAction:(id)sender;
- (IBAction)ServiciosAction:(id)sender;
- (IBAction)ReporteAction:(id)sender;
- (IBAction)HistorialAction:(id)sender;
- (IBAction)UsuariosAction:(id)sender;



//VENTAVIEW:
@property (weak, nonatomic) IBOutlet UIView *VentaView;
@property (weak, nonatomic) IBOutlet UIImageView *VentaBackImage;
@property (weak, nonatomic) IBOutlet UICollectionView *VentaCollectionView;
@property (weak, nonatomic) IBOutlet UITableView *VentaTableView;
@property (weak, nonatomic) IBOutlet UILabel *VentaTotalLabel;

- (IBAction)CobrarVenta:(id)sender;
- (IBAction)CerrarCobrarVenta:(id)sender;


//GastoVIEW:

@property (weak, nonatomic) IBOutlet UIView *GastoView;
@property (weak, nonatomic) IBOutlet UITextField *ConceptoGastoTextField;
@property (weak, nonatomic) IBOutlet UITextField *PrecioGastoTextField;
@property (weak, nonatomic) IBOutlet UILabel *TotalGastosLabel;
@property (weak, nonatomic) IBOutlet UITableView *GastosTableView;
- (IBAction)GuardarGasto:(id)sender;
- (IBAction)Borrar:(id)sender;
- (IBAction)CerrarGasto:(id)sender;




@end
