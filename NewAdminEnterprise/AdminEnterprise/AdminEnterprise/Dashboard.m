//
//  Dashboard.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 15/01/15.
//  Copyright (c) 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Dashboard.h"
#import "ProductosVC.h"
#import "ReporteVC.h"
#import "HistorialVC.h"
#import "NotasVC.h"
#import "ClientesVC.h"
#import "PendientesVC.h"


@interface Dashboard ()

@end

@implementation Dashboard

@synthesize TitleBarDashboard;
@synthesize EmpleadoSesion;
@synthesize EmpresaSesion;
@synthesize FechaSesion;
@synthesize LogoEmpresa;
@synthesize UsuarioLabel;
@synthesize NumVentasLabel;
@synthesize TotalGastosLabel;
@synthesize TotalVentasLabel;
@synthesize NumGastosLabel;
@synthesize FechaLabel;
@synthesize FechaInicioLabel;
@synthesize DiferenciaLabel;
@synthesize PendientesTable;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UsuarioLabel.text = EmpleadoSesion;
    
    FechaLabel.text = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];
    
    FechaInicioLabel.text = [NSDateFormatter localizedStringFromDate:FechaSesion dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    
    [TitleBarDashboard setTitle:EmpresaSesion];
    

    
}


- (IBAction)VentaAction:(id)sender {
}

- (IBAction)GastoAction:(id)sender {
}






#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
   // cell.textLabel.text = [[GastosToShow objectAtIndex:indexPath.row] concepto];
   // cell.textLabel.textAlignment = NSTextAlignmentLeft;
  //  cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[[GastosToShow objectAtIndex:indexPath.row]precio] floatValue]];
    
  //  cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;

}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}







- (IBAction)ProductosAction:(id)sender {
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    ProductosView = [Main instantiateViewControllerWithIdentifier:@"Productos"];
    ProductosView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ProductosView.EmpleadoSesion = EmpleadoSesion;
    ProductosView.FechaSesion = FechaSesion;
    ProductosView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:ProductosView animated:YES completion:NULL];
    
    
}

- (IBAction)ReporteAction:(id)sender {
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    ReporteView = [Main instantiateViewControllerWithIdentifier:@"Reporte"];
    ReporteView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ReporteView.EmpleadoSesion = EmpleadoSesion;
    ReporteView.FechaSesion = FechaSesion;
    ReporteView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:ReporteView animated:YES completion:NULL];
    
}

- (IBAction)HistorialAction:(id)sender {
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    HistorialView = [Main instantiateViewControllerWithIdentifier:@"Historial"];
    HistorialView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    HistorialView.EmpleadoSesion = EmpleadoSesion;
    HistorialView.FechaSesion = FechaSesion;
    HistorialView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:HistorialView animated:YES completion:NULL];
    
    
}

- (IBAction)NotasAction:(id)sender {
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    NotasView = [Main instantiateViewControllerWithIdentifier:@"Notas"];
    NotasView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    NotasView.EmpleadoSesion = EmpleadoSesion;
    NotasView.FechaSesion = FechaSesion;
    NotasView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:NotasView animated:YES completion:NULL];
    
    
    
}

- (IBAction)ClientesAction:(id)sender {
    
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    ClientesView = [Main instantiateViewControllerWithIdentifier:@"Clientes"];
    ClientesView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    ClientesView.EmpleadoSesion = EmpleadoSesion;
    ClientesView.FechaSesion = FechaSesion;
    ClientesView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:ClientesView animated:YES completion:NULL];
    
    
}

- (IBAction)PendientesAction:(id)sender {
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_Ipad" bundle:nil];
    
    PendientesView = [Main instantiateViewControllerWithIdentifier:@"Pendientes"];
    PendientesView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    PendientesView.EmpleadoSesion = EmpleadoSesion;
    PendientesView.FechaSesion = FechaSesion;
    PendientesView.EmpresaSesion = EmpresaSesion;
    [self presentViewController:PendientesView animated:YES completion:NULL];
    
    
    
    
}


- (IBAction)Atras:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:Nil];

}
@end
