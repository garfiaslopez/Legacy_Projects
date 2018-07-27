//
//  MainWindow.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "MainWindow.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Venta.h"
#import "Gasto.h"
#import "Servicio.h"
#import "ServiciosViewCell.h"

#import "Servicios.h"
#import "Reporte.h"
#import "Historial.h"
#import "Usuarios.h"
#import "Configuraciones.h"



@interface MainWindow ()
{

    NSMutableArray* EmpresasArray;
    Empleado *UsuarioSesion;
    
    NSMutableArray *ServiciosSelected;

    double SumaTicket;
    
    NSMutableArray *GastosToday;
    
    int NumeroVentas;
    
}
@end

@implementation MainWindow
@synthesize IndexEnterprise;
@synthesize TitleBarNav;
@synthesize FechaLabel;
@synthesize HoraInicioLabel;
@synthesize UsuarioLabel;
@synthesize BackgroundImage;
@synthesize VentaButton;
@synthesize gastoButton;
@synthesize ServiciosButton;
@synthesize ReporteButton;
@synthesize HistorialButton;
@synthesize UsuariosButton;
@synthesize VentaBackImage;
@synthesize VentaCollectionView;
@synthesize VentaTableView;
@synthesize VentaTotalLabel;
@synthesize VentaView;
@synthesize GastosTableView;
@synthesize GastoView;
@synthesize ConceptoGastoTextField;
@synthesize PrecioGastoTextField;
@synthesize TotalGastosLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    ServiciosSelected = [[NSMutableArray alloc]init];
    GastosToday = [[NSMutableArray alloc]init];
    
    SumaTicket = 0;
    NumeroVentas = 1;
    
    [self RecargarDatos];
    
    
    self.VentaCollectionView.allowsMultipleSelection = YES;


}

-(void)viewDidAppear:(BOOL)animated
{
    [self RecargarDatos];
    [GastosTableView reloadData];
    TotalGastosLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[self TotalGastos]];

}


-(void)RecargarDatos
{
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];
    [self RecargaLabels];
    [VentaCollectionView reloadData];
    
    
    
    NSDateFormatter *FormatoNsDate = [[NSDateFormatter alloc] init];
    [FormatoNsDate setDateFormat:@"dd"];  //DIA:
    NSString*DayToday = [FormatoNsDate stringFromDate:[NSDate date]];
    
    [GastosToday removeAllObjects];
    
    for (int i = 0; i<[[UsuarioSesion Gastos]count]; i++) {
        
        if ([DayToday isEqual: [FormatoNsDate stringFromDate:[[[UsuarioSesion Gastos] objectAtIndex:i] Fecha]]]) {
            
            [GastosToday addObject:[[UsuarioSesion Gastos] objectAtIndex:i]];
            
        }
    }
    NSLog(@"ELEMENTOS EN GASTOS TODAY: %lu",(unsigned long)GastosToday.count);

    
}

