//
//  Historial.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Historial.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Venta.h"




@interface Historial ()
{
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    
    NSMutableArray *MonthsArray;
    NSMutableArray *YearsArray;
    
    NSMutableArray *AllTickets;
    
    NSMutableArray *TicketsByYear;
    NSMutableArray *TicketsByMonth;
    NSMutableArray *TicketsByDay;
    
    NSString*YearSelected;
    long int MonthSelected;
    long int DaySelected;
    
    NSInteger TicketSelected;
    
}


@end

@implementation Historial
@synthesize MainScroller;
@synthesize BackgroundImage;
@synthesize TipoBusquedaSegment;
@synthesize PickerView;
@synthesize DatePicker;
@synthesize TotalLabel;
@synthesize VentasLabel;
@synthesize DetalleVentaImageView;
@synthesize VentasTableView;
@synthesize IndexEnterprise;
@synthesize VentaScrollView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    AllTickets = [[NSMutableArray alloc]init];
    
    YearSelected = [[NSString alloc] init];
    
    TicketsByYear = [[NSMutableArray alloc]init];
    TicketsByMonth = [[NSMutableArray alloc]init];
    TicketsByDay = [[NSMutableArray alloc]init];
    
    
    //GET THE YEAR ACTUALY WE ARE:
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int YearToday  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    //Create Years Array from START APP DAY  to This year
    YearsArray = [[NSMutableArray alloc] init];
    for (int i=2013; i<=YearToday; i++) {
        [YearsArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    //CREATE THE MONTHS ARRAY:
    MonthsArray = [[NSMutableArray alloc]initWithObjects:
                   @"Enero",
                   @"Febrero",
                   @"Marzo",
                   @"Abril",
                   @"Mayo",
                   @"Junio",
                   @"Julio",
                   @"Agosto",
                   @"Septiembre",
                   @"Octubre",
                   @"Noviembre",
                   @"Diciembre",
                   nil];
    
    DatePicker.hidden = YES;

    
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [self RecargaDatos];
}



-(void)RecargaDatos
{
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];
    
    [self RecargaArreglos];
}

-(void)RecargaArreglos
{
    [AllTickets removeAllObjects];
    
    for (int i = 0; i<[[[EmpresasArray objectAtIndexedSubscript:IndexEnterprise] Empleados] count]; i++) {
        //Recorre los empleados:
        
        for (int j = 0; j<[[[[[EmpresasArray objectAtIndexedSubscript:IndexEnterprise] Empleados] objectAtIndex:i] Ventas] count]; j++) {
            //Recorre los tickets dentro de ese empleado:
            
            [AllTickets addObject:[[[[[EmpresasArray objectAtIndexedSubscript:IndexEnterprise] Empleados] objectAtIndex:i] Ventas] objectAtIndex:j]];
        }
    }
    
    NSLog(@"NUMERO DE Ventas GLOBALES: %lu",[AllTickets count]);
    
}

