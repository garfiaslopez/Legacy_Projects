//
//  ViewNotes.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 16/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "ViewNotes.h"
#import "TableNotes.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewNotes ()

@end

@implementation ViewNotes
@synthesize MainTextView;
@synthesize TituloNote;
@synthesize ArreglodeNotas;
@synthesize ArreglodeTitulos;
@synthesize DoneLayout;

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
    
    DoneLayout.hidden = YES;
    
    ArreglodeNotas = [[NSMutableArray alloc]init];
    ArreglodeTitulos = [[NSMutableArray alloc]init];

    
    //To make the border look very close to a UITextField
    [MainTextView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [MainTextView.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    MainTextView.layer.cornerRadius = 5;
    MainTextView.clipsToBounds = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    //añadir un gesto de pulsacion larga sobre el navigation para activar un uialertview para cambiar el titulo en la barra y en el array.
    
    //Recupera el entero de la tabla:
    
    NSUserDefaults *RecuperarCelda = [[NSUserDefaults alloc]init];
    
    NSUInteger Celda = [RecuperarCelda integerForKey:@"ValorCelda"];
    
    //Recuperar el Arreglo de notas:
    
    ArreglodeNotas = [[RecuperarCelda objectForKey:@"Notas"]mutableCopy];
    
    //Recuperar el areglo de titulos:
    
    ArreglodeTitulos = [[RecuperarCelda objectForKey:@"Titulos"]mutableCopy];
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArreglodeTitulos.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArreglodeNotas.count);
    
    for (int i=0; i<ArreglodeTitulos.count; i++) {
        NSLog(@"%@",ArreglodeTitulos[i]);
    }
    
    for (int i=0; i<ArreglodeNotas.count; i++) {
        NSLog(@"%@",ArreglodeNotas[i]);
    }
    
    // Poner el titulo y la nota en la vista
    
    MainTextView.text = ArreglodeNotas[Celda];
    
    TituloNote.topItem.title = ArreglodeTitulos[Celda];
    
    
    
}

-(void)dismissKeyboard {
    
    [ MainTextView resignFirstResponder];
    
}
- (void)keyboardDidShow:(NSNotification *)notification {
    
    DoneLayout.hidden = NO;
}

-(void)keyboardDidHide:(NSNotification *)notification{
    
    DoneLayout.hidden = YES;
    
    //SAVE THE TEXTFIELD IN NSUSERDEFALUTS
    
    //meter al arreglo la nota segun su numero en CELDA;
    
    //ESTE METODO INTERFIERE AL CARGAR LA MODAL VIEW CON LA UIVIEW ANTERIOR POR ENDE PRIMERO GUARDA BIEN EL ARREGLO DESPUES SE VA A LA CHINGADA POR QUE SOBREESCROBE VALORES DE ESTA VIEW  WTF!!!! O.o?
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArreglodeTitulos.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArreglodeNotas.count);
    
    for (int i=0; i<ArreglodeTitulos.count; i++) {
        NSLog(@"%@",ArreglodeTitulos[i]);
    }
    
    for (int i=0; i<ArreglodeNotas.count; i++) {
        NSLog(@"%@",ArreglodeNotas[i]);
    }
    
    //Recupera el entero de la tabla:
    
    NSUserDefaults *RecuperarCelda = [[NSUserDefaults alloc]init];
    
    NSUInteger Celda = [RecuperarCelda integerForKey:@"ValorCelda"];
    
    //Recuperar el Arreglo de notas:
    
    ArreglodeNotas = [[RecuperarCelda objectForKey:@"Notas"]mutableCopy];
    
    //Recuperar el areglo de titulos:
    
    ArreglodeTitulos = [[RecuperarCelda objectForKey:@"Titulos"]mutableCopy];

    
    if (![self isMemberOfClass:[TableNotes class]]) {
    
    
    NSLog(@"ENTRO AL PINCHE METODO DE CUANDO SE MINIMIZA TECLADO");
    
    NSLog(@"NUMERO DE CELDA: %d",Celda);
    NSLog(@"%@",MainTextView.text);
    NSString *notatempString = [[NSString alloc]initWithString:MainTextView.text];
    
    [ArreglodeNotas replaceObjectAtIndex:Celda withObject:notatempString];
    [ArreglodeTitulos replaceObjectAtIndex:Celda withObject:TituloNote.topItem.title];
    
    //Guardar en nsuserdefaults

    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    [Salvar setObject:ArreglodeNotas forKey:@"Notas"];
    [Salvar setObject:ArreglodeTitulos forKey:@"Titulos"];
    
    NSLog(@"DEBIO SALVAR");
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArreglodeTitulos.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArreglodeNotas.count);

    
    for (int i=0; i<ArreglodeTitulos.count; i++) {
        NSLog(@"%@",ArreglodeTitulos[i]);
    }
    
    for (int i=0; i<ArreglodeNotas.count; i++) {
        NSLog(@"%@",ArreglodeNotas[i]);
    }
    
    notatempString = [[NSString alloc]init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Close:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //Salvar... en caso de que el teclado no haya sido escondido
    
    [MainTextView resignFirstResponder];
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArreglodeTitulos.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArreglodeNotas.count);

    
    for (int i=0; i<ArreglodeTitulos.count; i++) {
        NSLog(@"%@",ArreglodeTitulos[i]);
    }
    
    for (int i=0; i<ArreglodeNotas.count; i++) {
        NSLog(@"%@",ArreglodeNotas[i]);
    }
        
}
@end
