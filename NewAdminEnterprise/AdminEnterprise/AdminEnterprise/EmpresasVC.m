//
//  EmpresasVC.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "EmpresasVC.h"
#import "AppDelegate.h"

#import "Dashboard.h"
#import "ConfiguracionVC.h"
//models:
#import "Configuracion.h"
#import "EmpresasCell.h"
#import "Empresas.h"
#import "Empleados.h"


@interface EmpresasVC (){

    Configuracion *Config;
    NSMutableArray *EmpresasArray;
    //EMPRESAS ARRAY IS AN ARRAY OF ALL EMPRESAS OF DB:

    NSMutableArray *EmpleadosArray;
    
    NSManagedObjectContext *context;

    NSString *EmpresaToSesion;
}

@end

@implementation EmpresasVC

@synthesize EmpresasCollection;
@synthesize NombreLabel;
@synthesize FechaLabel;
@synthesize LoginView;
@synthesize Usuario_Textfield;
@synthesize Password_TextField;
@synthesize LoginEmpleado;
@synthesize Loginlabel;


- (void)viewDidLoad {
    [super viewDidLoad];

    //Inicializa variables:
    Config = [[Configuracion alloc] init];
    EmpresasArray = [[NSMutableArray alloc]init];
    EmpleadosArray = [[NSMutableArray alloc]init];
    EmpresaToSesion = [[NSString alloc] init];
    
    //inicializas context
    context = [[NSManagedObjectContext alloc]init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];


}

-(void)viewDidAppear:(BOOL)animated{
    
    [self LoadData];
    
}

-(void)LoadData{
    
    Config = [self LoadConfig:@"MainConfig"];
    
    
    NombreLabel.text = Config.Nombre;
    FechaLabel.text =  [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];
    
    
    [self ReloadCloud];
    
    //insert into empresas array the data from DB:
    [EmpresasArray removeAllObjects];
    EmpresasArray = [[NSMutableArray alloc]init];
    
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empresas"
                                               inManagedObjectContext:context];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"diahistorial == %d and meshistorial == %d and yearhistorial == %d and empleado == %@",day,month,year,[UsuarioSesion Nombre]];
    
    [fetchRequest setEntity:entity];
    //[fetchRequest setPredicate:predicate];
    
    NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Empresas *enterprise in matchingData)
    {
        [EmpresasArray addObject:enterprise];
    }
    
    NSLog(@"EMPRESAS RECARGADAS: %lu ",(unsigned long)EmpresasArray.count);

    NSLog(@"EMPRESA1 %@",[[EmpresasArray objectAtIndex:0] nombre]);
    
    [EmpresasCollection reloadData];
}


-(bool)ReloadCloud{
    
    //SEND THE REQUEST TO THE SERVER AND GET ALL TE ENTERPRISES TO PUT ON DB:
    
    
    // Create your request string with parameter name as defined in PHP file
    NSString *myRequestString = [NSString stringWithFormat:
                                 @"Usuario=%@",
                                 Config.Usuario
                                 ];
    
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://adminenterprise.com/php/iOS_Api/SearchEmpresas.php"]];
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

    
    //JSON PARSER:
    NSDictionary *jsonData = [[NSDictionary alloc]init];
    
    if (returnData !=nil) {
        
        jsonData = [NSJSONSerialization JSONObjectWithData:returnData
                                                   options:NSJSONReadingMutableContainers
                                                     error:nil];
        
        bool success = [jsonData[@"Success"] boolValue];
        int querys=0;
        if(success){
            
            NSArray *records = jsonData[@"Records"];
            
            //CLEAN DE DATABASE OF EMPRESAS ON IOS:
            
            
            NSError *error;
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empresas"
                                                      inManagedObjectContext:context];
            
            //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"diahistorial == %d and meshistorial == %d and yearhistorial == %d and empleado == %@",day,month,year,[UsuarioSesion Nombre]];
            
            [fetchRequest setEntity:entity];
            //[fetchRequest setPredicate:predicate];
            
            NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
            
            for (Empresas *enterprise in matchingData)
            {
                [context deleteObject:enterprise];
                NSLog(@"DELETED:");
            }

            
            
            for (int i=0; i<records.count;i++ ) {
                
                
                NSError *error;
                Empresas *NewEmpresa = [NSEntityDescription insertNewObjectForEntityForName:@"Empresas" inManagedObjectContext:context];
                
                [NewEmpresa setNombre:records[i][0]];
                [NewEmpresa setTelefono:records[i][1]];
                [NewEmpresa setDireccion:records[i][2]];
                [NewEmpresa setLogo:records[i][3]];

                if (![context save:&error]) {
                    //Salio mal la query?
                    NSLog(@"SALIO MAL?=");
                    
                    
                }else{
                    NSLog(@"TODO BIEN? ");
                    querys++;
                }
                
                
                
                
            }
            
            if (querys == records.count) {
                return 1;
            }else{
                return 0;
            }
            
        }else{
            
            NSString *error = jsonData[@"message"];
            NSLog(@"error = %@", error);
            
        }
        
    }else{
        
        return 0;
    }

    
    return 0;
    
}