-(void)RecargaLabels
{
    
    UsuarioLabel.text = [UsuarioSesion Nombre];
    FechaLabel.text = [NSDateFormatter localizedStringFromDate:[NSDate date ] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    HoraInicioLabel.text = [NSDateFormatter localizedStringFromDate:[UsuarioSesion DiaInicio] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
    [TitleBarNav setTitle:[[EmpresasArray objectAtIndex:IndexEnterprise] Nombre]];

}

- (IBAction)CerrarSesion:(id)sender
{
    
    [UsuarioSesion setDiaFinal:[NSDate date]];
    
    for (int i=0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count]; i++) {
        
        if ([[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] Nombre]isEqual:[UsuarioSesion Nombre]]) {
            
            [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] replaceObjectAtIndex:i withObject:UsuarioSesion];
        }
        
    }
    
    [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
    
    [[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)VentaAction:(id)sender
{
    
    [UIView animateWithDuration:0.3 animations:^(){
        VentaView.frame = CGRectMake(0, 103, 1024, 665);
    }];
    
    [VentaCollectionView reloadData];
}

- (IBAction)CobrarVenta:(id)sender
{
    
    if (SumaTicket != 0) {
        
        
        Venta *VentaTmp;
        VentaTmp = [[Venta alloc]init];
        
        [VentaTmp setEmpleado:[UsuarioSesion Nombre]];
        [VentaTmp setFecha:[NSDate date]];
        [VentaTmp setNumeroVenta:NumeroVentas];
        [VentaTmp setTotal:SumaTicket];
        [VentaTmp setConceptos:ServiciosSelected];
        
        
        //CREATE IMAGE:
        
        NSMutableString *stringTocreate = [[NSMutableString alloc]init];
        
        [stringTocreate appendString:[NSString stringWithFormat:@"Numero de Venta: %i",NumeroVentas]];
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        [stringTocreate appendString:[[EmpresasArray objectAtIndex:IndexEnterprise] Nombre]];
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        [stringTocreate appendString:[NSString stringWithFormat:@" Hora : %@\n",[NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]]];
        [stringTocreate appendString:[NSString stringWithFormat:@" Empleado en turno: %@",[UsuarioSesion Nombre]]];
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        [stringTocreate appendString:@"Servicios: "];
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        
        for (int i = 0; i<ServiciosSelected.count; i++) {
            
            [stringTocreate appendString:[[NSString alloc] initWithFormat:@"%d - %@  -  $%.2f \n",[[ServiciosSelected objectAtIndex:i]Cantidad],[[ServiciosSelected objectAtIndex:i]Concepto], [[ServiciosSelected objectAtIndex:i]Precio]]];
        }
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        [stringTocreate appendString:[NSString stringWithFormat:@" Total: $%.2f",SumaTicket]];
        [stringTocreate appendString:@"\n---------------------------------------------\n"];
        
        NSString *StringToPrint = [NSString stringWithString:stringTocreate];
        NSLog(@"%@",stringTocreate);
        
        UIImage *VentaImage = [[UIImage alloc]init];
        VentaImage = [self CreateImageToPrint:StringToPrint width:832 sizeF:22];
        [VentaTmp setImagenTicket:VentaImage];
        
        NSMutableArray *VentasArrayTmp = [[NSMutableArray alloc]init];
        [VentasArrayTmp setArray:[UsuarioSesion Ventas]];
        
        
        [VentasArrayTmp addObject:VentaTmp];
        
        //SAVE IN USER:
        [UsuarioSesion setVentas:VentasArrayTmp];
        
        for (int i=0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count]; i++) {
            
            if ([[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] Nombre]isEqual:[UsuarioSesion Nombre]]) {
                
                [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] replaceObjectAtIndex:i withObject:UsuarioSesion];
            }
            
        }
        //Modify the STOCK:
        NSMutableArray *ServiciosTmp = [[NSMutableArray alloc]init];
        
        [ServiciosTmp setArray:[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios]];
        
        
        
        for (int j =0; j<ServiciosTmp.count; j++) {
            
            NSLog(@"Nombre %@ , cantidad: %d",[[ServiciosTmp objectAtIndex:j]Concepto],[[ServiciosTmp objectAtIndex:j]Cantidad]);
            
        }
        
        
        for (int i = 0; i<ServiciosSelected.count; i++) {
            
            for (int j =0; j<ServiciosTmp.count; j++) {
                
                
                if ([[[ServiciosSelected objectAtIndex:i] Concepto] isEqual:[[ServiciosTmp objectAtIndex:j]Concepto]])
                {
                    
                    int anteriorStock = [[ServiciosTmp objectAtIndex:j] Cantidad];
                    
                    NSLog(@"ANTERIORSTOCK %d",anteriorStock);
                    NSLog(@"AHORASTOCK %d",[[ServiciosSelected objectAtIndex:i] Cantidad]);
                    
                    [[ServiciosTmp objectAtIndex:j] setCantidad:anteriorStock - [[ServiciosSelected objectAtIndex:i] Cantidad]];
                    
                }
            }
        }
        
        
        NSLog(@"NUMERO DE SERVICIOS: %lu",ServiciosTmp.count);
        
        [[EmpresasArray objectAtIndex:IndexEnterprise] setServicios:ServiciosTmp];
        
        [self SaveEmpleado:UsuarioSesion key:@"Sesion"];
        [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
        
        [self RecargarDatos];
        
        [ServiciosSelected removeAllObjects];
        [VentaTableView reloadData];
        
        [UIView animateWithDuration:0.0 animations:^(){
            VentaView.frame = CGRectMake(-1024, 103, 1024, 665);
        }];
        

        
        
    }
    else
    {
    
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Por favor Seleccione algun servicio para cobrar." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [Error show];
    }
    
    
}

- (IBAction)CerrarCobrarVenta:(id)sender
{
    
    [ServiciosSelected removeAllObjects];
    [VentaTableView reloadData];
    SumaTicket = 0;
    
    
    
    [UIView animateWithDuration:0.0 animations:^(){
        VentaView.frame = CGRectMake(-1024, 103, 1024, 665);
    }];
}

- (IBAction)GastoAction:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^(){
        GastoView.frame = CGRectMake(0, 103, 1024, 665);
    }];
}


