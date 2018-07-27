//
//  ConfigEmpresas.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "ConfigEmpresas.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Servicio.h"
#import "Venta.h"
#import "Gasto.h"


@interface ConfigEmpresas()
{
    
    NSMutableArray* EmpresasArray;
    NSMutableArray* EmpleadosArray;

    Empresa *EnterpriseSelected;
    Empleado *EmpleadoSelected;
    Empleado *UsuarioSesion;
    
    
}

@end




@implementation ConfigEmpresas
@synthesize NombreEmpresaLabel;
@synthesize NombreEmpresaTextField;
@synthesize TotalGastosLabel;
@synthesize TotalVentasLabel;
@synthesize DiferenciaLabel;
@synthesize EmpresasTableView;
@synthesize EmpleadosTableView;
@synthesize VentasTableView;
@synthesize GastosTableView;
@synthesize LoginView;
@synthesize UserLoginTextField;
@synthesize ContraLoginTExtField;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    EmpresasArray = [[NSMutableArray alloc]init];
    EnterpriseSelected = [[Empresa alloc] init];
    EmpleadoSelected = [[Empleado alloc]init];
    EmpleadosArray = [[NSMutableArray alloc] init];
    UsuarioSesion = [[Empleado alloc]init];
    
    [self RecargarDatos];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [self RecargarDatos];

    for (int i =0 ; i<[EmpresasArray count]; i++) {
        
        
        for (int j=0; j<[[[EmpresasArray objectAtIndex:i] Empleados] count]; j++) {
            
            [EmpleadosArray addObject:[[[EmpresasArray objectAtIndex:i] Empleados] objectAtIndex:j]];
            
        }
        
        
    }
    
    NSLog(@"EMPLEADOS: %lu",EmpleadosArray.count);
    
    [UIView animateWithDuration:0.2 animations:^(){
        LoginView.frame = CGRectMake(0, 0, 1024, 704);
    }];
    
    
    
}
-(void)RecargarDatos
{
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];
}

-(void)RecargaTables
{

    [EmpresasTableView reloadData];
    [EmpleadosTableView reloadData];
    [VentasTableView reloadData];
    [GastosTableView reloadData];
    
}

-(void)ReloadLabels
{

    NombreEmpresaLabel.text = [EnterpriseSelected Nombre];
    TotalVentasLabel.text = [NSString stringWithFormat:@"%.2f",[self TotalVentasEmpresa]];
    TotalGastosLabel.text = [NSString stringWithFormat:@"%.2f",[self TotalGastosEmpresa]];
    DiferenciaLabel.text = [NSString stringWithFormat:@"%.2f",[self TotalVentasEmpresa]-[self TotalGastosEmpresa]];
}



-(double)TotalVentasEmpresa
{
    
    double Suma=0.0;
    
    for ( int i = 0; i<[[EnterpriseSelected Empleados] count]; i++) {
        
        for ( int j=0; j< [[[[EnterpriseSelected Empleados] objectAtIndex:i] Ventas] count]; j++) {
            
            Suma = Suma + [[[[[EnterpriseSelected Empleados] objectAtIndex:i] Ventas] objectAtIndex:j] Total];
            
        }
    }
    
    return Suma;
    
}

-(double)TotalGastosEmpresa
{
    double Suma = 0.0;
    
    for ( int i = 0; i<[[EnterpriseSelected Empleados] count]; i++) {
        
        for ( int j=0; j< [[[[EnterpriseSelected Empleados] objectAtIndex:i] Gastos] count]; j++) {
            
            Suma = Suma + [[[[[EnterpriseSelected Empleados] objectAtIndex:i] Gastos] objectAtIndex:j] Precio];
            
        }
    }
    return Suma;
    
}




