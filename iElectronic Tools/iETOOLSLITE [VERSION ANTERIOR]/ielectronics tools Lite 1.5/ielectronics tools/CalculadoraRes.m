//
//  CalculadoraRes.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 29/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "CalculadoraRes.h"
#import "Herramientas.h"

@interface CalculadoraRes (){

    int banditas;

}

@end

@implementation CalculadoraRes
@synthesize Scroller;
@synthesize customPickerArray;
@synthesize customPickerArray2;
@synthesize customPickerArray3;
@synthesize bandas;
@synthesize labelresultado;
@synthesize labelresultadoK;
@synthesize labelresultadoM;
@synthesize toleranciaresultado;
@synthesize coeficienteresultado;
@synthesize titulo;
@synthesize tolerancialabel;
@synthesize TituloNav;
double resultado;
double resultadoK;
double resultadoM;


-(IBAction)inicio:(id)sender{
   
    [self dismissViewControllerAnimated:YES completion:nil];
/*
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    */

}

-(IBAction)numerobandas:(id)sender{
    
    if (bandas.selectedSegmentIndex == 0) {
        
        banditas = 4;
        
        [resistencias reloadAllComponents];
        
    }

    if (bandas.selectedSegmentIndex == 1) {
        
        
        banditas = 5;
        
        [resistencias reloadAllComponents];

    }
    
    if (bandas.selectedSegmentIndex == 2){
        
        banditas = 6;
        
        [resistencias reloadAllComponents];
    }


}


