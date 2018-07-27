//
//  CondensadoresNumeros.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "CondensadoresNumeros.h"

@interface CondensadoresNumeros ()

@end

@implementation CondensadoresNumeros
@synthesize Valorentrada;
@synthesize NumeroyLetra;
@synthesize marca;
@synthesize Letra;
@synthesize Resultado;
@synthesize Resultadomicro;
@synthesize Resultadonano;
@synthesize Tolerancia;
@synthesize Voltaje;
@synthesize tolerancialabel;
@synthesize voltajelabel;
@synthesize marcalabel;
@synthesize picolabel;
@synthesize nanolabel;
@synthesize microlabel;
@synthesize TituloNav;
@synthesize Scroller;


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:1];
    
    [UIView commitAnimations];
    
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationDuration:1];
    
    [banner setAlpha:0];
    
    [UIView commitAnimations];
    
}



-(IBAction)inicio:(id)sender{
    
    [Valorentrada resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(IBAction)instrucciones:(id)sender{
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:nil message:@"Introduce el numero que viene enfrente del capacitor cerámico en el cuadro de texto, si tu capacitor ceramico trae numeros y letras adicionales tambien introducelas, sino deja asi los demas recuadros, enseguida presiona 'calcular'." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
    
}


-(IBAction)Calcular:(id)sender{
    
    double resultadomicro;
    double tempresultmicro;
    int valor = 0;
    int numero1 = 0;
    int numero2 = 0;
    int numero3 = 0;
    int resultado = 0;
    int temp = 0;
    int temp1 = 0;
    int temp2 = 0;
    NSString *Numero1y2;
    int Numero1y2ent = 0;
    int numeroceros;
    
    valor = [Valorentrada.text intValue];
    
    numero1 = valor/100;
    
    temp = numero1*100;
    temp1 = valor-temp;
    
    numero2 = temp1/10;
    
    temp2 = temp + numero2*10;
    
    numero3 = valor - temp2;
    
    
    
    NSLog(@"%d",numero1);
    NSLog(@"%d",numero2);
    NSLog(@"%d",numero3);
    
    numeroceros = numero3;
    
    switch (numero3) {
        case 0:
            numero3=0;
            break;
        case 1:
            numero3 = 10;
            break;
        case 2:
            numero3 = 100;
            break;
        case 3:
            numero3 = 1000;
            break;
        case 4:
            numero3 = 10000;
            break;
        case 5:
            numero3 = 100000;
            break;
        case 6:
            numero3 = 1000000;
            break;
        case 7:
            numero3 = 10000000;
            break;
        case 8:
            numero3 = 100000000;
            break;
        case 9:
            numero3 = 1000000000;
            break;
            
        default:
            break;
    }
    
    
    Numero1y2 = [[NSString alloc]initWithFormat:@"%d%d",numero1,numero2];
    Numero1y2ent = [Numero1y2 integerValue];
    resultado = Numero1y2ent * numero3;
    tempresultmicro = resultado;
    resultadomicro = tempresultmicro/1000000;
    

    

    
    
        if (numeroceros == 9) {        //Soluciona el error en el tercer numero sea 9;
            Resultado.text = [[NSString alloc]initWithFormat:@"%d000000000",Numero1y2ent];
            Resultadonano.text = [[NSString alloc]initWithFormat:@"%d000000",Numero1y2ent];
            Resultadomicro.text = [[NSString alloc]initWithFormat:@"%d000",Numero1y2ent];
        
        }
   
        if (numeroceros < 9) {
            
            Resultado.text = [[NSString alloc]initWithFormat:@"%d",resultado];
            Resultadonano.text = [[NSString alloc]initWithFormat:@"%d",resultado/1000];
            Resultadomicro.text = [[NSString alloc]initWithFormat:@"%.3lf",resultadomicro];
        }
    
    
    
    
    
    
    
    switch (Letra.selectedSegmentIndex) {
        case 0:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"100%%"];
            break;
        case 1:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"200%%"];
            break;
        case 2:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"300%%"];
            break;
        case 3:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"500%%"];
            break;
        case 4:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"1000%%"];
            break;
        case 5:
            Tolerancia.text = [[NSString alloc]initWithFormat:@"2000%%"];
            break;            
        default:
            break;
    }
    
    switch (NumeroyLetra.selectedSegmentIndex) {
        case 0:
            Voltaje.text = [[NSString alloc]initWithFormat:@"50V"];
            break;
        case 1:
            Voltaje.text = [[NSString alloc]initWithFormat:@"100V"];
            break;
        case 2:
            Voltaje.text = [[NSString alloc]initWithFormat:@"150V"];
            break;
        case 3:
            Voltaje.text = [[NSString alloc]initWithFormat:@"200V"];
            break;
        case 4:
            Voltaje.text = [[NSString alloc]initWithFormat:@"250V"];
            break;
        case 5:
            Voltaje.text = [[NSString alloc]initWithFormat:@"400V"];
            break;
        case 6:
            Voltaje.text = [[NSString alloc]initWithFormat:@"630V"];
            break;
        default:
            break;
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
    
    
    Valorentrada.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    Resultado.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Resultadonano.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Resultadomicro.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    
    Voltaje.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Tolerancia.font = [UIFont fontWithName:@"DS-Digital" size:40];
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:10],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
}


- (void)keyboardDidShow:(NSNotification *)notification {
        
        if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
            
            [Scroller setScrollEnabled:YES];
            self.Scroller.contentSize=CGSizeMake(320,700);
        }
        else{
            
            self.Scroller.contentSize=CGSizeMake(320,800);
            
        }
}
    
-(void)keyboardDidHide:(NSNotification *)notification{
        
        
        if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
            
            [self.Scroller setContentOffset:CGPointZero animated:YES];
            
            [Scroller setScrollEnabled:NO];
            
        }
        
        else{
            
            self.Scroller.contentSize=CGSizeMake(320,592);
            [self.Scroller setContentOffset:CGPointZero animated:YES];
        }
        
}



-(void)dismissKeyboard {
    
    [Valorentrada resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