- (IBAction)Busqueda:(id)sender
{
    
    
    //BUSQUEDA POR AÑO:
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0)
    {
        YearSelected = [YearsArray objectAtIndex:[PickerView selectedRowInComponent:0]];
        
        NSDateFormatter *FormatoNsDate = [[NSDateFormatter alloc] init];
        [FormatoNsDate setDateFormat:@"yyyy"];  //YEAR:
        
        [TicketsByYear removeAllObjects];  // QUITA LOS ANTERIORES....
        
        for (int i=0; i<AllTickets.count; i++) {
            
            if ([YearSelected isEqual: [FormatoNsDate stringFromDate:[[AllTickets objectAtIndex:i] Fecha]]])
            {
                [TicketsByYear addObject:[AllTickets objectAtIndex:i]];
                
            }
            
        }
        
        NSLog(@"Tickets por ano: %lu",(unsigned long)TicketsByYear.count);
        
        VentasLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)TicketsByYear.count];
        TotalLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentas:TicketsByYear]];
        
    }
    
    //BUSQUEDA POR MES:
    if (TipoBusquedaSegment.selectedSegmentIndex == 1)
    {
        
        YearSelected = [YearsArray objectAtIndex:[PickerView selectedRowInComponent:0]];
        MonthSelected = [PickerView selectedRowInComponent:1] +1;
        
        NSLog(@"YearSelected: %@",YearSelected);
        NSLog(@"MonthSelected: %ld",MonthSelected);
        
        NSDateFormatter *FormatoNsDate = [[NSDateFormatter alloc] init];
        [FormatoNsDate setDateFormat:@"yyyy"];  //YEAR:
        
        NSDateFormatter *FormatNsDateMonth = [[NSDateFormatter alloc]init];
        [FormatNsDateMonth setDateFormat:@"MM"];
        
        
        ///BUSQUEDA POR AÑO:
        
        [TicketsByYear removeAllObjects];  // QUITA LOS ANTERIORES....
        
        for (int i=0; i<AllTickets.count; i++) {
            
            if ([YearSelected isEqual: [FormatoNsDate stringFromDate:[[AllTickets objectAtIndex:i] Fecha]]])
            {
                [TicketsByYear addObject:[AllTickets objectAtIndex:i]];
                
            }
            
        }
        NSLog(@"Tickets por ano: %lu",(unsigned long)TicketsByYear.count);
        
        //BUSQUEDA POR MES:
        
        [TicketsByMonth removeAllObjects];
        
        for (int i =0; i<TicketsByYear.count; i++) {
            
            
            if (MonthSelected ==[[FormatNsDateMonth stringFromDate:[[TicketsByYear objectAtIndex:i] Fecha]] integerValue])
            {
                
                [TicketsByMonth addObject:[TicketsByYear objectAtIndex:i]];
            }
            
        }
        
        NSLog(@"Tickets por mes: %lu",(unsigned long)TicketsByMonth.count);
        
        VentasLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)TicketsByMonth.count];
        TotalLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentas:TicketsByMonth]];
        
    }
    
    
    //BUSQUEDA POR DIA:
    if (TipoBusquedaSegment.selectedSegmentIndex == 2)
    {
        NSDate *FechaSelected = DatePicker.date;
        
        NSDateFormatter *FormatoNsDate = [[NSDateFormatter alloc] init];
        [FormatoNsDate setDateFormat:@"yyyy"];  //YEAR:
        
        NSDateFormatter *FormatNsDateMonth = [[NSDateFormatter alloc]init];
        [FormatNsDateMonth setDateFormat:@"MM"]; // MONTH
        
        NSDateFormatter *FormatNsDateDay = [[NSDateFormatter alloc]init];
        [FormatNsDateDay setDateFormat:@"dd"]; //DAY
        
        YearSelected = [FormatoNsDate stringFromDate:FechaSelected];
        MonthSelected = [[FormatNsDateMonth stringFromDate:FechaSelected] integerValue];
        DaySelected = [[FormatNsDateDay stringFromDate:FechaSelected] integerValue];
        
        NSLog(@"day: %ld month: %ld year: %@",DaySelected,MonthSelected,YearSelected);
        
        
        
        ///BUSQUEDA POR AÑO:
        
        [TicketsByYear removeAllObjects];  // QUITA LOS ANTERIORES....
        
        for (int i=0; i<AllTickets.count; i++) {
            
            if ([YearSelected isEqual: [FormatoNsDate stringFromDate:[[AllTickets objectAtIndex:i] Fecha]]])
            {
                [TicketsByYear addObject:[AllTickets objectAtIndex:i]];
                
            }
            
        }
        NSLog(@"Tickets por ano: %lu",(unsigned long)TicketsByYear.count);
        
        //BUSQUEDA POR MES:
        
        [TicketsByMonth removeAllObjects];
        
        for (int i =0; i<TicketsByYear.count; i++) {
            
            if (MonthSelected ==[[FormatNsDateMonth stringFromDate:[[TicketsByYear objectAtIndex:i] Fecha]] integerValue])
            {
                
                [TicketsByMonth addObject:[TicketsByYear objectAtIndex:i]];
            }
            
        }
        
        NSLog(@"Tickets por mes: %lu",(unsigned long)TicketsByMonth.count);
        
        //BUSQUEDA POR DIA:
        
        [TicketsByDay removeAllObjects];
        
        
        for (int i=0; i<TicketsByMonth.count; i++) {
            
            if (DaySelected == [[FormatNsDateDay stringFromDate:[[TicketsByMonth objectAtIndex:i] Fecha]] integerValue])
            {
                
                [TicketsByDay addObject:[TicketsByMonth objectAtIndex:i]];
                
            }
            
        }
        
        NSLog(@"Tickets por dia: %lu",(unsigned long)TicketsByDay.count);
        
        VentasLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)TicketsByDay.count];
        TotalLabel.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentas:TicketsByDay]];
    }
    
    [VentasTableView reloadData];
}