//DATAMODEL IS THE MODEL OF DATABASE :O

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return EmpresasArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    EmpresasCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Celda" forIndexPath:indexPath];
    
    cell.NombreEmpresa.text = [[EmpresasArray objectAtIndex:indexPath.row] nombre];
    
    UIImage *ImageLogo = [UIImage imageNamed:[[EmpresasArray objectAtIndex:indexPath.row] logo]];
    
    [cell.Logotipo setImage:ImageLogo];
    
    //cell.ImagenFondoCell.image = [UIImage imageNamed:@""];
    
    cell.TotalVentas.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentasEmpresa:[[EmpresasArray objectAtIndex:indexPath.row] nombre]]];
    cell.TotalGastos.text = [NSString stringWithFormat:@"$%.2f",[self TotalGastosEmpresa:[[EmpresasArray objectAtIndex:indexPath.row] nombre]]];
    

    cell.TotalEmpleados.text = [NSString stringWithFormat:@"%i",[self TotalEmpleadosEmpresa:[[EmpresasArray objectAtIndex:indexPath.row]nombre]]];
    
    return cell;
    
}
/*
 
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return nil;
 }
 */


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Loginlabel.text = @"Login De Empleado";
    
    //CHECK THE ISLOGIN TRIGGER AND MAKE THE SESSION TO WORKOUT:

    [self LoadEmpleados:[[EmpresasArray objectAtIndex:indexPath.row] nombre]];
    
    
    if (EmpleadosArray.count != 0) {
        //si hay empleados
        
        //lanza la vista del login:
        EmpresaToSesion = [[EmpresasArray objectAtIndex:indexPath.row] nombre];
        
        [UIView animateWithDuration:0.5 animations:^(){
            LoginView.frame = CGRectMake(216, 64, 600, 500);
        }];
        
        
    }else{
        
        UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
        
        DashboardView = [Main instantiateViewControllerWithIdentifier:@"Dashboard"];
        DashboardView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        DashboardView.EmpleadoSesion = [Config Usuario];
        DashboardView.FechaSesion = [NSDate date];
        DashboardView.EmpresaSesion = [[EmpresasArray objectAtIndex:indexPath.row] nombre];
        [self presentViewController:DashboardView animated:YES completion:NULL];
    
    }
    

    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}




#pragma mark Collection view layout things

// Layout: Set cell size
/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
 
 CGSize mElementSize = CGSizeMake(104, 104);
 return mElementSize;
 }*/

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 15.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 45.0;
}


-(float)TotalVentasEmpresa:(NSString *)EmpresaName{
    
    
    return 0.0;
};




-(float)TotalGastosEmpresa:(NSString *)EmpresaName{
    
    
    return 0.0;

};


