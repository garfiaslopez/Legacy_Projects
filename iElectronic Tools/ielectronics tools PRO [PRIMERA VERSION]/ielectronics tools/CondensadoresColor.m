//
//  CondensadoresColor.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "CondensadoresColor.h"
#import "VistaColoresRes.h"

@interface CondensadoresColor ()

@end

@implementation CondensadoresColor
@synthesize customPickerArray;
@synthesize customPickerArray2;
@synthesize customPickerArray3;
@synthesize customPickerArray4;
@synthesize customPickerArray5;
@synthesize Resultado;
@synthesize Colorescondensador;
@synthesize Tolerancia;
@synthesize Tension;
@synthesize tolerancialabel;
@synthesize tensionlabel;
@synthesize titulo;
@synthesize unidadlabel;
@synthesize TituloNav;
@synthesize ResTituloLabel;
@synthesize Scroller;
double resultado;
double resultadoK;
double resultadoM;

-(IBAction)inicio:(id)sender{

    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

}


-(IBAction)instrucciones:(id)sender{
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Selecciona los colores de tu condensador cerámico en las barras de colores y automaticamente se calculara su valor." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component == Primerabanda)
        return [customPickerArray count];
    if(component == Segundabanda)
        return [customPickerArray2 count];
    if (component == Tercerabanda)
        return [customPickerArray3 count];
    if(component == Cuartabanda)
        return [customPickerArray4 count];
    if (component == Quintabanda)
        return [customPickerArray5 count];
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == Primerabanda)
        return [customPickerArray objectAtIndex:row];
    if(component == Segundabanda)
        return [customPickerArray2 objectAtIndex:row];
    if (component == Tercerabanda)
        return [customPickerArray3 objectAtIndex:row];
    if (component == Cuartabanda)
        return [customPickerArray4 objectAtIndex:row];
    if (component == Quintabanda)
        return [customPickerArray5 objectAtIndex:row];
    return 0;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Row is:%d Component is:%d",row,component);
    
    int a;//entero de componente 1
    int b;//entero de componente 2
    double c;//entero de componente 3
    int d; //valor de componente 1 y 2
    NSString *a1; //cadena de a y b!
    
    a = [pickerView selectedRowInComponent:0]; //asigno a las variables segun el numero!!
    b = [pickerView selectedRowInComponent:1];
    
    switch ([pickerView selectedRowInComponent:2]) { //asi se le asignan valores propios!
        case 0:
            c=1;
            break;
        case 1:
            c=10;
            break;
        case 2:
            c=100;
            break;
        case 3:
            c=1000;
            break;
        case 4:
            c=10000;
            break;
        case 5:
            c=100000;
            break;
        case 6:
            c=1000000;
            break;
        case 7:
            c=10000000;
            break;
        case 8:
            c=100000000;
            break;
        case 9:
            c=1000000000;
            break;
            
            break;
    }
    a1 = [[NSString alloc]initWithFormat:@"%d%d",a,b]; //junto las variables a y b
    d= [a1 intValue];    //guardo en la variable
    
    resultado = d*c; //multiplica ab por el valor de c
    
    
    Resultado.text = [[NSString alloc]initWithFormat:@"%.0f",resultado];
    
    switch ([pickerView selectedRowInComponent:3]) {
        case 0:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"±20%%"];
            break;
        case 1:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"±1%%"];
            break;
        case 2:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"±2%%"];
            break;
        case 3:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"±5%%"];
            break;
        case 4:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"±10%%"];
            break;
        default:
            break;
            
    
    }
    
    switch ([pickerView selectedRowInComponent:4]) {
        case 0:
            Tension.text = [[NSString alloc]initWithFormat:@"100V"];
            break;
        case 1:
            Tension.text = [[NSString alloc]initWithFormat:@"250V"];
            break;
        case 2:
            Tension.text = [[NSString alloc]initWithFormat:@"400V"];
            break;
        case 3:
            Tension.text = [[NSString alloc]initWithFormat:@"630V"];
            break;
        default:
            break;
    }

    
    
    
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == Primerabanda) {
        return [customPickerArray objectAtIndex:row];
    }
    
    if (component == Segundabanda) {
        return [customPickerArray2 objectAtIndex:row];
    }
    
    if (component == Tercerabanda) {
        return [customPickerArray3 objectAtIndex:row];
    }
    
    if (component == Cuartabanda) {
        return [customPickerArray4 objectAtIndex:row];
    }
    
    if (component == Quintabanda) {
        return [customPickerArray5 objectAtIndex:row];
    }
    
    return 0;
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:20]}];
    
    Resultado.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Tolerancia.font = [UIFont fontWithName:@"DS-Digital" size:50];
    Tension.font = [UIFont fontWithName:@"DS-Digital" size:50];
    
    tensionlabel.font = [UIFont fontWithName:@"Coming Soon" size:35];
    tolerancialabel.font = [UIFont fontWithName:@"Coming Soon" size:35];
    ResTituloLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    Colorescondensador.delegate = self;
    
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    NSMutableArray *viewArray2 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray3 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray4 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray5 = [[NSMutableArray alloc]init];
    
    VistaColoresRes *negro = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    negro.image = [UIImage imageNamed:@"Negro.png"];
    [viewArray addObject:negro];
    
    VistaColoresRes *marron = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray addObject:marron];
    
    VistaColoresRes * rojo = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray addObject:rojo];
    
    VistaColoresRes * naranja = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    naranja.image = [UIImage imageNamed:@"Naranja.png"];
    [viewArray addObject:naranja];
    
    VistaColoresRes * amarillo = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray addObject:amarillo];
    
    VistaColoresRes * verde = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    verde.image = [UIImage imageNamed:@"Verde.png"];
    [viewArray addObject:verde];
    
    VistaColoresRes * azul = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray addObject:azul];
    
    VistaColoresRes * violeta = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    violeta.image = [UIImage imageNamed:@"Violeta.png"];
    [viewArray addObject:violeta];
    
    VistaColoresRes * gris = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    gris.image = [UIImage imageNamed:@"Gris.png"];
    [viewArray addObject:gris];
    
    VistaColoresRes * blanco = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    blanco.image = [UIImage imageNamed:@"Blanco.png"];
    [viewArray addObject:blanco];
    
    self.customPickerArray = viewArray;
    
    
    VistaColoresRes *negro2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    negro2.image = [UIImage imageNamed:@"Negro.png"];
    [viewArray2 addObject:negro2];
    
    VistaColoresRes *marron2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron2.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray2 addObject:marron2];
    
    VistaColoresRes *rojo2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo2.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray2 addObject:rojo2];
    
    VistaColoresRes *naranja2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    naranja2.image = [UIImage imageNamed:@"Naranja.png"];
    [viewArray2 addObject:naranja2];
    
    VistaColoresRes * amarillo2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo2.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray2 addObject:amarillo2];
    
    VistaColoresRes *verde2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    verde2.image = [UIImage imageNamed:@"Verde.png"];
    [viewArray2 addObject:verde2];
    
    VistaColoresRes *azul2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul2.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray2 addObject:azul2];
    
    VistaColoresRes *violeta2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    violeta2.image = [UIImage imageNamed:@"Violeta.png"];
    [viewArray2 addObject:violeta2];
    
    VistaColoresRes *gris2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    gris2.image = [UIImage imageNamed:@"Gris.png"];
    [viewArray2 addObject:gris2];
    
    VistaColoresRes *blanco2 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    blanco2.image = [UIImage imageNamed:@"Blanco.png"];
    [viewArray2 addObject:blanco2];
    
    self.customPickerArray2 = viewArray2;
    
    VistaColoresRes *negro3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    negro3.image = [UIImage imageNamed:@"Negro.png"];
    [viewArray3 addObject:negro3];
    
    VistaColoresRes *marron3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron3.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray3 addObject:marron3];
    
    VistaColoresRes *rojo3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo3.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray3 addObject:rojo3];
    
    VistaColoresRes *naranja3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    naranja3.image = [UIImage imageNamed:@"Naranja.png"];
    [viewArray3 addObject:naranja3];
    
    VistaColoresRes * amarillo3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo3.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray3 addObject:amarillo3];
    
    VistaColoresRes *verde3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    verde3.image = [UIImage imageNamed:@"Verde.png"];
    [viewArray3 addObject:verde3];
    
    VistaColoresRes *azul3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul3.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray3 addObject:azul3];
    
    VistaColoresRes *violeta3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    violeta3.image = [UIImage imageNamed:@"Violeta.png"];
    [viewArray3 addObject:violeta3];
    
    VistaColoresRes *gris3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    gris3.image = [UIImage imageNamed:@"Gris.png"];
    [viewArray3 addObject:gris3];
    
    VistaColoresRes *blanco3 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    blanco3.image = [UIImage imageNamed:@"Blanco.png"];
    [viewArray3 addObject:blanco3];
    
    self.customPickerArray3 = viewArray3;
    
    
    VistaColoresRes *negro4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    negro4.image = [UIImage imageNamed:@"Negro.png"];
    [viewArray4 addObject:negro4];
    
    VistaColoresRes *marron4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron4.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray4 addObject:marron4];
    
    VistaColoresRes *rojo4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo4.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray4 addObject:rojo4];
    
        
    VistaColoresRes *verde4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    verde4.image = [UIImage imageNamed:@"Verde.png"];
    [viewArray4 addObject:verde4];
    
    
    VistaColoresRes *blanco4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    blanco4.image = [UIImage imageNamed:@"Blanco.png"];
    [viewArray4 addObject:blanco4];
    
    self.customPickerArray4 = viewArray4;
    
    
    VistaColoresRes *marron5 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron5.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray5 addObject:marron5];
    
    VistaColoresRes *rojo5 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo5.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray5 addObject:rojo5];
    
    VistaColoresRes *amarillo5 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo5.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray5 addObject:amarillo5];
    
    VistaColoresRes *azul5 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul5.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray5 addObject:azul5];
    
    self.customPickerArray5 = viewArray5;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    
    return NO;
}


- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setResTituloLabel:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