- (IBAction)Atras:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:Nil];

    
}

- (IBAction)ChangeTypeSearch:(id)sender
{
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0) {
        DatePicker.hidden = YES;
        PickerView.hidden = NO;
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1) {
        DatePicker.hidden = YES;
        PickerView.hidden = NO;
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 2) {
        DatePicker.hidden = NO;
        PickerView.hidden = YES;
    }
    
    
    [PickerView reloadAllComponents];
}


-(double)TotalVentas:(NSMutableArray *)array
{
    double total=0;
    
    for (int i =0; i<[array count]; i++) {
        total += [[array objectAtIndex:i]Total];
    }
    return total;
    
}










- (NSInteger)numberOfComponentsInPickerView: (UIPickerView*)thePickerView {
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0) {
        return 1;
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1) {
        return 2;
    }
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    if (TipoBusquedaSegment.selectedSegmentIndex == 0) {
        return [YearsArray count];
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1) {
        
        if (component == 0) {
            return [YearsArray count];
        }else if(component == 1){
            return [MonthsArray count];
        }
        
    }
    
    return 1;
}
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0) {
        return [YearsArray objectAtIndex:row];
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1) {
        
        if (component == 0) {
            return [YearsArray objectAtIndex:row];
        }else if(component == 1){
            return [MonthsArray objectAtIndex:row];
        }
        
    }
    
    return 0;
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    
    
}











////////////////////////////////////        TABLEVIEWS METHODS:


#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0)
    {
        return TicketsByYear.count;
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1)
    {
        return TicketsByMonth.count;
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 2)
    {
        return TicketsByDay.count;
    }
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    if (tableView.tag == 0) {
        
        if (TipoBusquedaSegment.selectedSegmentIndex == 0)
        {
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[TicketsByYear objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[TicketsByYear objectAtIndex:indexPath.row] Total]];
            
        }
        if (TipoBusquedaSegment.selectedSegmentIndex == 1)
        {
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[TicketsByMonth objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[TicketsByMonth objectAtIndex:indexPath.row] Total]];
            
        }
        if (TipoBusquedaSegment.selectedSegmentIndex == 2)
        {
            cell.textLabel.text = [NSDateFormatter localizedStringFromDate:[[TicketsByDay objectAtIndex:indexPath.row] Fecha] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterShortStyle];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[TicketsByDay objectAtIndex:indexPath.row] Total]];
            
        }
        
    }
    
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TicketSelected = indexPath.row;
    
    if (TipoBusquedaSegment.selectedSegmentIndex == 0)
    {
        [self UpdateScrollReport:[[TicketsByYear objectAtIndex:indexPath.row] ImagenTicket]];
        
       // [DetalleVentaImageView setImage:[[TicketsByYear objectAtIndex:indexPath.row] ImagenTicket]];
    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 1)
    {
        //[DetalleVentaImageView setImage:[[TicketsByMonth objectAtIndex:indexPath.row] ImagenTicket]];
        [self UpdateScrollReport:[[TicketsByMonth objectAtIndex:indexPath.row] ImagenTicket]];

    }
    if (TipoBusquedaSegment.selectedSegmentIndex == 2)
    {
       // [DetalleVentaImageView setImage:[[TicketsByDay objectAtIndex:indexPath.row] ImagenTicket]];
        [self UpdateScrollReport:[[TicketsByDay objectAtIndex:indexPath.row] ImagenTicket]];

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
