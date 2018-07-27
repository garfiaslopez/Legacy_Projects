//
//  CalculadoraRes6.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 29/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "CalculadoraRes6.h"
#import "CalculadoraRes.h"
#import "CalculadoraRes5.h"
#import "VistaColoresRes.h"

@interface CalculadoraRes6 ()

@end

@implementation CalculadoraRes6

@synthesize bandas;
@synthesize labelresultado;
@synthesize labelresultadoK;
@synthesize labelresultadoM;
@synthesize toleranciaresultado;
@synthesize coeficienteresultado;
@synthesize templabel;
@synthesize tolerancialabel;
@synthesize titulo;

double resultado;
double resultadoK;
double resultadoM;

@synthesize customPickerArray;
@synthesize customPickerArray2;
@synthesize customPickerArray3;
@synthesize customPickerArray4;
@synthesize customPickerArray5;
@synthesize customPickerArray6;
@synthesize TituloNav;
@synthesize Scroller;

-(IBAction)instrucciones:(id)sender{

    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Selecciona los colores de tu resistencia en las barras de colores y automaticamente te calculara su valor." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
    

}

-(IBAction)inicio:(id)sender{
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
}


-(IBAction)numerobandas:(id)sender{
    
    if (bandas.selectedSegmentIndex == 0) {
        
        cuatrobandas = [self.storyboard instantiateViewControllerWithIdentifier:@"cuatrobandas"];
        
        cuatrobandas.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:cuatrobandas animated:YES completion:NULL];
        
        
        
    }
    
    if (bandas.selectedSegmentIndex == 1){
        
        cincobandas = [self.storyboard instantiateViewControllerWithIdentifier:@"cincobandas"];
        
        cincobandas.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:cincobandas animated:YES completion:NULL];
        
    }

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
    return 6;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component == Primbanda)
        return [customPickerArray count];
    if(component == Segubanda)
        return [customPickerArray2 count];
    if (component == tercbanda)
        return [customPickerArray3 count];
    if(component == cuartabanda)
        return [customPickerArray4 count];
    if (component == quintabanda)
        return [customPickerArray5 count];
    if (component == sextabanda)
        return [customPickerArray6 count];
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == Primbanda)
        return [customPickerArray objectAtIndex:row];
    if(component == Segubanda)
        return [customPickerArray2 objectAtIndex:row];
    if (component == tercbanda)
        return [customPickerArray3 objectAtIndex:row];
    if (component == cuartabanda)
        return [customPickerArray4 objectAtIndex:row];
    if (component == quintabanda)
        return [customPickerArray5 objectAtIndex:row];
    if (component == sextabanda)
        return [customPickerArray6 objectAtIndex:row];
    return 0;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Row is:%d Component is:%d",row,component);
    
    int a;//entero de componente 1
    int b;//entero de componente 2
    int c;
    double d = 0.0;//entero de componente 3
    int e; //valor de componente 1 y 2
    NSString *a1; //cadena de a y b!
    
    a = [pickerView selectedRowInComponent:0]; //asigno a las variables segun el numero!!
    b = [pickerView selectedRowInComponent:1];
    c = [pickerView selectedRowInComponent:2];
    
    switch ([pickerView selectedRowInComponent:3]) { //asi se le asignan valores propios!
        case 0:
            d=1;
            break;
        case 1:
            d=10;
            break;
        case 2:
            d=100;
            break;
        case 3:
            d=1000;
            break;
        case 4:
            d=10000;
            break;
        case 5:
            d=100000;
            break;
        case 6:
            d=1000000;
            break;
        case 7:
            d=10000000;
            break;
        case 8:
            d=100000000;
            break;
        case 9:
            d=1000000000;
            break;
        default:
            break;
    }
    a1 = [[NSString alloc]initWithFormat:@"%d%d%d",a,b,c]; //junto las variables a y b
    e= [a1 intValue];    //guardo en la variable
    
    resultado = e*d; //multiplica ab por el valor de c
    resultadoK = resultado/1000;
    resultadoM = resultadoK/1000;
    
    
    labelresultado.text = [[NSString alloc]initWithFormat:@"%.0f",resultado];
    
    labelresultadoK.text = [[NSString alloc]initWithFormat:@"%.2f",resultadoK];
    
    labelresultadoM.text = [[NSString alloc]initWithFormat:@"%.2f",resultadoM];
    
    
    switch ([pickerView selectedRowInComponent:4]) {
        case 0:
            toleranciaresultado.text = [[NSString alloc]initWithFormat:@"±1%%"];
            break;
        case 1:
            toleranciaresultado.text = [[NSString alloc]initWithFormat:@"±2%%"];
            break;
        case 2:
            toleranciaresultado.text = [[NSString alloc]initWithFormat:@"±5%%"];
            break;
        case 3:
            toleranciaresultado.text = [[NSString alloc]initWithFormat:@"±10%%"];
            break;
            
        default:
            break;
    }
    
    
    switch ([pickerView selectedRowInComponent:5]) {
        case 0:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"1"];
            break;
        case 1:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"5"];
            break;
        case 2:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"10"];
            break;
        case 3:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"15"];
            break;
        case 4:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"25"];
            break;
        case 5:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"50"];
            break;
        case 6:
            coeficienteresultado.text = [[NSString alloc]initWithFormat:@"100"];
            break;
        default:
            break;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (component == Primbanda) {
        return [customPickerArray objectAtIndex:row];
    }
    
    if (component == Segubanda) {
        return [customPickerArray2 objectAtIndex:row];
    }
    
    if (component == tercbanda) {
        return [customPickerArray3 objectAtIndex:row];
    }
    
    if (component == cuartabanda) {
        return [customPickerArray4 objectAtIndex:row];
    }
    
    if (component == quintabanda) {
        return [customPickerArray5 objectAtIndex:row];
    }
    if (component == sextabanda) {
        return [customPickerArray6 objectAtIndex:row];
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
    
    labelresultado.font = [UIFont fontWithName:@"DS-Digital" size: 60];
    labelresultadoK.font = [UIFont fontWithName:@"DS-Digital" size:60];
    labelresultadoM.font = [UIFont fontWithName:@"DS-Digital" size:60];
    tolerancialabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    //titulo.font = [UIFont fontWithName:@"GENERATION" size:50];
    toleranciaresultado.font = [UIFont fontWithName:@"DS-Digital" size: 40];
    templabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    coeficienteresultado.font = [UIFont fontWithName:@"DS-Digital" size:40];

    UIFont *font = [UIFont fontWithName:@"Coming Soon" size:15];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:UITextAttributeFont];
    [bandas setTitleTextAttributes:attributes
                          forState:UIControlStateNormal];
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    resistencias.delegate = self;
    
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    NSMutableArray *viewArray2 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray3 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray4 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray5 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray6 = [[NSMutableArray alloc]init];
    
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
    
    VistaColoresRes *naranja4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    naranja4.image = [UIImage imageNamed:@"Naranja.png"];
    [viewArray4 addObject:naranja4];
    
    VistaColoresRes * amarillo4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo4.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray4 addObject:amarillo4];
    
    VistaColoresRes *verde4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    verde4.image = [UIImage imageNamed:@"Verde.png"];
    [viewArray4 addObject:verde4];
    
    VistaColoresRes *azul4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul4.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray4 addObject:azul4];
    
    VistaColoresRes *violeta4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    violeta4.image = [UIImage imageNamed:@"Violeta.png"];
    [viewArray4 addObject:violeta4];
    
    VistaColoresRes *gris4 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    gris4.image = [UIImage imageNamed:@"Gris.png"];
    [viewArray4 addObject:gris4];
    
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
    
    VistaColoresRes *oro = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    oro.image = [UIImage imageNamed:@"Oro.png"];
    [viewArray5 addObject:oro];
    
    VistaColoresRes *plata = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    plata.image = [UIImage imageNamed:@"Plateado.png"];
    [viewArray5 addObject:plata];
    
    self.customPickerArray5 = viewArray5;
    
    
    VistaColoresRes *blanco6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    blanco6.image = [UIImage imageNamed:@"Blanco.png"];
    [viewArray6 addObject:blanco6];
    
    VistaColoresRes *violeta6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    violeta6.image = [UIImage imageNamed:@"Violeta.png"];
    [viewArray6 addObject:violeta6];
    
    VistaColoresRes *azul6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    azul6.image = [UIImage imageNamed:@"Azul.png"];
    [viewArray6 addObject:azul6];
    
    VistaColoresRes *naranja6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    naranja6.image = [UIImage imageNamed:@"Naranja.png"];
    [viewArray6 addObject:naranja6];
    
    VistaColoresRes *amarillo6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    amarillo6.image = [UIImage imageNamed:@"Amarillo.png"];
    [viewArray6 addObject:amarillo6];
    
    VistaColoresRes *rojo6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    rojo6.image = [UIImage imageNamed:@"Rojo.png"];
    [viewArray6 addObject:rojo6];
    
    VistaColoresRes *marron6 = [[VistaColoresRes alloc]initWithFrame:CGRectZero];
    marron6.image = [UIImage imageNamed:@"Marron.png"];
    [viewArray6 addObject:marron6];
    
    self.customPickerArray6 = viewArray6;
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
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
