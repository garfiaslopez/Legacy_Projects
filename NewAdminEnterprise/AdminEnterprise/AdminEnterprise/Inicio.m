//
//  Inicio.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Inicio.h"

#import "Configuracion.h"
#import "EmpresasVC.h"

@interface Inicio (){

    Configuracion *Config;
}

@end

@implementation Inicio

-(void)viewDidAppear:(BOOL)animated{

    Config = [self LoadConfig:@"MainConfig"];
    
    NSLog(@"ISLOGEd %hhd:",Config.isLoged);
    NSLog(@"USUARIO: %@ ",Config.Usuario);
    
    if (Config.isLoged) {
        
        UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
        
        EmpresasView = [Main instantiateViewControllerWithIdentifier:@"Empresas"];
        EmpresasView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        //PASAR DATA ATRAVES DE LAS VISTAS
        //EmpresasView.IndexEnterprise = IndexEnterprise;
        
        [self presentViewController:EmpresasView animated:YES completion:NULL];
        
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (Configuracion *)LoadConfig:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Configuracion *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}


@end
