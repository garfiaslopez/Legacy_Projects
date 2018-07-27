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

    [self dismissViewControllerAnimated:YES completion:nil];

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
        return [customPickerArray count];
    if (component == Tercerabanda)
        return [customPickerArray count];
    if(component == Cuartabanda)
        return [customPickerArray2 count];
    if (component == Quintabanda)
        return [customPickerArray3 count];
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
    
    if (component == 0) {
        
        UIView * myView = [self.customPickerArray objectAtIndex:row];
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
        [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        return imageView;
    }
    if (component == 1) {
        
        UIView * myView = [self.customPickerArray objectAtIndex:row];
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
        [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        return imageView;
    }
    if (component == 2) {
        
        UIView * myView = [self.customPickerArray objectAtIndex:row];
        UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
        [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        return imageView;
    }
    if (component == 3) {
        
        UIView * myView2 = [self.customPickerArray2 objectAtIndex:row];
        UIGraphicsBeginImageContextWithOptions(myView2.bounds.size, NO, 0);
        [myView2.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image2 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
        
        return imageView2;
        
    }
    if (component == 4) {
        
        UIView * myView3 = [self.customPickerArray3 objectAtIndex:row];
        UIGraphicsBeginImageContextWithOptions(myView3.bounds.size, NO, 0);
        [myView3.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * image3 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *imageView3 = [[UIImageView alloc] initWithImage:image3];
        
        return imageView3;
        
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
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:10],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    Resultado.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Tolerancia.font = [UIFont fontWithName:@"DS-Digital" size:50];
    Tension.font = [UIFont fontWithName:@"DS-Digital" size:50];
    
    
    Colorescondensador.delegate = self;
    
    
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    NSMutableArray *viewArray2 = [[NSMutableArray alloc]init];
    NSMutableArray *viewArray3 = [[NSMutableArray alloc]init];
    
    
    
    UIImage * negro = [UIImage imageNamed:@"Negro.png"];
    UIImage * marron = [UIImage imageNamed:@"Marron.png"];
    UIImage * rojo = [UIImage imageNamed:@"Rojo.png"];
    UIImage * naranja = [UIImage imageNamed:@"Naranja.png"];
    UIImage * amarillo = [UIImage imageNamed:@"Amarillo.png"];
    UIImage * verde = [UIImage imageNamed:@"Verde.png"];
    UIImage * azul = [UIImage imageNamed:@"Azul.png"];
    UIImage * violeta = [UIImage imageNamed:@"Violeta.png"];
    UIImage * gris = [UIImage imageNamed:@"Gris.png"];
    UIImage * blanco = [UIImage imageNamed:@"Blanco.png"];
  
    
    UIImageView *NegroView = [[UIImageView alloc] initWithImage: negro];
    UIImageView *MarronView = [[UIImageView alloc] initWithImage: marron];
    UIImageView *RojoView = [[UIImageView alloc] initWithImage: rojo];
    UIImageView *NaranjaView = [[UIImageView alloc] initWithImage: naranja];
    UIImageView *AmarilloView = [[UIImageView alloc] initWithImage: amarillo];
    UIImageView *VerdeView = [[UIImageView alloc] initWithImage: verde];
    UIImageView *AzulView = [[UIImageView alloc] initWithImage: azul];
    UIImageView *VioletaView = [[UIImageView alloc] initWithImage: violeta];
    UIImageView *GrisView = [[UIImageView alloc] initWithImage: gris];
    UIImageView *BlancoView = [[UIImageView alloc] initWithImage: blanco];

    
    
    [viewArray addObject:NegroView];
    [viewArray addObject:MarronView];
    [viewArray addObject:RojoView];
    [viewArray addObject:NaranjaView];
    [viewArray addObject:AmarilloView];
    [viewArray addObject:VerdeView];
    [viewArray addObject:AzulView];
    [viewArray addObject:VioletaView];
    [viewArray addObject:GrisView];
    [viewArray addObject:BlancoView];
    
    self.customPickerArray = viewArray;
    
    [viewArray2 addObject:NegroView];
    [viewArray2 addObject:MarronView];
    [viewArray2 addObject:RojoView];
    [viewArray2 addObject:VerdeView];
    [viewArray2 addObject:BlancoView];
    
    self.customPickerArray2 = viewArray2;
    
    [viewArray3 addObject:MarronView];
    [viewArray3 addObject:RojoView];
    [viewArray3 addObject:AmarilloView];
    [viewArray3 addObject:AzulView];
    
    self.customPickerArray3 = viewArray3;
    
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
