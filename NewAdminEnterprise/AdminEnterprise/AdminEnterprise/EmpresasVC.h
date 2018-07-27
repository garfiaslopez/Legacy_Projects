//
//  EmpresasVC.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dashboard;
@class ConfiguracionVC;

@interface EmpresasVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{

    Dashboard *DashboardView;
    ConfiguracionVC *ConfiguracionView;
}

@property (weak, nonatomic) IBOutlet UICollectionView *EmpresasCollection;
@property (weak, nonatomic) IBOutlet UILabel *NombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *FechaLabel;
@property (weak, nonatomic) IBOutlet UIView *LoginView;
@property (weak, nonatomic) IBOutlet UITextField *Usuario_Textfield;
@property (weak, nonatomic) IBOutlet UITextField *Password_TextField;
@property (weak, nonatomic) IBOutlet UIButton *LoginEmpleado;
@property (weak, nonatomic) IBOutlet UILabel *Loginlabel;

- (IBAction)Configuraciones:(id)sender;
- (IBAction)CloudUpdate:(id)sender;
- (IBAction)CerrarSesion:(id)sender;
- (IBAction)LoginEmpleado:(id)sender;
- (IBAction)CancelLogin:(id)sender;


@end
