//
//  ConfiguracionVC.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "ConfiguracionVC.h"

//modelosDB
#import "Empresas.h"
#import "Empleados.h"
#import "AppDelegate.h"
#import "Configuracion.h"

//SwipeTable
#import "MGSwipeTableCell.h"
#import "MGSwipeButton.h"
//picker:

#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import "ELCAssetTablePicker.h"


@interface ConfiguracionVC (){

    NSMutableArray *EmpresasArray;
    NSMutableArray *EmpleadosArray;

    NSManagedObjectContext *context;
    
    UIImage *ImagePicked;
    
    NSString *EmpresaToSave;
    Configuracion *Config;
}

@property (nonatomic, strong) ALAssetsLibrary *specialLibrary;


@end

@implementation ConfiguracionVC

@synthesize ScrollView;
@synthesize EmpresasTable;
@synthesize EmpleadosLabel;
@synthesize EditarLabel;
@synthesize LogoImageView;
@synthesize NombreEmpresa_TextField;
@synthesize Telefono_TextField;
@synthesize Direccion_TextField;
@synthesize GuardarEmpresa;
@synthesize Nombre_TextField;
@synthesize Usuario_TextField;
@synthesize Password_TextField;
@synthesize EsAdmin_Switch;
@synthesize GuardarEmpleado;
@synthesize EmpleadosTable;
@synthesize AgregarButton;


//Picker:
@synthesize imagePickerController;
@synthesize elcPicker;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Inicializa variables:
    EmpresasArray = [[NSMutableArray alloc]init];
    EmpleadosArray = [[NSMutableArray alloc]init];
    Config = [[Configuracion alloc]init];
    
    
    EmpresaToSave = [[NSString alloc] init];
    
    //inicializas context
    context = [[NSManagedObjectContext alloc]init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    
    EsAdmin_Switch.on = false;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
}

-(void)viewDidAppear:(BOOL)animated{

    
    Config = [self LoadConfig:@"MainConfig"];
    [self LoadData];
}

