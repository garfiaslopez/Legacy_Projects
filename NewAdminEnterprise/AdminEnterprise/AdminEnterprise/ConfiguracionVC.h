//
//  ConfiguracionVC.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGSwipeTableCell.h"
#import "ELCImagePickerController.h"



@interface ConfiguracionVC : UIViewController<UITableViewDelegate,UITableViewDataSource,MGSwipeTableCellDelegate,ELCImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UITableView *EmpresasTable;
@property (weak, nonatomic) IBOutlet UITableView *EmpleadosTable;
@property (weak, nonatomic) IBOutlet UILabel *EditarLabel;
@property (weak, nonatomic) IBOutlet UIImageView *LogoImageView;
@property (weak, nonatomic) IBOutlet UITextField *NombreEmpresa_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Telefono_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Direccion_TextField;
@property (weak, nonatomic) IBOutlet UIButton *GuardarEmpresa;
@property (weak, nonatomic) IBOutlet UITextField *Nombre_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Usuario_TextField;
@property (weak, nonatomic) IBOutlet UITextField *Password_TextField;
@property (weak, nonatomic) IBOutlet UISwitch *EsAdmin_Switch;
@property (weak, nonatomic) IBOutlet UIButton *GuardarEmpleado;
@property (weak, nonatomic) IBOutlet UILabel *EmpleadosLabel;
@property (weak, nonatomic) IBOutlet UIButton *AgregarButton;


@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) ELCImagePickerController *elcPicker;


- (IBAction)Atras:(id)sender;
- (IBAction)AgregarLogo:(id)sender;
- (IBAction)GuardarEmpresa:(id)sender;
- (IBAction)GuardarEmpleado:(id)sender;
- (IBAction)CancelarEmpresa:(id)sender;
- (IBAction)CancelarEmpleado:(id)sender;
- (IBAction)Ayuda:(id)sender;

@end
