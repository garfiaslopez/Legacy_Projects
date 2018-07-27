//
//  Usuarios.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Usuarios.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Venta.h"
#import "Gasto.h"
#import "Servicio.h"


@interface Usuarios()
{
    
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    NSInteger CeldaPulsada;

    UITapGestureRecognizer *tap;

}

@end


@implementation Usuarios
@synthesize IndexEnterprise;
@synthesize MainScroller;
@synthesize NombreTextField;
@synthesize PassConfirmTextField;
@synthesize PassTextField;
@synthesize IsAdminSwitch;
@synthesize UsuariosTableView;
@synthesize VentasLabel;
@synthesize VentasTableView;
@synthesize TotalGastosUserLabel;
@synthesize TotalVentasLabel;
@synthesize NombreUserLabel;
@synthesize PassUserLabel;
@synthesize FechaUserlabel;
@synthesize TotalVentasUserLabel;
@synthesize DiferenciaLabel;
@synthesize IsAdminImageView;
@synthesize IsAdminlabel;
@synthesize UltimoCierreLabel;
@synthesize UltimoIngresoLabel;


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    [self RecargarDatos];
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

}

-(void)viewDidAppear:(BOOL)animated
{
    [self RecargarDatos];
    [self RecargaTables];
    
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];

    if ([UsuarioSesion isAdmin]==NO) {
        
        
        //LoguinView:
        
        
        
        
    }
    
    UsuarioSesion = [[Empleado alloc]init];
}


-(void)RecargarDatos
{
    
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    
    
}

-(void)RecargaTables
{
    [VentasTableView reloadData];
    [UsuariosTableView reloadData];
}

-(void)CleanLabels
{
    NombreTextField.text = @"";
    PassTextField.text = @"";
    FechaUserlabel.text = @"";
    TotalVentasUserLabel.text = @"";
    TotalGastosUserLabel.text = @"";

}

- (IBAction)Atras:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)keyboardDidShow:(NSNotification *)notification {
    
    [self.view addGestureRecognizer:tap];
    
    if (NombreTextField.editing)
    {
        self.MainScroller.contentSize=CGSizeMake(1024,720);
    }
    
    else if (PassConfirmTextField.editing)
    {
        self.MainScroller.contentSize=CGSizeMake(1024,900);
    }
    
    else if (PassTextField.editing)
    {
        self.MainScroller.contentSize=CGSizeMake(1024,810);
    }
    else
    {
        self.MainScroller.contentSize=CGSizeMake(1024,656);
        
    }
    
    CGPoint bottomOffset = CGPointMake(0, self.MainScroller.contentSize.height - self.MainScroller.bounds.size.height);
    [self.MainScroller setContentOffset:bottomOffset animated:YES];
}
- (void)keyboardDidHide:(NSNotification *)notification {
    
    [self.view removeGestureRecognizer:tap];
    
}


-(void)dismissKeyboard {
    [NombreUserLabel resignFirstResponder];
    [PassUserLabel resignFirstResponder];
    [PassConfirmTextField resignFirstResponder];
}

- (IBAction)Guardar:(id)sender
{
    
    if (![NombreTextField.text isEqual:@""] || ![PassTextField.text isEqual:@""] || ![PassConfirmTextField.text isEqual:@""]) {
        
        
        if ([PassTextField.text isEqual:PassConfirmTextField.text]) {
            
            
            //GUARDAR EL USUARIO:
            
            Empleado *EmpleadoTmp;
            EmpleadoTmp = [[Empleado alloc]init];
            
            [EmpleadoTmp setNombre:NombreTextField.text];
            [EmpleadoTmp setPassword:PassTextField.text];
            [EmpleadoTmp setFechaRegistro:[NSDate date]];
            
            if (IsAdminSwitch.selected) {
                [EmpleadoTmp setIsAdmin:YES];
            }else
                [EmpleadoTmp setIsAdmin:NO];
            
            
            
            [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados]addObject:EmpleadoTmp];
            
            [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
            
            [self RecargarDatos];
            [self RecargaTables];
            [self CleanLabels];
            
            NombreTextField.text = @"";
            PassTextField.text =@"";
            PassConfirmTextField.text =@"";
            
            UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha registrado su usuario." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
            
            
        }
        else
        {
            
            UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Contraseñas Erroneas" message:@"Introducir de la misma manera las contraseñas." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
            
        }
        
    }
    else
    {
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Favor de rellenar los campos para poder agregar al usuarios" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        
    }
    
    
}