- (void)keyboardDidShow:(NSNotification *)notification {
    
    self.ScrollView.contentSize=CGSizeMake(1024,980);
    
    if (NombreEmpresa_TextField.editing || Telefono_TextField.editing ||Direccion_TextField.editing ||
        Nombre_TextField.editing || Usuario_TextField.editing || Password_TextField.editing) {
        CGPoint bottomOffset = CGPointMake(0, self.ScrollView.contentSize.height - self.ScrollView.bounds.size.height);
        [self.ScrollView setContentOffset:bottomOffset animated:YES];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (void)keyboardDidHide:(NSNotification *)notification {
    
    self.ScrollView.contentSize=CGSizeMake(1024,704);
    
    
    CGPoint bottomOffset = CGPointMake(0, self.ScrollView.contentSize.height - self.ScrollView.bounds.size.height);
    [self.ScrollView setContentOffset:bottomOffset animated:YES];
    
    for (UIGestureRecognizer *recognizer in self.view.gestureRecognizers) {
        [self.view removeGestureRecognizer:recognizer];
    }

}

-(void)dismissKeyboard
{
    [NombreEmpresa_TextField resignFirstResponder];
    [Direccion_TextField resignFirstResponder];
    [Telefono_TextField resignFirstResponder];
    [Nombre_TextField resignFirstResponder];
    [Usuario_TextField resignFirstResponder];
    [Password_TextField resignFirstResponder];
}

-(void)LoadData{
    
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
    
    [EmpresasTable reloadData];
}

-(void)LoadEmpleados:(NSString *)EmpresaName{
    
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
    
    [EmpleadosTable reloadData];
    
}


#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 0) {
        
        return EmpresasArray.count;

    }else{
        
        return EmpleadosArray.count;
        
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseIdentifier = @"programmaticCell";
    MGSwipeTableCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
    
    if (tableView.tag == 0) {
        
        cell.textLabel.text = [[EmpresasArray objectAtIndex:indexPath.row] nombre];
        //cell.detailTextLabel.text = @"Detail text";
        //cell.delegate = self; //optional
        
        
        //configure left buttons
        //cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"check.png"] backgroundColor:[UIColor greenColor]],
                           //  [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fav.png"] backgroundColor:[UIColor blueColor]]];
        //cell.leftSwipeSettings.transition = MGSwipeTransition3D;
        
        //configure right buttons
        
        
        MGSwipeButton * DeleteButton = [MGSwipeButton buttonWithTitle:@"Eliminar" icon:nil backgroundColor:[UIColor redColor] padding:15 callback:^BOOL(MGSwipeTableCell * sender){
            [self BorrarEmpresa:indexPath];
            return YES;
        }];
        
        MGSwipeButton * EditButton = [MGSwipeButton buttonWithTitle:@"Editar" icon:nil backgroundColor:[UIColor lightGrayColor] padding:15 callback:^BOOL(MGSwipeTableCell * sender){
            [self EditarEmpresa:indexPath];
            return YES;
        }];
        
        
        
        cell.rightButtons = @[DeleteButton,EditButton];
        
        cell.rightSwipeSettings.transition = MGSwipeTransitionBorder;
        
    }else{
        
        cell.textLabel.text = [[EmpleadosArray objectAtIndex:indexPath.row] nombre];
        cell.detailTextLabel.text = [[EmpleadosArray objectAtIndex:indexPath.row] usuario];
        //cell.delegate = self; //optional
        
        MGSwipeButton * DeleteButton = [MGSwipeButton buttonWithTitle:@"Eliminar" icon:nil backgroundColor:[UIColor redColor] padding:15 callback:^BOOL(MGSwipeTableCell * sender){
            [self BorrarEmpleado:indexPath];
            return YES;
        }];
        
        cell.rightButtons = @[DeleteButton];
        cell.rightSwipeSettings.transition = MGSwipeTransitionBorder;
        
    
    }
    
    
    return cell;
}



-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 0) {
        
        EmpresaToSave = [NSString stringWithFormat:@"%@", [[EmpresasArray objectAtIndex:indexPath.row]  nombre]];

        [self LoadEmpleados:[[EmpresasArray objectAtIndex:indexPath.row]  nombre]];
        EmpleadosLabel.text = [NSString stringWithFormat:@"Empleados de %@",[[EmpresasArray objectAtIndex:indexPath.row]  nombre]];
        
    }
    
    
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion
{
    NSLog(@"Delegate: button tapped, %@ position, index %d, from Expansion: %@",
          direction == MGSwipeDirectionLeftToRight ? @"left" : @"right", (int)index, fromExpansion ? @"YES" : @"NO");
    
    if (direction == MGSwipeDirectionRightToLeft && index == 0) {
        //delete button
        
        NSLog(@"DELETE BUTTON PULSED");
      //  NSIndexPath * path = [EmpresasTable indexPathForCell:cell];
      //  [tests removeObjectAtIndex:path.row];
            //        [EmpresasTable deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
    }
    
    if (direction == MGSwipeDirectionRightToLeft && index == 1) {
        NSLog(@"EDIT BUTTON PULSED");

    }
    return YES;
}




- (IBAction)Atras:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];

    
}






