//
//  DecimalGrados.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 03/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DecimalGrados.h"
#import "math.h"
#import "string.h"

@interface DecimalGrados ()

@end

@implementation DecimalGrados
@synthesize TituloNav;
@synthesize NumeroTextField;
@synthesize Grados1Label;
@synthesize ResGradosLabel;
@synthesize ResMinLabel;
@synthesize ResSegLabel;
@synthesize ResMsegLabel;
@synthesize TangenteLabel;
@synthesize SenoLabel;
@synthesize CosenoLabel;
@synthesize ResTangenteLabel;
@synthesize ResSenoLabel;
@synthesize ResCosenoLabel;
@synthesize Grados2Label;
@synthesize GradosTextfield;
@synthesize MinTextField;
@synthesize SegTextField;
@synthesize MsegTextField;
@synthesize Decimal2Label;
@synthesize Decimal1Label;
@synthesize ResDecimalLabel;
@synthesize Scroller;


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
    
    
    Decimal1Label.font = [UIFont fontWithName:@"coming Soon" size:25];
    Grados1Label.font= [UIFont fontWithName:@"coming Soon" size:25];
    TangenteLabel.font = [UIFont fontWithName:@"coming Soon" size:25];
    SenoLabel.font= [UIFont fontWithName:@"coming Soon" size:25];
    CosenoLabel.font = [UIFont fontWithName:@"coming Soon" size:25];
    Grados2Label.font= [UIFont fontWithName:@"coming Soon" size:25];
    Decimal2Label.font = [UIFont fontWithName:@"coming Soon" size:25];

    
    ResGradosLabel.font = [UIFont fontWithName:@"DS-Digital" size:50];
    ResSegLabel.font = [UIFont fontWithName:@"DS-Digital" size:50];
    ResMinLabel.font = [UIFont fontWithName:@"DS-Digital" size:50];
    ResMsegLabel.font = [UIFont fontWithName:@"DS-Digital" size:50];
    ResDecimalLabel.font = [UIFont fontWithName:@"DS-Digital" size:50];
    
    ResTangenteLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResSenoLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];
    ResCosenoLabel.font = [UIFont fontWithName:@"DS-Digital" size:40];


    

    
    NumeroTextField.font = [UIFont fontWithName:@"DS-Digital" size:30];
    
    GradosTextfield.font = [UIFont fontWithName:@"DS-Digital" size:20];
    MinTextField.font = [UIFont fontWithName:@"DS-Digital" size:20];
    SegTextField.font = [UIFont fontWithName:@"DS-Digital" size:20];
    MsegTextField.font = [UIFont fontWithName:@"DS-Digital" size:20];




    

    
    
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    
    [ NumeroTextField resignFirstResponder];
    [ GradosTextfield resignFirstResponder];
    [ MinTextField resignFirstResponder];
    [ SegTextField resignFirstResponder];
    [ MsegTextField resignFirstResponder];

    
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


- (IBAction)CalcularDec:(id)sender {
    
    double DecimalNumero=0;
    int gradosnumero=0,MinNumero=0,SegNumero=0,MsegNumero=0;
    
    DecimalNumero = [NumeroTextField.text doubleValue];
    
    ResTangenteLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",tan(DecimalNumero)];
    
    ResSenoLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",sin(DecimalNumero)];
    ResCosenoLabel.text = [[NSString alloc]initWithFormat:@"%.3lf",cos(DecimalNumero)];
    
    gradosnumero = DecimalNumero;
    
    DecimalNumero = DecimalNumero - gradosnumero;
    
    DecimalNumero = DecimalNumero * 60;
    
    MinNumero = DecimalNumero;
    
    DecimalNumero = DecimalNumero - MinNumero;
    
    DecimalNumero = DecimalNumero * 60;
    
    SegNumero = DecimalNumero;
    
    DecimalNumero = DecimalNumero -SegNumero;
    
    DecimalNumero = DecimalNumero * 100;
    
    MsegNumero = DecimalNumero;
    
    
    ResGradosLabel.text = [[NSString alloc]initWithFormat:@"%dº",gradosnumero];
    
    ResMinLabel.text = [[NSString alloc]initWithFormat:@"%d'",MinNumero];
    
    ResSegLabel.text = [[NSString alloc]initWithFormat:@"%d''",SegNumero];
    
    ResMsegLabel.text = [[NSString alloc]initWithFormat:@"%d'''",MsegNumero];
    
}

- (IBAction)CalcularGrados:(id)sender {
    
    NSString * valor1;
    NSString * valor2;
    NSString * ressum;
    
    valor1 = SegTextField.text;
    valor2 = MsegTextField.text;
    
    ressum = [[NSString alloc]initWithFormat:@"%@.%@",valor1,valor2];
    
    double temp = [ressum doubleValue];
    
    NSLog(@"%lf",temp);
    
    ResDecimalLabel.text = [[NSString alloc]initWithFormat:@"%lf",[GradosTextfield.text doubleValue]+[MinTextField.text doubleValue]/60 + temp/3600];
    
    
}

- (IBAction)Inicio:(id)sender {
    
    [ NumeroTextField resignFirstResponder];
    [ GradosTextfield resignFirstResponder];
    [ MinTextField resignFirstResponder];
    [ SegTextField resignFirstResponder];
    [ MsegTextField resignFirstResponder];
    
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];

}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"En la parte de arriba ingresa un decimal y lo convertira a grados, y en la parte de abajo ingresa los grados y lo convertira en decimal." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setNumeroTextField:nil];
    [self setGrados1Label:nil];
    [self setResGradosLabel:nil];
    [self setResMinLabel:nil];
    [self setResSegLabel:nil];
    [self setResMsegLabel:nil];
    [self setTangenteLabel:nil];
    [self setSenoLabel:nil];
    [self setCosenoLabel:nil];
    [self setResTangenteLabel:nil];
    [self setResSenoLabel:nil];
    [self setResCosenoLabel:nil];
    [self setGrados2Label:nil];
    [self setGradosTextfield:nil];
    [self setMinTextField:nil];
    [self setSegTextField:nil];
    [self setMsegTextField:nil];
    [self setDecimal2Label:nil];
    [self setDecimal1Label:nil];
    [self setResDecimalLabel:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