- (IBAction)Borrar:(id)sender
{
    
    NombreTextField.text = @"";
    PassTextField.text =@"";
    PassConfirmTextField.text =@"";
}



-(double)TotalVentas
{
    double total=0;
    
    for (int i =0; i<[[UsuarioSesion Ventas] count]; i++) {
        total += [[[UsuarioSesion Ventas]objectAtIndex:i]Total];
    }
    
    return total;
    
}

-(double)TotalGastos
{
    
    double total=0;
    
    for (int i =0; i<[[UsuarioSesion Gastos]count ]; i++) {
        total+=[[[UsuarioSesion Gastos]objectAtIndex:i]Precio];
    }
    
    return total;
}


-(void)ReloadLabels
{
    
    NombreUserLabel.text = [UsuarioSesion Nombre];
    PassUserLabel.text = [UsuarioSesion Password];
    FechaUserlabel.text = [NSDateFormatter localizedStringFromDate:[UsuarioSesion FechaRegistro]dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];
    
    TotalVentasUserLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[self TotalVentas]];
    TotalGastosUserLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[self TotalGastos]];
    
    DiferenciaLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[self TotalVentas] - [self TotalGastos]];
    TotalVentasLabel.text = [[NSString alloc]initWithFormat:@"%lu",[[UsuarioSesion Ventas]count]];
    
    UltimoIngresoLabel.text = [NSDateFormatter localizedStringFromDate:[UsuarioSesion DiaInicio]dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];

    UltimoCierreLabel.text = [NSDateFormatter localizedStringFromDate:[UsuarioSesion DiaFinal]dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];
    

    
    if ([UsuarioSesion isAdmin]) {
        [IsAdminlabel setText:@"Admin"];
        IsAdminImageView.backgroundColor = [UIColor greenColor];
    }else
    {
        [IsAdminlabel setText:@"Empleado"];
        IsAdminImageView.backgroundColor = [UIColor lightGrayColor];
    }
    
}



#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 0)
    {
        return [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count];
    }
    
    if (tableView.tag == 1)
    {
        return [[UsuarioSesion Ventas] count];
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
        
        cell.textLabel.text = [[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:indexPath.row] Nombre];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"Ventas: %lu",[[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:indexPath.row] Ventas] count]];
        
    }
    
    
    
    if (tableView.tag == 1)
    {
        if ([[UsuarioSesion Ventas] count]!=0) {
            
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[[UsuarioSesion Ventas]objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[[UsuarioSesion Ventas]objectAtIndex:indexPath.row] Total]];
            
        }
        
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    
    
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        if (tableView.tag == 0)
        {
            
            [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados]removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
            
            [self RecargarDatos];
            [self RecargaTables];
            
            [self CleanLabels];
            
            UIAlertView *exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha borrado." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [exito show];
            
        }
        
        if (tableView.tag == 1)
        {
            [self.VentasTableView beginUpdates];
            
            // Do all the insertRowAtIndexPath and all the changes to the data source array
            
            NSMutableArray *TicketsTmp = [[NSMutableArray alloc]init];
            [TicketsTmp setArray:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:CeldaPulsada] Ventas]];
            
            [TicketsTmp removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            
            [[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:CeldaPulsada] setVentas:TicketsTmp];
            
            [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
            
            
            //compara si el usuario que borra se encuentra en sesion:
            
            UsuarioSesion = [self LoadEmpleado:@"Sesion"];
            if ([[UsuarioSesion Nombre]isEqual:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:CeldaPulsada] Nombre]]) {
                
                //borro lo que esta en sesion:
                [UsuarioSesion setVentas:TicketsTmp];
                
                [self SaveEmpleado:UsuarioSesion key:@"Sesion"];
                
            }
            
            UsuarioSesion = [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:CeldaPulsada];
            
            [self RecargarDatos];
            [self RecargaTables];
            [self CleanLabels];
            
            UIAlertView *exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha borrado." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [exito show];
            
            [self.VentasTableView endUpdates];
            
            
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
        
        CeldaPulsada = indexPath.row;
        UsuarioSesion = [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:indexPath.row];
        [VentasTableView reloadData];
        [self ReloadLabels];
        
    }
    
    
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

-(NSMutableArray *)loadArrayOfCustomObjectsWithKey:(NSString *)Key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:Key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
}

-(void)saveArrayOfCustomObjects:(NSMutableArray*)Arreglo key:(NSString*)Key{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:Arreglo];
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    [Salvar setObject:encodedObject forKey:Key];
    [Salvar synchronize];
}




-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}


@end
