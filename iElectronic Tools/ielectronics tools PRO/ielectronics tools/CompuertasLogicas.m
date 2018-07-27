//
//  CompuertasLogicas.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 11/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "CompuertasLogicas.h"
#import "CompuertasDiagramas.h"

@interface CompuertasLogicas ()

@end

@implementation CompuertasLogicas
@synthesize A;
@synthesize B;

@synthesize Yes;
@synthesize No;
@synthesize And;
@synthesize Or;
@synthesize Nand;
@synthesize Nor;
@synthesize Xnor;
@synthesize Xor;

@synthesize Yeslabel;
@synthesize Nolabel;
@synthesize Andlabel;
@synthesize Orlabel;
@synthesize Nandlabel;
@synthesize Norlabel;
@synthesize Xorlabel;
@synthesize Xnorlabel;
@synthesize entradas;
@synthesize Alabel;
@synthesize Blabel;
@synthesize TituloNav;
@synthesize Scroller;

@synthesize loadDiagrama;



-(IBAction)instrucciones:(id)sender{

    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Selecciona las entradas a las compuertas en los segmentos A y B, enseguida presiona en 'calcular' y se te calcularan todas las salidas de todas las compuertas." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];

}

- (IBAction)LoadYES:(id)sender {
    
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"YES"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

    
}

- (IBAction)LoadNOT:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"NOT"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadAND:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"AND"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadOR:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"OR"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadNand:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"NAND"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadNor:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"NOR"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadXor:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"XOR"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}

- (IBAction)LoadXnor:(id)sender {
    
    loadDiagrama = [self.storyboard instantiateViewControllerWithIdentifier:@"DiagramaCompuertas"];
    loadDiagrama.CompuertaString = [[NSString alloc]initWithFormat:@"XNOR"];
    loadDiagrama.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:loadDiagrama animated:YES completion:NULL];

}




-(IBAction)Inicio:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}



-(IBAction)Calcular:(id)sender{

    if (A.selectedSegmentIndex == 0 && B.selectedSegmentIndex == 0){
    
        Yes.text = [[NSString alloc]initWithFormat:@"0"];
        No.text = [[NSString alloc]initWithFormat:@"1"];
        And.text = [[NSString alloc]initWithFormat:@"0"];
        Or.text = [[NSString alloc]initWithFormat:@"0"];
        Nand.text = [[NSString alloc]initWithFormat:@"1"];
        Nor.text = [[NSString alloc]initWithFormat:@"1"];
        Xnor.text = [[NSString alloc]initWithFormat:@"0"];
        Xor.text = [[NSString alloc]initWithFormat:@"1"];

    
    }
    
    if (A.selectedSegmentIndex == 0 && B.selectedSegmentIndex == 1){
        
        Yes.text = [[NSString alloc]initWithFormat:@"0"];
        No.text = [[NSString alloc]initWithFormat:@"1"];
        And.text = [[NSString alloc]initWithFormat:@"0"];
        Or.text = [[NSString alloc]initWithFormat:@"1"];
        Nand.text = [[NSString alloc]initWithFormat:@"1"];
        Nor.text = [[NSString alloc]initWithFormat:@"0"];
        Xnor.text = [[NSString alloc]initWithFormat:@"0"];
        Xor.text = [[NSString alloc]initWithFormat:@"1"];
        
    }
    
    if (A.selectedSegmentIndex == 1 && B.selectedSegmentIndex == 0){
        
        Yes.text = [[NSString alloc]initWithFormat:@"1"];
        No.text = [[NSString alloc]initWithFormat:@"0"];
        And.text = [[NSString alloc]initWithFormat:@"0"];
        Or.text = [[NSString alloc]initWithFormat:@"1"];
        Nand.text = [[NSString alloc]initWithFormat:@"1"];
        Nor.text = [[NSString alloc]initWithFormat:@"0"];
        Xnor.text = [[NSString alloc]initWithFormat:@"0"];
        Xor.text = [[NSString alloc]initWithFormat:@"1"];
        
    }
    
    if (A.selectedSegmentIndex == 1 && B.selectedSegmentIndex == 1){
        
        Yes.text = [[NSString alloc]initWithFormat:@"1"];
        No.text = [[NSString alloc]initWithFormat:@"0"];
        And.text = [[NSString alloc]initWithFormat:@"1"];
        Or.text = [[NSString alloc]initWithFormat:@"1"];
        Nand.text = [[NSString alloc]initWithFormat:@"0"];
        Nor.text = [[NSString alloc]initWithFormat:@"0"];
        Xnor.text = [[NSString alloc]initWithFormat:@"1"];
        Xor.text = [[NSString alloc]initWithFormat:@"0"];
        
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
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:10],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];

    Yes.font = [UIFont fontWithName:@"DS-Digital" size:40];
    No.font = [UIFont fontWithName:@"DS-Digital" size:40];
    And.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Or.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Nand.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Nor.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Xnor.font = [UIFont fontWithName:@"DS-Digital" size:40];
    Xor.font = [UIFont fontWithName:@"DS-Digital" size:40];

    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