- (IBAction)GuardarEmpresa:(id)sender {
    
    
    if ((![NombreEmpresa_TextField.text isEqual:@""]) && (![Telefono_TextField.text isEqual:@""]) && (![Direccion_TextField.text isEqual:@""]) ) {
        
        //save filepath on DB of the newobject: And the image in that filepath
        //CHECK IF OVERWRITES THE IMAGE
        NSData *pngData = UIImagePNGRepresentation(ImagePicked);
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
        NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Logo.png"]; //Add the file name
        [pngData writeToFile:filePath atomically:YES ]; //Write the file
        
        
        NSError *error;
            
        Empresas *NewEmpresa = [NSEntityDescription insertNewObjectForEntityForName:@"Empresas" inManagedObjectContext:context];
            
        [NewEmpresa setDireccion:Direccion_TextField.text];
        [NewEmpresa setFecha:[NSDate date]];
        [NewEmpresa setLogo:filePath];
        [NewEmpresa setNombre:NombreEmpresa_TextField.text];
        [NewEmpresa setTelefono:Telefono_TextField.text];
            
        if (![context save:&error]) {
            //Salio mal la query?
            NSLog(@"SALIO MAL?=");
            
                
        }else{
            NSLog(@"TODO BIEN? ");
        }
        
        NSLog(@"USUARIO A GUARDAR: %@",[Config Usuario]);
        
        //SAVE ON SERVER
        // Create your request string with parameter name as defined in PHP file
        NSString *myRequestString = [NSString stringWithFormat:
                                     @"Empresa=%@&Direccion=%@&Telefono=%@&FilePath=%@&Usuario=%@",
                                     NombreEmpresa_TextField.text,
                                     Direccion_TextField.text,
                                     Telefono_TextField.text,
                                     filePath,
                                     [Config Usuario]
                                     ];
        
        
        // Create Data from request
        NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://adminenterprise.com/php/iOS_Api/RegistrarEmpresa.php"]];
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
        
        if ([response isEqual:@"1"]) {
            
            [self LoadData];
            
            EditarLabel.text = [NSString stringWithFormat:@"Nueva Empresa"];
            
            NombreEmpresa_TextField.enabled = true;
            NombreEmpresa_TextField.text = @"";
            Telefono_TextField.text = @"";
            Direccion_TextField.text = @"";
            
            //IMAGEVIEW:
            [LogoImageView setImage:nil];
            ImagePicked = nil;
            AgregarButton.hidden = NO;
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Exito" message:@"Empresa guardada" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
            
        }else{
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:response delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
        }
        
        
        
    }
    
}

-(void)EditarEmpresa:(NSIndexPath *)index{
    
    NSLog(@"EDITAR EMPRESA %@",[[EmpresasArray objectAtIndex:index.row] nombre]);
    
    EditarLabel.text = [NSString stringWithFormat:@"Editar %@",[[EmpresasArray objectAtIndex:index.row] nombre]];
    
    NombreEmpresa_TextField.enabled = false;
    NombreEmpresa_TextField.text = [[EmpresasArray objectAtIndex:index.row] nombre];
    Telefono_TextField.text = [[EmpresasArray objectAtIndex:index.row] telefono];
    Direccion_TextField.text = [[EmpresasArray objectAtIndex:index.row] direccion];
    //IMAGEVIEW:
    NSData *pngData = [NSData dataWithContentsOfFile:[[EmpresasArray objectAtIndex:index.row] logo]];
    UIImage *image = [UIImage imageWithData:pngData];
    
    [LogoImageView setImage:image];
    
    
    
    //MAKE EDIT EMPRESA MODULE
    
    
}



-(void)BorrarEmpresa:(NSIndexPath *)index{
    
    NSLog(@"BORRAR EMPRESA %@",[[EmpresasArray objectAtIndex:index.row] nombre]);
    
    //DELETE ON LOCAL DB:
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empresas"
                                              inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nombre = %@",[[EmpresasArray objectAtIndex:index.row] nombre]];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Empresas *enterprise in matchingData)
    {
        [context deleteObject:enterprise];
        NSLog(@"DELETED:");
    }
    

    
    //DELETE ON SERVER:
    
    // Create your request string with parameter name as defined in PHP file
    NSString *myRequestString = [NSString stringWithFormat:
                                 @"Empresa=%@&Usuario=%@",
                                 [[EmpresasArray objectAtIndex:index.row] nombre],
                                 [Config Usuario]
                                 ];
    
    
    // Create Data from request
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://adminenterprise.com/php/iOS_Api/EliminarEmpresa.php"]];
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

    if ([response isEqual:@"1"]) {
        
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Exito" message:@"Empresa elminada correctamente" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
    }else{
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:response delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
    }
    
    
    [EmpresasArray removeObjectAtIndex:index.row];
    
    [EmpresasTable reloadData];
    
}


- (IBAction)CancelarEmpresa:(id)sender{
    
    EditarLabel.text = [NSString stringWithFormat:@"Nueva Empresa"];
    
    NombreEmpresa_TextField.enabled = true;
    NombreEmpresa_TextField.text = @"";
    Telefono_TextField.text = @"";
    Direccion_TextField.text = @"";
    
    //IMAGEVIEW:
    [LogoImageView setImage:nil];
    ImagePicked = nil;
    AgregarButton.hidden = NO;
}




