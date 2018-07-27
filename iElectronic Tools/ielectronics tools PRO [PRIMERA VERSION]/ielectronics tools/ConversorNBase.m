//
//  ConversorNBase.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 12/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "ConversorNBase.h"

@interface ConversorNBase ()

@end

@implementation ConversorNBase

@synthesize Valorfield;
@synthesize Baseinicial;
@synthesize BaseFinal;
@synthesize Resultadolabel;
@synthesize titulo1;
@synthesize titulo2;
@synthesize TituloNav;
@synthesize Scroller;
@synthesize ResTituloLabel;



-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Introduce el valor que quieres convertir en el cuadro de texto 'numero', en el cuadro de texto 'Base X' coloca la base en la que se encuentra dicho valor y en el cuadro de texto 'Base Y' coloca la base a la cual quieras convertir ese valor, enseguida presiona en 'calcular'. " delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];

}

-(IBAction)Calcular:(id)sender{
    
    if ([BaseFinal.text integerValue] == 0 || [Baseinicial.text integerValue] == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error:" message:@"Rellena todos los cuadros, No dejes uno sin rellenar."delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    }
    
    if ([BaseFinal.text integerValue] != 0 || [Baseinicial.text integerValue] != 0) {
        
    
    NSString *valor;
    int tamanocadena=0,exponente=0;
    int temp=0,temp2=0,temp3=0,temp4=0;
    char caracter;
    int x = 0;
    int BaseInicial;
    
    valor = Valorfield.text;
    BaseInicial = [Baseinicial.text integerValue];
    
    tamanocadena = valor.length;
    
    exponente = tamanocadena - 1;
    
    while (x<tamanocadena) {
        
        
        caracter = [valor characterAtIndex:x];
        
        if (caracter == 'A'||caracter == 'a') {
            temp = 10;
        }
        if (caracter == 'B'||caracter == 'b') {
            temp = 11;
        }
        if (caracter == 'C'||caracter == 'c') {
            temp = 12;
        }
        if (caracter == 'D'||caracter == 'd') {
            temp = 13;
        }
        if (caracter == 'E'||caracter == 'e') {
            temp = 14;
        }
        if (caracter == 'F'||caracter == 'f') {
            temp = 15;
        }
        if (caracter == '0') {
            temp = 0;
        }
        if (caracter == '1') {
            temp = 1;
        }
        if (caracter == '2') {
            temp = 2;
        }
        if (caracter == '3') {
            temp = 3;
        }
        if (caracter == '4') {
            temp = 4;
        }
        if (caracter == '5') {
            temp = 5;
        }
        if (caracter == '6') {
            temp = 6;
        }
        if (caracter == '7') {
            temp = 7;
        }
        if (caracter == '8') {
            temp = 8;
        }
        if (caracter == '9') {
            temp = 9;
        }
                
        temp2 = pow(BaseInicial, exponente);
        
        exponente--;
        
        temp3 = temp * temp2;
        
        temp4 = temp4 + temp3;
                
        x++;
        
    }
    
    NSLog(@"ELRESULTADODELACONVERSIONINICIALES:%d",temp4);


    NSString *resultado;

    NSMutableString *arreglo;

    arreglo = [[NSMutableString alloc]init];


    int binario[32],numero,i,j=0,N,base;

    numero = temp4;

    base = [BaseFinal.text integerValue];
        
    while (numero != 0) {
    
        i = numero%base;
        numero = numero/base;
        j++;
    
        binario[j] = i;
    }

    for (N=j; N>=1; N--) {
        
        resultado = [[NSString alloc]initWithFormat:@"%d",binario[N]];
        
        
        if ([resultado isEqualToString:@"10"]) {
            resultado = [[NSString alloc]initWithFormat:@"A"];
        }
        if ([resultado isEqualToString:@"11"]) {
            resultado = [[NSString alloc]initWithFormat:@"B"];
        }
        if ([resultado isEqualToString:@"12"]) {
            resultado = [[NSString alloc]initWithFormat:@"C"];
        }
        if ([resultado isEqualToString:@"13"]) {
            resultado = [[NSString alloc]initWithFormat:@"D"];
        }
        if ([resultado isEqualToString:@"14"]) {
            resultado = [[NSString alloc]initWithFormat:@"E"];
        }
        if ([resultado isEqualToString:@"15"]) {
            resultado = [[NSString alloc]initWithFormat:@"F"];
        }
        
        [arreglo appendFormat:@"%@",resultado];
    
    }

    NSLog(@"%@",arreglo);

    Resultadolabel.text = [[NSString alloc]initWithString:arreglo];
        
    }

}


-(IBAction)Inicio:(id)sender{
    
    [Valorfield resignFirstResponder];
    [Baseinicial resignFirstResponder];
    [BaseFinal resignFirstResponder];

    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];


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
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:20]}];
    
   titulo1.font = [UIFont fontWithName:@"Coming Soon" size:25];
   titulo2.font = [UIFont fontWithName:@"Coming Soon" size:25];
    
    Valorfield.font = [UIFont fontWithName:@"DS-Digital" size:30];
    Baseinicial.font = [UIFont fontWithName:@"DS-Digital" size:30];
    BaseFinal.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    
    ResTituloLabel.font = [UIFont fontWithName:@"Coming Soon" size:40];
    
    Resultadolabel.font = [UIFont fontWithName:@"DS-Digital" size:60];

    
    
    
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
        self.Scroller.contentSize=CGSizeMake(320,610);
    }
    else{
        
        self.Scroller.contentSize=CGSizeMake(320,705);
        
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
    
    [Valorfield resignFirstResponder];
    [Baseinicial resignFirstResponder];
    [BaseFinal resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [self setResTituloLabel:nil];
    [super viewDidUnload];
}
@end
