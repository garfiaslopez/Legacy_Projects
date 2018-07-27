//
//  leydeohm.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "leydeohm.h"

@interface leydeohm ()

@end

@implementation leydeohm
@synthesize TituloNav;
@synthesize Scroller;


float resistenciavalor;
float intensidadvalor;
float voltajevalor;


-(IBAction)instrucciones:(id)sender{
    
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Intrucciones:" message:@"Inserta los valores con los que dispongas y deja en blanco la casilla de la cual quieras obtener el valor, Despues selecciona la unidad en la que se encuentra dicho valor. EJEMPLO: si quiero calcular el voltaje, solo tengo que dejar en blanco la casilla voltaje e insertar el valor de la resistencia y la intensidad." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [error show];
}


-(IBAction)calcular:(id)sender{
    
    voltajevalor = [voltajeentrada.text doubleValue];
    resistenciavalor = [resistenciaentrada.text doubleValue];
    intensidadvalor = [intensidadentrada.text doubleValue];
    
    
    if (voltajevalor != 0 && resistenciavalor != 0 && intensidadvalor != 0) {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Operacion Invalida" message:@"Por favor deja en blanco la casilla la cual quieras calcular" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [error show];
        
    }
    
    if (voltajevalor == 0 && resistenciavalor == 0 && intensidadvalor == 0) {
    
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Operacion Invalida" message:@"Por favor deja en blanco la casilla la cual quieras calcular y rellena al menos 2 casillas" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [error show];
        
    }
    
    if (voltajevalor == 0) {
        
        unidad.text = @"Mili V";
        unidad1.text = @"Volts";
        unidad2.text = @"Kilo V";
        
        if (unidadesresistencia.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex ==0) {  //Miliohm con Miliamper
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000000];
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex == 1) { //miliohm con amper
            
            resistenciavalor = resistenciavalor/1000;  // se convierte de miliohm a ohm.
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex ==2) { //miliohm con kamper
            
            resistenciavalor = resistenciavalor/1000;  // se convierte de miliohm a ohm.
            intensidadvalor = intensidadvalor*1000;    //se convierte de kiloamper a amper.
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 0) { //ohm con miliamper
            
            intensidadvalor = intensidadvalor/1000; // se converiete de miliamper a amper.
            
            voltajevalor = resistenciavalor * intensidadvalor; // volts
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 1) { // ohm con amper
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 2) { //ohm con Kamper
            
            intensidadvalor = intensidadvalor * 1000;
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 2 && unidadesintensidad.selectedSegmentIndex == 0) { // Kohm con Miliamper
            
            resistenciavalor = resistenciavalor *1000; // se convierte a ohm
            intensidadvalor = intensidadvalor/1000; // se convierte a amper
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 2 && unidadesintensidad.selectedSegmentIndex == 1) { //Kohm con amper
            
            resistenciavalor = resistenciavalor *1000; // se convierte a ohm.
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor/1000];
            
            
        }
        
        if (unidadesresistencia.selectedSegmentIndex == 2 && unidadesintensidad.selectedSegmentIndex == 2) { //Kohm con Kamper
            
            voltajevalor = resistenciavalor * intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor*1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",voltajevalor];
            
            
        }
    }
    
    if (resistenciavalor == 0) {
        
        unidad.text = @"Mili Ω";
        unidad1.text = @"Ohms";
        unidad2.text = @"Kilo Ω";
        
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex == 0) { // milivolt con miliamper
            
            resistenciavalor = voltajevalor/intensidadvalor; //valor en mili
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f", resistenciavalor/1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex == 1) { //milivolt con amper
            
            voltajevalor = voltajevalor/1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesintensidad.selectedSegmentIndex == 2) { //milivolt con kamper
            
            voltajevalor = voltajevalor/1000;
            intensidadvalor = intensidadvalor*1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 0) { // volt con miliamper
            
            intensidadvalor = intensidadvalor/1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 1) {//volt con amper
            
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesintensidad.selectedSegmentIndex == 2) { //volt con kamper
            
            intensidadvalor = intensidadvalor*1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 2 && unidadesintensidad.selectedSegmentIndex == 0) { //kilovolt con miliamper
            
            voltajevalor = voltajevalor*1000;
            intensidadvalor = intensidadvalor/1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 2 && unidadesintensidad.selectedSegmentIndex ==1) { //kilovolt con amper
            
            voltajevalor = voltajevalor*1000;
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex ==2 && unidadesintensidad.selectedSegmentIndex ==2) {//kilovolt con kiloamper
            
            resistenciavalor = voltajevalor/intensidadvalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor*1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",resistenciavalor];
            
        }
        
        
    }
    
    
    if (intensidadvalor == 0) {
        
        unidad.text = @"Mili A";
        unidad1.text = @"Ampers";
        unidad2.text = @"Kilo A";
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesresistencia.selectedSegmentIndex == 0) { //milivolt con miliohm
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f", intensidadvalor/1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesresistencia.selectedSegmentIndex == 1) { //milivolt con ohm
            
            voltajevalor = voltajevalor/1000;
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 0 && unidadesresistencia.selectedSegmentIndex == 2) { //milivolt con kohm
            
            voltajevalor = voltajevalor/1000;
            resistenciavalor = resistenciavalor*1000;
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesresistencia.selectedSegmentIndex == 0) { //volt con miliohm
            
            resistenciavalor = resistenciavalor/1000;
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesresistencia.selectedSegmentIndex == 1) { // volt con ohm
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 1 && unidadesresistencia.selectedSegmentIndex == 2) { // volt con kohm
            
            resistenciavalor = resistenciavalor*1000;
            
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 2 && unidadesresistencia.selectedSegmentIndex == 0) { // Kvolt con miliohm
            
            voltajevalor = voltajevalor*1000;
            resistenciavalor = resistenciavalor/1000;
            
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 2 && unidadesresistencia.selectedSegmentIndex == 1) { // kvolt con ohm
            
            
            voltajevalor = voltajevalor*1000;
            
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor/1000];
            
        }
        
        if (unidadesvoltaje.selectedSegmentIndex == 2 && unidadesresistencia.selectedSegmentIndex == 2) { // kvolt con kohm
            
            intensidadvalor = voltajevalor/resistenciavalor;
            
            resultadoMili.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000000];
            
            resultado.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor*1000];
            
            resultadoKilo.text = [[NSString alloc]initWithFormat:@"%.3f",intensidadvalor];
            
        }
        
    }
    
}

