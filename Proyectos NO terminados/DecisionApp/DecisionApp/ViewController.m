//
//  ViewController.m
//  DecisionApp
//
//  Created by Jose De Jesus Garfias Lopez on 08/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Frase;
@synthesize BackImage;
@synthesize Acciones;
@synthesize Sujetos;
@synthesize MatrixNO;
@synthesize MatrixYES;
@synthesize AnswerImage;
@synthesize AnswerText;
@synthesize AnswerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //HIDE KEYBOARD:
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
    // DEIFINICION DE PALABRAS
    Acciones = [[NSMutableArray alloc]initWithObjects:
                @"correr",
                @"comer",
                @"caminar",
                nil];
    
    Sujetos = [[NSMutableArray alloc]initWithObjects:
               @"mama",
               @"gato",
               @"perro",
               nil];
    
    //tamaño de los arreglos
    int AccionesLength = Acciones.count;
    int SujetosLength = Sujetos.count;
    
    NSLog(@"TAMAÑO DE SUJETOS %d , TAMAÑO DE ACCIONES %d",AccionesLength,SujetosLength);
    
    
    //Crear matrices:
    MatrixYES = [NSMutableArray arrayWithCapacity: AccionesLength];
    // Add an array as each element of matrix
   // for ( int i = 0; i < AccionesLength; ++i )
       // [MatrixYES addObject: [NSMutableArray arrayWithCapacity: SujetosLength]];
    
    MatrixNO = [NSMutableArray arrayWithCapacity: AccionesLength];
    // Add an array as each element of matrix
   // for ( int i = 0; i < AccionesLength; ++i )
       // [MatrixNO addObject: [NSMutableArray arrayWithCapacity: SujetosLength]];
    
    
    [MatrixYES insertObject: [NSArray arrayWithObjects:
                              @"No hay sujeto, no hay verbo",
                              @"b",
                              @"c",
                              @"d",
                              @"e", nil] atIndex: 0];
    [MatrixYES insertObject: [NSArray arrayWithObjects:
                              @"f",
                              @"g",
                              @"h",
                              @"i",
                              @"j", nil] atIndex: 1];
    [MatrixYES insertObject: [NSArray arrayWithObjects:
                              @"a",
                              @"b",
                              @"c",
                              @"d",
                              @"e", nil] atIndex: 2];
    
    
    //MATRIZ DE NO
    
    
    [MatrixNO insertObject: [NSArray arrayWithObjects:
                              @"No hay sujeto, no hay verbo",
                              @"b",
                              @"c",
                              @"d",
                              @"e", nil] atIndex: 0];
    [MatrixNO insertObject: [NSArray arrayWithObjects:
                              @"f",
                              @"g",
                              @"h",
                              @"i",
                              @"j", nil] atIndex: 1];
    [MatrixNO insertObject: [NSArray arrayWithObjects:
                              @"a",
                              @"b",
                              @"c",
                              @"d",
                              @"e", nil] atIndex: 2];

}

- (IBAction)AnswerClose:(id)sender {
    
    [UIView animateWithDuration:0.6 animations:^(){
        AnswerView.frame = CGRectMake(20, 640, 280, 498);
    }];
}

- (IBAction)Decidir:(id)sender {
    
    //RANDOM:
    int randNum = rand() % 2 - 0 + 0;
    NSLog(@"NUMERO ALEATORIO %d",randNum);
    
    //GET THE TEXT
    NSString *frase = [[NSString alloc]initWithFormat:@"%@ ",Frase.text];
    NSLog(@"%@",frase);
    
    //SEPARAR WORDS:
    
    int AccionInteger = 0;
    int SujetoInteger = 0;
    NSString *palabra= [[NSString alloc]init];
    
    int indiceInicial=0;
    int indiceFinal=0;

    for (int i =0;i<frase.length; i++) {

        if ([frase characterAtIndex:i]==' ') {
            
            indiceFinal=i;
            NSRange range = NSMakeRange (indiceInicial, indiceFinal- indiceInicial);
            palabra = [frase substringWithRange:range];
            NSLog(@"%@",palabra);
            indiceInicial = indiceFinal+1;
            
            //Normalizar la palabra (convertir a minusculas)
            palabra = [palabra lowercaseString];
            
            //Encontrar la palabra o sujeto
            
            for (int j=0; j<[Acciones count]; j++) {
                
                if ([palabra isEqual:[Acciones objectAtIndex:j]]) {
                    AccionInteger = j;
                }
                if ([palabra isEqual:[Sujetos objectAtIndex:j]]) {
                    SujetoInteger = j;
                }
            }
            
        }
    }
    
    //SEARCH THE ANSWER
    
    NSLog(@"Accion: %d , Sujeto %d",AccionInteger,SujetoInteger);

    if (randNum == 0) {   //Dio YES
        
        NSLog(@"%@",[[MatrixYES objectAtIndex: AccionInteger] objectAtIndex: SujetoInteger]);
        
        //change color, Play Sounds.
        BackImage.backgroundColor = [UIColor greenColor];
        
        //set Answer
        AnswerText.text = [[MatrixYES objectAtIndex:AccionInteger]objectAtIndex:SujetoInteger];
        
        //set imageAnswer
        //AnswerImage.image = [UIImage imageNamed:@"PersonajeYes.png"];
        
        
        
        
    }
    else{ //Dio NO
        
        NSLog(@"%@",[[MatrixNO objectAtIndex: AccionInteger] objectAtIndex: SujetoInteger]);
        
        //change color, Play Sounds.
        BackImage.backgroundColor = [UIColor redColor];
        
        //set Answer
        AnswerText.text = [[MatrixNO objectAtIndex:AccionInteger]objectAtIndex:SujetoInteger];
        
        //set imageAnswer
        //AnswerImage.image = [UIImage imageNamed:@"PersonajeNo.png"];
        
    }
    
    
    //Show View:
    
    [UIView animateWithDuration:0.6 animations:^(){
        AnswerView.frame = CGRectMake(20, 50, 280, 498);
    }];
    
    
}




-(void)dismissKeyboard {
    
    [Frase resignFirstResponder];
    
}

@end