- (IBAction)GuardarGasto:(id)sender
{
    
    //comprobar que no este vacio:
    if (![ConceptoGastoTextField.text isEqual:@""] || ![PrecioGastoTextField.text isEqual:@""])
    {
        //guardar
        NSMutableArray *gastosTmp  = [[NSMutableArray alloc]init];
        [gastosTmp setArray:[UsuarioSesion Gastos]];
        
        Gasto *GastoTmp;
        GastoTmp = [[Gasto alloc]init];
        
        [GastoTmp setConcepto:ConceptoGastoTextField.text];
        [GastoTmp setPrecio:[PrecioGastoTextField.text doubleValue]];
        [GastoTmp setFecha:[NSDate date]];
        
        [gastosTmp addObject: GastoTmp];
        
        [UsuarioSesion setGastos:gastosTmp];
        
        [self SaveEmpleado:UsuarioSesion key:@"Sesion"];
        
        
        //save Empleado:
        for (int i=0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] count]; i++) {
            
            if ([[[[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] objectAtIndex:i] Nombre]isEqual:[UsuarioSesion Nombre]])
            {
                [[[EmpresasArray objectAtIndex:IndexEnterprise] Empleados] replaceObjectAtIndex:i withObject:UsuarioSesion];
            }
        }
        //save Empresa:
        [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
        
        [self RecargarDatos];
        [GastosTableView reloadData];
        
        ConceptoGastoTextField.text = @"";
        PrecioGastoTextField.text = @"";
        TotalGastosLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[self TotalGastos]];
        
        
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha guardado su gasto." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [Error show];
        
        
    }else
    {
        //error:
        
        UIAlertView *Error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Por favor escriba algun concepto y precio." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [Error show];
        
    }

}

- (IBAction)Borrar:(id)sender
{
    
    ConceptoGastoTextField.text = @"";
    PrecioGastoTextField.text = @"";
    
}

- (IBAction)CerrarGasto:(id)sender
{
    ConceptoGastoTextField.text = @"";
    PrecioGastoTextField.text = @"";
    
    
    [UIView animateWithDuration:0.0 animations:^(){
        GastoView.frame = CGRectMake(-1024, 103, 1024, 665);
    }];
}

- (IBAction)Configuraciones:(id)sender
{
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    ConfigView = [Main instantiateViewControllerWithIdentifier:@"ConfigView"];
    ConfigView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ConfigView.IndexEnterprise = IndexEnterprise;
    
    [self presentViewController:ConfigView animated:YES completion:NULL];
    
}
- (IBAction)ServiciosAction:(id)sender
{
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    ServicioView = [Main instantiateViewControllerWithIdentifier:@"ServiciosView"];
    ServicioView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ServicioView.IndexEnterprise = IndexEnterprise;
    
    [self presentViewController:ServicioView animated:YES completion:NULL];
    
}

- (IBAction)ReporteAction:(id)sender
{
   
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    ReporteView = [Main instantiateViewControllerWithIdentifier:@"ReporteView"];
    ReporteView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ReporteView.IndexEnterprise = IndexEnterprise;
    
    [self presentViewController:ReporteView animated:YES completion:NULL];
    
    
}

- (IBAction)HistorialAction:(id)sender
{
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    HistorialView = [Main instantiateViewControllerWithIdentifier:@"HistorialView"];
    HistorialView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    HistorialView.IndexEnterprise = IndexEnterprise;
    
    [self presentViewController:HistorialView animated:YES completion:NULL];
    
}

- (IBAction)UsuariosAction:(id)sender
{
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    UsuariosView = [Main instantiateViewControllerWithIdentifier:@"UsuariosView"];
    UsuariosView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    UsuariosView.IndexEnterprise = IndexEnterprise;
    
    [self presentViewController:UsuariosView animated:YES completion:NULL];
    
    
    
}