#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    if (tableView.tag == 0) {
        
        return EmpresasArray.count;
    }
    if (tableView.tag == 1) {
        return [[EnterpriseSelected Empleados]count];
    }
    if (tableView.tag == 2) {
        return [[EmpleadoSelected Ventas]count];
    }
    if (tableView.tag == 3) {
        return [[EmpleadoSelected Gastos]count];
    }
    return 0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    
    
    
    if (tableView.tag == 0)
    {
        
        
        cell.textLabel.text = [[EmpresasArray objectAtIndex:indexPath.row] Nombre];
        
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"Empleados: %lu",[[[EmpresasArray objectAtIndex:indexPath.row] Empleados] count]];
        

        
    }
    if (tableView.tag == 1)
    {
        
        
        cell.textLabel.text = [[[EnterpriseSelected Empleados] objectAtIndex:indexPath.row] Nombre];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"Ventas: %lu",[[[[EnterpriseSelected Empleados] objectAtIndex:indexPath.row] Ventas] count]];

        
    }
    if (tableView.tag == 2)
    {
        
        if ([[EmpleadoSelected Ventas] count]!=0) {
            
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[[EmpleadoSelected Ventas]objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[[EmpleadoSelected Ventas]objectAtIndex:indexPath.row] Total]];
            
        }
        
        
        
    }
    if (tableView.tag == 3)
    {
        
        if ([[EmpleadoSelected Gastos] count]!=0) {
            
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[[EmpleadoSelected Gastos]objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[[EmpleadoSelected Gastos]objectAtIndex:indexPath.row] Precio]];
            
        }
        
        
        
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    
    
    
    return cell;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 0) {
    
        return YES;
    }
    return NO;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0)
    {
        
        for (int i = 0; i<[EmpresasArray count]; i++) {
            
            if ([[[EmpresasArray objectAtIndex: indexPath.row] Nombre] isEqual:[[EmpresasArray objectAtIndex:i]Nombre]]) {
                
                [EmpresasArray removeObjectAtIndex:i];
                
                [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
                
                [self RecargarDatos];
                [self RecargaTables];
                [self ReloadLabels];
                
            }
            
            
        }
        
        
        
    }

    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     
     self.Resistencias.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     */
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    if (tableView.tag == 0)
    {
        
        EnterpriseSelected = [EmpresasArray objectAtIndex:indexPath.row];
        [self RecargaTables];
        [self ReloadLabels];
    }
    
    if (tableView.tag == 1) {
        
        EmpleadoSelected = [[EnterpriseSelected Empleados] objectAtIndex:indexPath.row];
        [self RecargaTables];
        
    }
    
    
}

- (IBAction)Guardar:(id)sender
{
    NSLog(@"ENTRO A GUARDAR");
    
    if (![NombreEmpresaTextField.text isEqual:@""])
    {
        
        Empresa *NewEmpresa = [[Empresa alloc]init];
        [NewEmpresa setNombre:NombreEmpresaTextField.text];
        
        Empleado *NewEmpleado = [[Empleado alloc]init];
        
        [NewEmpleado setNombre:[UsuarioSesion Nombre]];
        [NewEmpleado setFechaRegistro:[NSDate date]];
        [NewEmpleado setPassword:[UsuarioSesion Password]];
        [NewEmpleado setIsAdmin:YES];
        
        NSMutableArray *ArregloEmpleados = [[NSMutableArray alloc]init];
        
        [ArregloEmpleados addObject:NewEmpleado];
        
        [NewEmpresa setEmpleados:ArregloEmpleados];
        
        [EmpresasArray addObject:NewEmpresa];
        [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
        
        //Notificacion:
        UIAlertView *Exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Las configuraciones iniciales se han guardado." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [Exito show];
        
        [self RecargarDatos];
        [self RecargaTables];
        
    }


    

}

- (IBAction)Borrar:(id)sender
{
    NombreEmpresaLabel.text = @"";
    
}

- (IBAction)Atras:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)LoginAdmin:(id)sender
{
    
    BOOL Encontrado = false;
    
    for ( int i = 0; i<[EmpleadosArray count]; i++) {
        
        
        if ([UserLoginTextField.text isEqual:[[EmpleadosArray objectAtIndex:i] Nombre]]  &&
            [ContraLoginTExtField.text isEqual:[[EmpleadosArray objectAtIndex:i] Password]])
        {
            
            Encontrado = true;

            
            if ([[EmpleadosArray objectAtIndex:i] isAdmin] == YES) {
                
                NSLog(@"ENCONTRADO");
                
                UserLoginTextField.text = @"";
                ContraLoginTExtField.text = @"";
                
                
                //save empleado sesion:
                [self SaveEmpleado:[EmpleadosArray objectAtIndex:i] key:@"Sesion"];
                
                
                [UIView animateWithDuration:0.3 animations:^(){
                    LoginView.frame = CGRectMake(-1024, 0, 1024, 704);
                }];
                
                
            }
            else
            {
                UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"No tiene permisos" message:@"Solo pueden entrar administradores." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alerta show];
            }

            
        }
        
    }
    
    if (Encontrado == false)
    {
        
        UIAlertView *alerta = [[UIAlertView alloc]initWithTitle:@"Usuario No Encontrado" message:@"Por favor escriba de manera correcta su nombre y su contraseña." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
        
    }
    
    [self RecargarDatos];

}



-(void)saveArrayOfCustomObjects:(NSMutableArray*)Arreglo key:(NSString*)Key{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:Arreglo];
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    [Salvar setObject:encodedObject forKey:Key];
    [Salvar synchronize];
}


-(NSMutableArray *)loadArrayOfCustomObjectsWithKey:(NSString *)Key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:Key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
}
             
             - (void)SaveEmpleado:(Empleado *)object key:(NSString *)key {
                 NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
                 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                 [defaults setObject:encodedObject forKey:key];
                 [defaults synchronize];
             }
             
             
             

- (Empleado *)LoadEmpleado:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Empleado *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}



-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}


@end
