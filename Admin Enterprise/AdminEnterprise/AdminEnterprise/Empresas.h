//
//  Empresas.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ConfigInicial;
@class Login;
@class ConfigEmpresas;

@interface Empresas : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{

    ConfigInicial *FirstView;
    Login *LoginView;
    ConfigEmpresas *ConfigEmpresasView;
}


@property (weak, nonatomic) IBOutlet UICollectionView *EmpresasCollectionView;



- (IBAction)Configuracion:(id)sender;


@end