- (IBAction)GuardarEmpleado:(id)sender {
    
    if ((![Nombre_TextField.text isEqual:@""]) && (![Usuario_TextField.text isEqual:@""]) && (![Password_TextField.text isEqual:@""]) ) {
        
        if (![EmpresaToSave isEqual:@""]) {
            
            
            NSError *error;
            
            Empleados *NewEmpleado = [NSEntityDescription insertNewObjectForEntityForName:@"Empleados" inManagedObjectContext:context];
            
            [NewEmpleado setEmpresa:EmpresaToSave];
            [NewEmpleado setIsAdmin:[NSNumber numberWithBool:EsAdmin_Switch.on]];
            [NewEmpleado setNombre:Nombre_TextField.text];
            [NewEmpleado setPassword:Password_TextField.text];
            [NewEmpleado setUltimasesion:[NSDate date]];
            [NewEmpleado setUsuario:Usuario_TextField.text];
            
            if (![context save:&error]) {
                //Salio mal la query?
                NSLog(@"SALIO MAL?=");
                
                
            }else{
                NSLog(@"TODO BIEN? ");
            }
            
            [self LoadEmpleados:EmpresaToSave];
            [EmpleadosTable reloadData];
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Exito" message:@"Se ha guardado tu empleado." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
        }else{
            
            UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Favor de seleccionar una empresa." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Error show];
            
        }
        
    }else{
    
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Favor de rellenar todos los campos.." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Error show];
    }


    
}


-(void)BorrarEmpleado:(NSIndexPath *)index{
    
    NSLog(@"Empleado a borrar: %@",[EmpleadosArray objectAtIndex:index.row]);
    
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Empleados"
                                              inManagedObjectContext:context];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"usuario == %@ and empresa = %@",[[EmpleadosArray objectAtIndex:index.row] usuario],EmpresaToSave];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    
    NSArray* matchingData = [context executeFetchRequest:fetchRequest error:&error];
    
    for (Empleados *empleado in matchingData)
    {
        [context deleteObject:empleado];
        NSLog(@"DELETED:");
    }
    
    
    [self LoadEmpleados:EmpresaToSave];
    [EmpleadosTable reloadData];
    
    UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Exito" message:@"Se ha borrado tu empleado." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [Error show];
    
}

- (IBAction)CancelarEmpleado:(id)sender {
    
    
    EsAdmin_Switch.on = false;
    Nombre_TextField.text = @"";
    Usuario_TextField.text = @"";
    Password_TextField.text = @"";
    
    
}

- (IBAction)Ayuda:(id)sender {
    
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Ayuda" message:@"Seleccione su empresa y deslize de derecha a izquierda para ver las opciones, para agregar un empleado primero tiene que seleccionar una empresa."delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}


- (IBAction)AgregarLogo:(id)sender {
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    self.specialLibrary = library;
    NSMutableArray *groups = [NSMutableArray array];
    [_specialLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [groups addObject:group];
        } else {
            // this is the end
            [self displayPickerForGroup:[groups objectAtIndex:0]];
        }
    } failureBlock:^(NSError *error) {
        //self.chosenImages = nil;
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"A problem occured %@", [error description]);
        // an error here means that the asset groups were inaccessable.
        // Maybe the user or system preferences refused access.
    }];
    
    
    AgregarButton.hidden = YES;
    
    
}


- (void)displayPickerForGroup:(ALAssetsGroup *)group
{
    //load framwork:
    ELCAssetTablePicker *tablePicker = [[ELCAssetTablePicker alloc] initWithStyle:UITableViewStylePlain];
    tablePicker.singleSelection = YES;
    tablePicker.immediateReturn = YES;
    
    elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:tablePicker];
    elcPicker.maximumImagesCount = 1;
    elcPicker.imagePickerDelegate = self;
    elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
    tablePicker.parent = elcPicker;
    
    // Move me
    tablePicker.assetGroup = group;
    [tablePicker.assetGroup setAssetsFilter:[ALAssetsFilter allAssets]];
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}


#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    for (NSDictionary *dict in info) {
        //image has the image selected by user
        UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];
        [LogoImageView setImage:image];
        
        ImagePicked = image;
    }
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    //close the views
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (Configuracion *)LoadConfig:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Configuracion *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

@end