-(IBAction)instrucciones:(id)sender{
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Selecciona los colores de tu resistencia en las barras de colores y automaticamente te calculara su valor." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
    
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return banditas;

}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    if (banditas == 4) {
        if(component == 0)
            return [customPickerArray count];
        if(component == 1)
            return [customPickerArray count];
        if (component == 2)
            return [customPickerArray count];
        if (component == 3)
            return [customPickerArray2 count];
    }
    if (banditas == 5) {
        
        if(component == 0)
            return [customPickerArray count];
        if(component == 1)
            return [customPickerArray count];
        if (component == 2)
            return [customPickerArray count];
        if(component == 3)
            return [customPickerArray count];
        if (component == 4)
            return [customPickerArray2 count];
    }
    if (banditas == 6) {
        if(component == 0)
            return [customPickerArray count];
        if(component == 1)
            return [customPickerArray count];
        if (component == 2)
            return [customPickerArray count];
        if(component == 3)
            return [customPickerArray count];
        if (component == 4)
            return [customPickerArray2 count];
        if (component == 5)
            return [customPickerArray3 count];
    }
    
    return 0;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (banditas == 4) {
        NSLog(@"Row is:%d Component is:%d",row,component);
        
        int a;//entero de componente 1
        int b;//entero de componente 2
        double c = 0.0;//entero de componente 3
        int d; //valor de componente 1 y 2
        NSString *a1; //cadena de a y b!
        
        a = [pickerView selectedRowInComponent:0]; //asigno a las variables segun el numero!!
        b = [pickerView selectedRowInComponent:1];
        
        if ([pickerView selectedRowInComponent:2] == 0) {
            c=1;
        }
        if ([pickerView selectedRowInComponent:2] == 1) {
            c=10;
        }
        if ([pickerView selectedRowInComponent:2] == 2) {
            c=100;
        }
        if ([pickerView selectedRowInComponent:2] == 3) {
            c=1000;
        }
        if ([pickerView selectedRowInComponent:2] == 4) {
            c=10000;
        }
        if ([pickerView selectedRowInComponent:2] == 5) {
            c=100000;
        }
        if ([pickerView selectedRowInComponent:2] == 6) {
            c=1000000;
        }
        if ([pickerView selectedRowInComponent:2] == 7) {
            c=10000000;
        }
        if ([pickerView selectedRowInComponent:2] == 8) {
            c=100000000;
        }
        if ([pickerView selectedRowInComponent:2] == 9) {
            c=1000000000;
        }
        
        
        a1 = [[NSString alloc]initWithFormat:@"%d%d",a,b]; //junto las variables a y b
        d= [a1 intValue];    //guardo en la variable
        
        resultado = d*c; //multiplica ab por el valor de c
        resultadoK = resultado/1000;
        resultadoM = resultadoK/1000;
        
        
        labelresultado.text = [[NSString alloc]initWithFormat:@"%.0f",resultado];
        
        labelresultadoK.text = [[NSString alloc]initWithFormat:@"%.2f",resultadoK];
        
        labelresultadoM.text = [[NSString alloc]initWithFormat:@"%.2f",resultadoM];
        
        switch ([pickerView selectedRowInComponent:3]) {
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

    }
    
    
    if (banditas == 5) {
        
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
    }
    
    if (banditas == 6) {
        
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
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    if (banditas == 4) {
        if (component == 0) {
            // self.myImages is an array of UIImageView objects
            UIView * myView = [self.customPickerArray objectAtIndex:row];
            // first convert to a UIImage
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // then convert back to a UIImageView and return it
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            return imageView;
        }
        if (component == 1) {
            
            // self.myImages is an array of UIImageView objects
            UIView * myView = [self.customPickerArray objectAtIndex:row];
            // first convert to a UIImage
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // then convert back to a UIImageView and return it
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            return imageView;
        }
        if (component == 2) {
            
            // self.myImages is an array of UIImageView objects
            UIView * myView = [self.customPickerArray objectAtIndex:row];
            // first convert to a UIImage
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // then convert back to a UIImageView and return it
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
    }
    
    if (banditas == 5) {
        
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
            
            UIView * myView = [self.customPickerArray objectAtIndex:row];
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            return imageView;
            
        }
        if (component == 4) {
            
            UIView * myView2 = [self.customPickerArray2 objectAtIndex:row];
            UIGraphicsBeginImageContextWithOptions(myView2.bounds.size, NO, 0);
            [myView2.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image2 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
            
            return imageView2;
            
        }
    }

    if (banditas == 6) {
        
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
            
            UIView * myView = [self.customPickerArray objectAtIndex:row];
            UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
            [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            
            return imageView;
            
        }
        if (component == 4) {
            
            UIView * myView2 = [self.customPickerArray2 objectAtIndex:row];
            UIGraphicsBeginImageContextWithOptions(myView2.bounds.size, NO, 0);
            [myView2.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image2 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
            
            return imageView2;
            
        }
        if (component == 5) {
            
            UIView * myView3 = [self.customPickerArray3 objectAtIndex:row];
            UIGraphicsBeginImageContextWithOptions(myView3.bounds.size, NO, 0);
            [myView3.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage * image3 = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageView *imageView3 = [[UIImageView alloc] initWithImage:image3];
            
            return imageView3;
        }
        
    }
    return 0;

}
  
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
                                          UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                          UITextAttributeTextColor:[UIColor whiteColor]
                                          }];
    
    labelresultado.font = [UIFont fontWithName:@"Ds-Digital" size: 60];
    labelresultadoK.font = [UIFont fontWithName:@"Ds-Digital" size:60];
    labelresultadoM.font = [UIFont fontWithName:@"Ds-Digital" size:60];
    toleranciaresultado.font = [UIFont fontWithName:@"Ds-Digital" size: 40];
    coeficienteresultado.font = [UIFont fontWithName:@"Ds-Digital" size: 40];

    
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
    UIImage * oro = [UIImage imageNamed:@"Oro.png"];
    UIImage * plateado = [UIImage imageNamed:@"Plateado.png"];
    
    
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
    UIImageView *OroView = [[UIImageView alloc] initWithImage: oro];
    UIImageView *PlateadoView = [[UIImageView alloc] initWithImage: plateado];
    
    
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
    
    [viewArray2 addObject:MarronView];
    [viewArray2 addObject:RojoView];
    [viewArray2 addObject:OroView];
    [viewArray2 addObject:PlateadoView];
    
    self.customPickerArray2 = viewArray2;
    
    [viewArray3 addObject:BlancoView];
    [viewArray3 addObject:VioletaView];
    [viewArray3 addObject:AzulView];
    [viewArray3 addObject:NaranjaView];
    [viewArray3 addObject:AmarilloView];
    [viewArray3 addObject:RojoView];
    [viewArray3 addObject:MarronView];
    
    self.customPickerArray3 = viewArray3;
    
    resistencias.delegate = self;
    banditas = 4;

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
    [self setScroller:nil];
    [self setTitulo:nil];
    [super viewDidUnload];
}
@end