#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ServiciosViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Celda" forIndexPath:indexPath];
    
    
    //Inicializacion de varbiables adentro de la celda:
    [cell setCantidadStock:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Cantidad]];
    [cell setCantidadSelected:1];
    
    
    //inicializacion de labels dentro de la celda:
    cell.NombreServ.text = [[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Concepto];
    cell.PrecioServ.text = [NSString stringWithFormat:@"$%.2f",[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Precio]];
    [cell.LogoServ setImage:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Imagen]];
    cell.StockServ.text = [NSString stringWithFormat:@"%d",[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Cantidad] -1];
    cell.backgroundColor = [UIColor colorWithRed:16/255.0 green:92/255.0 blue:119/255.0 alpha:1];
    
    
    
    
    // highlight selection

    
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
    
    //normalCell:
  //  UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
   // datasetCell.backgroundColor = [UIColor greenColor]; // highlight selection
    
    
    ServiciosViewCell *cell = (ServiciosViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //AMARILLO:
    cell.backgroundColor = [UIColor colorWithRed:159/255.0 green:213/255.0 blue:244/255.0 alpha: 1];
    
    Servicio *ServTmp = [[Servicio alloc]init];
    
    //ESTA MAL, SOLO COPIA LAS DIRECCIONES POR LO TANTO SI MODIFICO SERVTMP SE MODIFICA TAMBIEN MI ORIGINAL:
    
    
   // ServTmp = [[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row];

    //FORMA CORRECTA, CREANDO UN CONSTRUCTOR DE COPIAR (INITWITHOBJECT)
    [ServTmp setConcepto:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Concepto]];
    [ServTmp setPrecio:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Precio]];
    [ServTmp setImagen:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Imagen]];
    [ServTmp setCantidad:cell.CantidadSelected];
    
    cell.Stepper.enabled = NO;
    
    
    [ServiciosSelected addObject:ServTmp];
    
    SumaTicket = SumaTicket + [[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Precio] * cell.CantidadSelected;
    
    VentaTotalLabel.text = [NSString stringWithFormat:@"$%.2f",SumaTicket];
    
    [VentaTableView reloadData];
    
    
    
    NSLog(@"TAM %lu",ServiciosSelected.count);
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //deselect color of row...
    ServiciosViewCell *cell = (ServiciosViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:16/255.0 green:92/255.0 blue:119/255.0 alpha:1];

    cell.Stepper.enabled = YES;

    for (int i=0; i<ServiciosSelected.count; i++) {
        
        
        if ([[[ServiciosSelected objectAtIndex:i]Concepto ]isEqual: [[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Concepto]])
        {
            NSLog(@"ENTRO A ELIMINAR");
            
            SumaTicket = SumaTicket-[[ServiciosSelected objectAtIndex:i] Precio] * cell.CantidadSelected;
            VentaTotalLabel.text = [NSString stringWithFormat:@"$%.2f",SumaTicket];
            
            [ServiciosSelected removeObjectAtIndex:i];
            
            [VentaTableView reloadData];
            
        }
        
    }
    
    NSLog(@"TAM %lu",ServiciosSelected.count);

    
}



#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 0) {
        return ServiciosSelected.count;
    }
    if (tableView.tag == 1) {
        return GastosToday.count;
    }
    return 0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (tableView.tag == 0) {
        
    
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            
        }
        
        [cell.imageView setImage:[[ServiciosSelected objectAtIndex:indexPath.row] Imagen]];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%d - %@", [[ServiciosSelected objectAtIndex:indexPath.row] Cantidad],[[ServiciosSelected objectAtIndex:indexPath.row] Concepto]];
        
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[ServiciosSelected objectAtIndex:indexPath.row] Precio]];
        
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = [UIColor blackColor];
        
        

        
    }

    
    if (tableView.tag == 1) {
        
        if(cell == nil){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            
        }
        
        cell.textLabel.text = [[GastosToday objectAtIndex:indexPath.row] Concepto];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[GastosToday objectAtIndex:indexPath.row]Precio]];
        
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        return NO;
    }
    if (tableView.tag == 1) {
        return NO;
    }
    return NO;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     
     self.Resistencias.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     */
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



-(double)TotalGastos
{
    
    double total=0;
    
    for (int i =0; i<[GastosToday count ]; i++) {
        total+=[[GastosToday objectAtIndex:i]Precio];
    }
    
    return total;
}



-(UIImage *)CreateImageToPrint:(NSString *)TextToImage width:(int)width sizeF:(double) sizeFont
{
    
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:sizeFont];
    NSLog(@"Width: %d",width);
    
    CGSize size = CGSizeMake(width, 10000);
    
    
    CGSize messuredSize = [TextToImage sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    
	if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
		if ([[UIScreen mainScreen] scale] == 2.0) { //Retina
			UIGraphicsBeginImageContextWithOptions(messuredSize, NO, 1.0);
		} else { //Non Retina
			UIGraphicsBeginImageContext(messuredSize);
		}
	} else {
		UIGraphicsBeginImageContext(messuredSize);
	}
    
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor whiteColor];
    [color set];
    
    CGRect rect = CGRectMake(0, 0, messuredSize.width + 1, messuredSize.height + 1);
    CGContextFillRect(ctr, rect);
    
    color = [UIColor blackColor];
    [color set];
    
    [TextToImage drawInRect:rect withFont:font lineBreakMode:UILineBreakModeWordWrap];
    
    UIImage *imageToPrint = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return imageToPrint;
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



-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}


@end
