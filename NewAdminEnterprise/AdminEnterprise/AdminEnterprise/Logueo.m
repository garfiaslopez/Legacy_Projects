//
//  Logueo.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Logueo.h"

#import "EmpresasVC.h"

#import "Configuracion.h"

@interface Logueo (){
    
    Configuracion *Config;
    
}

@end

@implementation Logueo
@synthesize User_TextField;
@synthesize Pass_TextField;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    Config = [[Configuracion alloc] init];
    


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


- (IBAction)Aceptar:(id)sender {
    
    
    // Create your request string with parameter name as defined in PHP file
    NSString *myRequestString = [NSString stringWithFormat:
                                 @"UserName=%@&Password=%@",
                                 User_TextField.text,
                                 Pass_TextField.text
                                 ];
    
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://adminenterprise.com/php/iOS_Api/LoginUser.php"]];
    // set Request Type
    [request setHTTPMethod: @"POST"];
    // Set content-type
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    // Set Request Body
    [request setHTTPBody: myRequestData];
    // Now send a request and get Response
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    // Log Response
    NSString *response = [[NSString alloc] initWithBytes:[returnData bytes] length:[returnData length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",response);
    
    NSDictionary *jsonData = [[NSDictionary alloc]init];
    
    if (returnData !=nil) {
        
        jsonData = [NSJSONSerialization JSONObjectWithData:returnData
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
        
        bool success = [jsonData[@"Success"] boolValue];
        
        if(success){
            
            NSArray *records = jsonData[@"Records"];
            

            //GUARDAR EN CONFIGURACION EL LOGUEO DEL USUARIO:
            
            Config.isLoged = TRUE;
            Config.Usuario = User_TextField.text;
            Config.Password = Pass_TextField.text;
            Config.Nombre = records[0];
            Config.Ciudad = records[1];
            
            [self SaveConfig:Config key:@"MainConfig"];
            
            
            
            User_TextField.text = @"";
            Pass_TextField.text = @"";
            
            
            //Instanciate the empresasview:?
            
            UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
            
            EmpresasView = [Main instantiateViewControllerWithIdentifier:@"Empresas"];
            EmpresasView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            
            
            //PASAR DATA ATRAVES DE LAS VISTAS
            //EmpresasView.IndexEnterprise = IndexEnterprise;
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Bienvenido" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
            [self presentViewController:EmpresasView animated:YES completion:NULL];
           
            
        }else{
            
            NSString *error = jsonData[@"message"];
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error al iniciar sesion." message:error delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
        }
        
    }else{

        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error al iniciar sesion." message:@"Parece no haber conexion a internet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
        
    }


    
}



- (IBAction)Back:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:Nil];

}


- (void)SaveConfig:(Configuracion *)object key:(NSString *)key {
    
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}



@end
