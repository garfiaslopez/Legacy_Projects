//
//  Reporte.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Reporte.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Venta.h"
#import "Gasto.h"




@interface Reporte()
{
    
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    NSMutableArray *GastosToday;
    NSMutableArray *TicketsToday;
    

}

@end


@implementation Reporte
@synthesize HoraEntradaLabel;
@synthesize HoraSalidaLabel;
@synthesize TiempoLaboradoLabel;
@synthesize TotalGastosLabel;
@synthesize TotalVentasLabel;
@synthesize DiferenciaLabel;
@synthesize VentasTableView;
@synthesize GastosTableView;
@synthesize DescripVentaImage;
@synthesize UsuarioLabel;
@synthesize VentaScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    TicketsToday = [[NSMutableArray alloc]init];
    GastosToday = [[NSMutableArray alloc]init];
    
    [self RecargarDatos];
    
}


-(void)RecargarDatos
{
    
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];
    
    
    [TicketsToday removeAllObjects];
    [GastosToday removeAllObjects];
    
    NSDateFormatter *FormatoNsDate = [[NSDateFormatter alloc] init];
    [FormatoNsDate setDateFormat:@"dd"];  //DIA:
    NSString*DayToday = [FormatoNsDate stringFromDate:[NSDate date]];
    
    for (int i = 0; i<[[UsuarioSesion Ventas]count]; i++) {
        
        if ([DayToday isEqual: [FormatoNsDate stringFromDate:[[[UsuarioSesion Ventas] objectAtIndex:i] Fecha]]]) {
            
            [TicketsToday addObject:[[UsuarioSesion Ventas] objectAtIndex:i]];
            
        }
    }
    
    for (int i = 0; i<[[UsuarioSesion Gastos]count]; i++) {
        
        if ([DayToday isEqual: [FormatoNsDate stringFromDate:[[[UsuarioSesion Gastos] objectAtIndex:i] Fecha]]]) {
            
            [GastosToday addObject:[[UsuarioSesion Gastos] objectAtIndex:i]];
            
        }
    }
    
    [self RecargaLabels];
    
    NSLog(@"ELEMENTOS EN TICKETS TODAY: %lu",(unsigned long)TicketsToday.count);
    NSLog(@"ELEMENTOS EN GASTOS TODAY: %lu",(unsigned long)GastosToday.count);
    
    
}

-(void)RecargaLabels
{
    UsuarioLabel.text = [UsuarioSesion Nombre];
    HoraEntradaLabel.text = [NSDateFormatter localizedStringFromDate:[UsuarioSesion DiaInicio] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
    HoraSalidaLabel.text = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
    TiempoLaboradoLabel.text = [NSString stringWithFormat:@"%@",[self ClockFormat:(int)[[NSDate date] timeIntervalSinceDate:[UsuarioSesion DiaInicio]]]];
    TotalVentasLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentasFunction]];
    TotalGastosLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalGastosFunction]];
    DiferenciaLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentasFunction]-[self TotalGastosFunction]];
    
    
}

- (IBAction)Atras:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:Nil];
    
}










#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 0) {
        return TicketsToday.count;
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
        
        cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[TicketsToday objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[TicketsToday objectAtIndex:indexPath.row] Total]];
        
        
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
    
    if (tableView.tag == 0) {
        
//        [DescripVentaImage setImage:[[TicketsToday objectAtIndex:indexPath.row] ImagenTicket]];
        
        [self UpdateScrollReport:[[TicketsToday objectAtIndex:indexPath.row] ImagenTicket]];

    }
}



-(double)TotalVentasFunction
{
    double total=0;
    
    for (int i =0; i<[TicketsToday count]; i++) {
        total += [[TicketsToday objectAtIndex:i]Total];
    }
    
    return total;
    
}

-(double)TotalGastosFunction
{
    
    double total=0;
    
    for (int i =0; i<[GastosToday count ]; i++) {
        total+=[[GastosToday objectAtIndex:i]Precio];
    }
    
    return total;
}


-(NSString *)ClockFormat: (int)Segundos
{
    if (Segundos>=3600) {
        
        long int hours = Segundos / 3600;
        long int minutes = (Segundos % 3600) / 60;
        long int seconds = Segundos % 60;
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", hours, minutes, seconds];
    }
    else
    {
        long int minutes = Segundos / 60;
        long int seconds = Segundos % 60;
        return [NSString stringWithFormat:@"00:%02ld:%02ld", minutes, seconds];
    }
}

-(void)UpdateScrollReport:(UIImage *)imagen
{
    UIImageView *imageview = [[UIImageView alloc]initWithImage:imagen];
    
    for(UIView *subview in [VentaScrollView subviews]) {
        [subview removeFromSuperview];
    }
    
    [VentaScrollView addSubview: imageview];
    
    [VentaScrollView setContentSize:CGSizeMake(imageview.frame.size.width, imageview.frame.size.height)];
    
    [VentaScrollView setScrollEnabled:YES];
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




-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

@end
