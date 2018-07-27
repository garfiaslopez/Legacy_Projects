//
//  DecimalBinarioHexOct.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 10/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DecimalBinarioHexOct.h"

@interface DecimalBinarioHexOct ()

@end

@implementation DecimalBinarioHexOct
@synthesize ValorField;
@synthesize Unidad;
@synthesize Decimallabel;
@synthesize Binariolabel;
@synthesize Octallabel;
@synthesize Hexalabel;
@synthesize Decimallabeltxt;
@synthesize Binariolabeltxt;
@synthesize Octallabeltxt;
@synthesize Hexalabeltxt;
@synthesize TituloNav;
@synthesize Scroller;
-(IBAction)Inicio:(id)sender{
    
    [ValorField resignFirstResponder];

    
    [self dismissViewControllerAnimated:YES completion:nil];


}

-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Coloca el numero que quieras convertir en el cuadro de texto y selecciona en que base se encuentra, enseguida presiona 'calcular'." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];

}

-(IBAction)Calcular:(id)sender{
    
    
    
    if (Unidad.selectedSegmentIndex == 0) { //binario
        
        
     
        double suma = 0,temp = 0,temp2 = 0,base,exponente;
        double valor;
        double divisor = 10000000000000000;
        int binario;
        
        base = 2;
        exponente = 16;
                
        binario = [ValorField.text integerValue];
        valor = [ValorField.text doubleValue];
        
        while (exponente >= 0) {
            
            temp = valor/divisor;
            
            if (temp >= 1 ) {
                temp2 = pow(base, exponente);
                valor = valor - divisor;
            }
        
            suma = suma + temp2;
                    
            
            divisor = divisor/10;
            temp = 0;
            temp2 = 0;
            
            exponente --;
            
            
        }

        Decimallabel.text = [[NSString alloc]initWithFormat:@"%.0f",suma];
        Binariolabel.text = [[NSString alloc]initWithFormat:@"%d",binario];
        
        //Conversor a OCTAL:///////////////////////////////////////////////////////////////
        
        NSString *resultado;
        
        NSMutableString *arreglo;
        
        arreglo = [[NSMutableString alloc]init];
        
        
        int binario1[1000],numero,i,j=0,N;
                
        numero = suma;
        
        while (numero != 0) {
            
            i = numero%8;
            numero = numero/8;
            j++;
            
            binario1[j] = i;
        }
        
        for (N=j; N>=1; N--) {
            
            resultado = [[NSString alloc]initWithFormat:@"%d",binario1[N]];
                        
            [arreglo appendFormat:@"%d",binario1[N]];
                        
        }
               
        
        Octallabel.text = [[NSString alloc]initWithString:arreglo];

        
        ///////////////////////////////////////////////////////////////////////////////////
        //Conversion a Hexadecimal:
        
        NSString *resultado2;
        
        NSMutableString *arreglo2;
        
        arreglo2 = [[NSMutableString alloc]init];


        
        int binario2[1000],numero2,i2,j2=0,N2,base2;
        
        numero2 = suma;
        
        base2 = 16;
        
        while (numero2 != 0) {
            
            i2 = numero2%base2;
            numero2 = numero2/base2;
            j2++;
            
            binario2[j2] = i2;
        }
        
        for (N2=j2; N2>=1; N2--) {
            
            resultado2 = [[NSString alloc]initWithFormat:@"%d",binario2[N2]];
            
            
            if ([resultado2 isEqualToString:@"10"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"A"];
            }
            if ([resultado2 isEqualToString:@"11"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"B"];
            }
            if ([resultado2 isEqualToString:@"12"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"C"];
            }
            if ([resultado2 isEqualToString:@"13"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"D"];
            }
            if ([resultado2 isEqualToString:@"14"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"E"];
            }
            if ([resultado2 isEqualToString:@"15"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"F"];
            }
           
            
            [arreglo2 appendFormat:@"%@",resultado2];
            
            
            
        }
        
        Hexalabel.text = [[NSString alloc]initWithString:arreglo2];
        
        
        
        
    }
    
    if (Unidad.selectedSegmentIndex == 1) { //Decimal
        
        
        //conversion a Binario:
                
        NSMutableString *arreglo;
        
        arreglo = [[NSMutableString alloc]init];

        
        int binario[1000],numero,i,j=0,N;
        int decimal;
        
        //scanf("%d",&numero);
        
        numero = [ValorField.text integerValue];
        decimal = [ValorField.text integerValue];
        
        while (numero != 0) {
            
            i = numero%2;
            numero = numero/2;
            j++;
            
            binario[j] = i;
        }
        
        for (N=j; N>=1; N--) {
              
            [arreglo appendFormat:@"%d",binario[N]];  
        }
        
        
        Binariolabel.text = [[NSString alloc]initWithString:arreglo];
        
        Decimallabel.text = [[NSString alloc]initWithFormat:@"%d",decimal];

        ///////////////////////////////////////////////////////////////////////////////
        //conversion a OCTAL:

        NSString *resultado1;

        NSMutableString *arreglo1;

        arreglo1 = [[NSMutableString alloc]init];


        int binario1[1000],numero1,i1,j1=0,N1;

        numero1 = [ValorField.text integerValue];

        while (numero1 != 0) {
    
                i1 = numero1%8;
                numero1 = numero1/8;
                j1++;
    
                binario1[j1] = i1;
        }

        for (N1=j1; N1>=1; N1--) {
    
                resultado1 = [[NSString alloc]initWithFormat:@"%d",binario1[N1]];
    
                [arreglo1 appendFormat:@"%d",binario1[N1]];
    
        }


        Octallabel.text = [[NSString alloc]initWithString:arreglo1];

        //////////////////////////////////////////////////////////////////////////////////
        //Conversion a HEXADECIMAL:


        NSString *resultado2;

        NSMutableString *arreglo2;

        arreglo2 = [[NSMutableString alloc]init];



        int binario2[1000],numero2,i2,j2=0,N2,base2;

        numero2 = [ValorField.text integerValue];

        base2 = 16;

        while (numero2 != 0) {
    
                i2 = numero2%base2;
                numero2 = numero2/base2;
                j2++;
    
                binario2[j2] = i2;
        }

        for (N2=j2; N2>=1; N2--) {
    
                resultado2 = [[NSString alloc]initWithFormat:@"%d",binario2[N2]];
    
    
                if ([resultado2 isEqualToString:@"10"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"A"];
                }
                if ([resultado2 isEqualToString:@"11"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"B"];
                }
                if ([resultado2 isEqualToString:@"12"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"C"];
                }
                if ([resultado2 isEqualToString:@"13"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"D"];
                }
                if ([resultado2 isEqualToString:@"14"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"E"];
                }
                if ([resultado2 isEqualToString:@"15"]) {
                    resultado2 = [[NSString alloc]initWithFormat:@"F"];
                }
    
    
                [arreglo2 appendFormat:@"%@",resultado2];
        }

        Hexalabel.text = [[NSString alloc]initWithString:arreglo2];


    }

    if (Unidad.selectedSegmentIndex == 2) { //Octal
        
        Octallabel.text = [[NSString alloc]initWithFormat:@"%d",[ValorField.text integerValue]];
        
        //Convertidor a Decimal:
        
        double valor = 0,temp2 = 0,temp3 = 0,temp4=0,temp5 = 0;
        int temp = 0;
        double base = 8;
        double exponente = 16;
        double divisor = 10000000000000000;
        
        
        valor = [ValorField.text integerValue];
        
        while (exponente >= 0) {

            temp = valor/divisor;
            
            temp2 = pow(base, exponente);
            
            temp3 = temp * temp2;

            temp4 = temp4+temp3;
            
            exponente--;
            
            temp5 = temp*divisor;
                        
            valor = valor - temp5;
            
            divisor = divisor/10;
            
        }
        
        Decimallabel.text = [[NSString alloc]initWithFormat:@"%.0f",temp4];
        
        
        ////////////////////////////////////////////////////////////////////////////////
        //Conversor a BINARIO:
                
        NSMutableString *arreglo;
        
        arreglo = [[NSMutableString alloc]init];
        
        
        int binario[1000],numero,i,j=0,N;
        
        //scanf("%d",&numero);
        
        numero = temp4;
        
        while (numero != 0) {
            
            i = numero%2;
            numero = numero/2;
            j++;
            
            binario[j] = i;
        }
        
        for (N=j; N>=1; N--) {
                                    
            [arreglo appendFormat:@"%d",binario[N]];
                        
        }
                
        Binariolabel.text = [[NSString alloc]initWithString:arreglo];
        
        
        /////////////////////////////////////////////////////////////////////////////
        //Conversor a HEXADECIMAL:
        
        NSString *resultado2;
        
        NSMutableString *arreglo2;
        
        arreglo2 = [[NSMutableString alloc]init];
        
        
        
        int binario2[1000],numero2,i2,j2=0,N2,base2;
        
        numero2 = temp4;
        base2 = 16;
        
        while (numero2 != 0) {
            
            i2 = numero2%base2;
            numero2 = numero2/base2;
            j2++;
            
            binario2[j2] = i2;
        }
        
        for (N2=j2; N2>=1; N2--) {
            
            resultado2 = [[NSString alloc]initWithFormat:@"%d",binario2[N2]];
            
            
            if ([resultado2 isEqualToString:@"10"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"A"];
            }
            if ([resultado2 isEqualToString:@"11"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"B"];
            }
            if ([resultado2 isEqualToString:@"12"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"C"];
            }
            if ([resultado2 isEqualToString:@"13"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"D"];
            }
            if ([resultado2 isEqualToString:@"14"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"E"];
            }
            if ([resultado2 isEqualToString:@"15"]) {
                resultado2 = [[NSString alloc]initWithFormat:@"F"];
            }
            
            
            [arreglo2 appendFormat:@"%@",resultado2];
        }
        
        Hexalabel.text = [[NSString alloc]initWithString:arreglo2];       
        
        
        
    }

    if (Unidad.selectedSegmentIndex == 3) { // Hexadecimal
        
        Hexalabel.text = ValorField.text;
        
        NSString *valor;
        int tamanocadena=0,exponente=0;
        int temp=0,temp2=0,temp3=0,temp4=0;
        char caracter;
        int x = 0;

        
        valor = ValorField.text;
        
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
                        
            temp2 = pow(16, exponente);
            
            exponente--;
            
            temp3 = temp * temp2;
            
            temp4 = temp4 + temp3;
                        
            x++;

        }
        
        
        Decimallabel.text = [[NSString alloc]initWithFormat:@"%d",temp4];
        
        
/////////////////////////////////////////////////////////////////////////////////////////////
        //Conversor a Binario:
        
        NSMutableString *arreglo;
        
        arreglo = [[NSMutableString alloc]init];
        
        
        int binario[1000],numero,i,j=0,N;
                
        numero = temp4;
        
        while (numero != 0) {
            
            i = numero%2;
            numero = numero/2;
            j++;
            
            binario[j] = i;
        }
        
        for (N=j; N>=1; N--) {
            
            [arreglo appendFormat:@"%d",binario[N]];
        }
        
        
        Binariolabel.text = [[NSString alloc]initWithString:arreglo];
        
        
    
    ////////////////////////////////////////////////////////////////////////////////////
    //Conversion a OCtal:

    NSString *resultado1;
    
    NSMutableString *arreglo1;
    
    arreglo1 = [[NSMutableString alloc]init];
    
    
    int binario1[1000],numero1,i1,j1=0,N1;
    
    numero1 = temp4;
    
    while (numero1 != 0) {
        
        i1 = numero1%8;
        numero1 = numero1/8;
        j1++;
        
        binario1[j1] = i1;
    }
    
    for (N1=j1; N1>=1; N1--) {
        
        resultado1 = [[NSString alloc]initWithFormat:@"%d",binario1[N1]];
        
        [arreglo1 appendFormat:@"%d",binario1[N1]];
        
    }
    
    
    Octallabel.text = [[NSString alloc]initWithString:arreglo1];
    
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
    
    ValorField.font = [UIFont fontWithName:@"DS-Digital" size:30];

    
    Hexalabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Decimallabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Binariolabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    Octallabel.font = [UIFont fontWithName:@"DS-Digital" size:60];

    
    [super viewDidLoad];
    
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
        self.Scroller.contentSize=CGSizeMake(320,710);
    }
    else{
        
        self.Scroller.contentSize=CGSizeMake(320,805);
        
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