-(IBAction)inicio:(id)sender{
    
    [resistenciaentrada resignFirstResponder];
    [intensidadentrada resignFirstResponder];
    [voltajeentrada resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}


-(void)dismissKeyboard {
    
    [resistenciaentrada resignFirstResponder];
    
    [intensidadentrada resignFirstResponder];
    
    [voltajeentrada resignFirstResponder];
    
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


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    

    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    voltajeentrada.font  = [UIFont fontWithName:@"DS-Digital" size: 30];
    resistenciaentrada.font  = [UIFont fontWithName:@"DS-Digital" size: 30];
    intensidadentrada.font  = [UIFont fontWithName:@"DS-Digital" size: 30];

    
    resultadoMili.font  = [UIFont fontWithName:@"DS-Digital" size: 60];
    resultado.font  = [UIFont fontWithName:@"DS-Digital" size: 60];
    resultadoKilo.font  = [UIFont fontWithName:@"DS-Digital" size: 60];


    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    
}


- (void)keyboardDidShow:(NSNotification *)notification {
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,608);
    }
    else{
        
        self.Scroller.contentSize=CGSizeMake(320,700);
    
    }

    
   /* if ([[UIScreen mainScreen] bounds].size.height == 568) {
        [self.view setFrame:CGRectMake(0,-35,320,560)];
    }
    else {
        [self.view setFrame:CGRectMake(0,-35,320,460)];
    }*/
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

    
    /*  if ([[UIScreen mainScreen] bounds].size.height == 568) {
     [self.view setFrame:CGRectMake(0,20,320,560)];
     }
     else {
     [self.view setFrame:CGRectMake(0,20,320,460)];
     }
     */
    
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