-(int)TotalEmpleadosEmpresa:(NSString *)EmpresaName{
    
    //Total empleados:
    
    int empleados = 0;
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empleados"
                                              inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empresa == %@",EmpresaName];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
    
    for (int i=0; i<matchingData.count;i++)
    {
        empleados++;
    }
    
    return empleados;

};



-(void)LoadEmpleados:(NSString *)EmpresaName{
    
    
    NSLog(@"ENTRO A BUSCAR EMPLEADOS");
    
    [EmpleadosArray removeAllObjects];
    EmpleadosArray = [[NSMutableArray alloc]init];
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empleados"
                                              inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empresa == %@",EmpresaName];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Empleados *empleado in matchingData)
    {
        [EmpleadosArray addObject:empleado];
    }
    
    NSLog(@"SALIO DE BUSCAR");
}



- (IBAction)CerrarSesion:(id)sender {
    
    //SET ISLOGGEDOFF:
    

    Config.isLoged = false;
    Config.Usuario = @"";
    Config.Password = @"";
    
    
    [self SaveConfig:Config key:@"MainConfig"];
    
    
    [self dismissViewControllerAnimated:YES completion:Nil];

}

- (IBAction)LoginEmpleado:(id)sender {
    
    
    if ([Loginlabel.text isEqual:@"Login De Usuario Principal"]) {
        
        //Loguear vs Administrador: & show ConfigurationView...
        
        
        if ([[Config Usuario] isEqual:Usuario_Textfield.text] && [[Config Password]isEqual:Password_TextField.text] ) {
            
            
            //si encontro al usuario el cual es indice i:
            UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
            
            ConfiguracionView = [Main instantiateViewControllerWithIdentifier:@"Configuracion"];
            ConfiguracionView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

            
            [self presentViewController:ConfiguracionView animated:YES completion:NULL];
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    //Checar si el empleado concuerda con alguno en el empleadoarray:
    
    for (int i =0; i<EmpleadosArray.count;i++) {
        
        //Si concuerda, guardar session con ese empleado y lanzar empresasvc,
        if ([[[EmpleadosArray objectAtIndex:i] usuario] isEqual:Usuario_Textfield.text] && [[[EmpleadosArray objectAtIndex:i] password]isEqual:Password_TextField.text] ) {
            
            
            //si encontro al usuario el cual es indice i:
            UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
            
            DashboardView = [Main instantiateViewControllerWithIdentifier:@"Dashboard"];
            DashboardView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            DashboardView.EmpleadoSesion = [[EmpleadosArray objectAtIndex:i] usuario];
            DashboardView.FechaSesion = [NSDate date];
            DashboardView.EmpresaSesion = EmpresaToSesion;

            [self presentViewController:DashboardView animated:YES completion:NULL];
            
            
            
        }
        
        
    }
    
    Usuario_Textfield.text = @"";
    Password_TextField.text = @"";
    
    [UIView animateWithDuration:0.5 animations:^(){
        LoginView.frame = CGRectMake(216, 770, 600, 500);
    }];
    

    
}

- (IBAction)CancelLogin:(id)sender {
    
    Usuario_Textfield.text = @"";
    Password_TextField.text = @"";
    
    [UIView animateWithDuration:0.5 animations:^(){
        LoginView.frame = CGRectMake(216, 770, 600, 500);
    }];
    
    
}



- (IBAction)Configuraciones:(id)sender {
    
    Loginlabel.text = @"Login De Usuario Principal";

    [UIView animateWithDuration:0.5 animations:^(){
        LoginView.frame = CGRectMake(216, 64, 600, 500);
    }];
    
}

- (IBAction)CloudUpdate:(id)sender {
    
    [self LoadData];
    
}


- (Configuracion *)LoadConfig:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Configuracion *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

- (void)SaveConfig:(Configuracion *)object key:(NSString *)key {
    
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}


@end
