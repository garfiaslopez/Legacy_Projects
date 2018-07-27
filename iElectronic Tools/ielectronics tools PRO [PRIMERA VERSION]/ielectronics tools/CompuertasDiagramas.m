//
//  CompuertasDiagramas.m
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 19/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "CompuertasDiagramas.h"
#import "CompuertasLogicas.h"

@interface CompuertasDiagramas ()

@end

@implementation CompuertasDiagramas

@synthesize CompuertasView;
@synthesize CompuertaString;
@synthesize TituloLabel;
@synthesize SimboloImage;
@synthesize SimboloLabel;
@synthesize SubtituloLabel;
@synthesize ModeloLabel;
@synthesize DiagramaImage;

@synthesize YesSymbolImage;
@synthesize NotSymbolImage;
@synthesize AndSymbolImage;
@synthesize OrSymbolImage;
@synthesize NandSymbolImage;
@synthesize NorSymbolImage;
@synthesize XorSymbolImage;
@synthesize XnorSymbolImage;

@synthesize YesDiagram1Image;
@synthesize NotDiagram1Image;
@synthesize AndDiagram1Image;
@synthesize OrDiagram1Image;
@synthesize NandDiagram1Image;
@synthesize NorDiagram1Image;
@synthesize XorDiagram1Image;
@synthesize XnorDiagram1Image;

@synthesize AndDiagram2Image;
@synthesize NAndDiagram2Image;
@synthesize NAndDiagram3Image;
@synthesize XorDiagram2Image;
@synthesize NextButton;
@synthesize PrevButton;
@synthesize Scroller;
@synthesize TituloNav;

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
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    
    
    TituloLabel.font = [UIFont fontWithName:@"Coming Soon" size:40];
    SubtituloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    SimboloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    ModeloLabel.font = [UIFont fontWithName:@"Coming Soon" size:25];
    
    
    
    NSLog(@"%@",CompuertaString);
    
    if ([CompuertaString isEqualToString:@"YES"]) {
        
        NextButton.hidden = YES;
        PrevButton.hidden = YES;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"YES"];
        
        YesSymbolImage = [UIImage imageNamed:@"YES Symbol.png"];
        [SimboloImage setImage:YesSymbolImage];
        
        YesDiagram1Image = [UIImage imageNamed:@"YES1 7407.png"];
        [DiagramaImage setImage:YesDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7407 o 74SL07"];
        
    }
    
    if ([CompuertaString isEqualToString:@"NOT"]) {
        
        NextButton.hidden = YES;
        PrevButton.hidden = YES;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"NOT"];
        
        NotSymbolImage = [UIImage imageNamed:@"NOT Symbol.png"];
        [SimboloImage setImage:NotSymbolImage];
        
        NotDiagram1Image = [UIImage imageNamed:@"NOT11 7404.png"];
        [DiagramaImage setImage:NotDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7404 o 74SL04"];
        
    }
    
    if ([CompuertaString isEqualToString:@"NOR"]) {
        
        NextButton.hidden = YES;
        PrevButton.hidden = YES;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"NOR"];
        
        NorSymbolImage = [UIImage imageNamed:@"NOR Symbol.png"];
        [SimboloImage setImage:NorSymbolImage];
        
        NorDiagram1Image = [UIImage imageNamed:@"NOR1 7402.png"];
        [DiagramaImage setImage:NorDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7402 o 74SL02"];
        
    }
    
    if ([CompuertaString isEqualToString:@"OR"]) {
        
        NextButton.hidden = YES;
        PrevButton.hidden = YES;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"OR"];
        
        OrSymbolImage = [UIImage imageNamed:@"OR Symbol.png"];
        [SimboloImage setImage:OrSymbolImage];
        
        OrDiagram1Image = [UIImage imageNamed:@"OR1 7432.png"];
        [DiagramaImage setImage:OrDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7432 o 74SL32"];
        
    }
    
    if ([CompuertaString isEqualToString:@"XNOR"]) {
        
        NextButton.hidden = YES;
        PrevButton.hidden = YES;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"XNOR"];
        
        XnorSymbolImage = [UIImage imageNamed:@"XNOR Symbol.png"];
        [SimboloImage setImage:XnorSymbolImage];
        
        XnorDiagram1Image = [UIImage imageNamed:@"XNOR1 74266.png"];
        [DiagramaImage setImage:XnorDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"74266 o 74SL266"];
        
    }
    
    if ([CompuertaString isEqualToString:@"AND"]) {
        
        NextButton.hidden = NO;
        PrevButton.hidden = NO;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"AND"];
        
        AndSymbolImage = [UIImage imageNamed:@"AND Symbol.png"];
        [SimboloImage setImage:AndSymbolImage];
        
        AndDiagram1Image = [UIImage imageNamed:@"AND1 7408.png"];
        [DiagramaImage setImage:AndDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7408 o 74SL08"];
        
    }
    
    if ([CompuertaString isEqualToString:@"NAND"]) {
        
        NextButton.hidden = NO;
        PrevButton.hidden = NO;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"NAND"];
        
        NandSymbolImage = [UIImage imageNamed:@"NAND Symbol.png"];
        [SimboloImage setImage:NandSymbolImage];
        
        NandDiagram1Image = [UIImage imageNamed:@"NAND1 7400.png"];
        [DiagramaImage setImage:NandDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7400 o 74SL00"];
        
    }
    
    if ([CompuertaString isEqualToString:@"XOR"]) {
        
        NextButton.hidden = NO;
        PrevButton.hidden = NO;
        
        TituloLabel.text = [[NSString alloc]initWithFormat:@"XOR"];
        
        XorSymbolImage = [UIImage imageNamed:@"XOR Symbol.png"];
        [SimboloImage setImage:XorSymbolImage];
        
        XorDiagram1Image = [UIImage imageNamed:@"XOR1 7486.png"];
        [DiagramaImage setImage:XorDiagram1Image];
        
        ModeloLabel.text = [[NSString alloc]initWithFormat:@"7486 o 74SL86"];
        
    }

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Next:(id)sender {
    
    if ([CompuertaString isEqualToString:@"AND"]) {
                
        if ([ModeloLabel.text isEqualToString:@"7408 o 74SL08"]) { //modelo compuerta YES
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7409 o 74SL09"];
            
            AndDiagram2Image = [UIImage imageNamed:@"AND2 7409.png"];
            [DiagramaImage setImage:AndDiagram2Image];
            
        }
        
    }
    
    
    if ([CompuertaString isEqualToString:@"NAND"]) {
        
        if ([ModeloLabel.text isEqualToString:@"7400 o 74SL00"]) {
            
            NAndDiagram2Image = [UIImage imageNamed:@"NAND22 7401.png"];
            [DiagramaImage setImage:NAndDiagram2Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7401 o 74SL01"];
            
        }
        
        else if ([ModeloLabel.text isEqualToString:@"7401 o 74SL01"]) {
            
            NAndDiagram3Image = [UIImage imageNamed:@"NAND2 7403.png"];
            [DiagramaImage setImage:NAndDiagram3Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7403 o 74SL03"];
            
        }
    }
    
    if ([CompuertaString isEqualToString:@"XOR"]) {
        
        if ([ModeloLabel.text isEqualToString:@"7486 o 74SL86"]) {
            
            XorDiagram2Image = [UIImage imageNamed:@"XOR2 74136.png"];
            [DiagramaImage setImage:XorDiagram2Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"74136 o 74SL136"];

            
        }
        
    }
    
    
    
}

- (IBAction)Prev:(id)sender {
    
    
    if ([CompuertaString isEqualToString:@"AND"]) {
        
        if ([ModeloLabel.text isEqualToString:@"7409 o 74SL09"]) {
            
            AndDiagram1Image = [UIImage imageNamed:@"AND1 7408.png"];
            [DiagramaImage setImage:AndDiagram1Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7408 o 74SL08"];
        }
    }
    
    
    
    if ([CompuertaString isEqualToString:@"NAND"]) {
    
        if([ModeloLabel.text isEqualToString:@"7403 o 74SL03"]){
            
            NAndDiagram2Image = [UIImage imageNamed:@"NAND22 7401.png"];
            [DiagramaImage setImage:NAndDiagram2Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7401 o 74SL01"];

        }
        
        else if([ModeloLabel.text isEqualToString:@"7401 o 74SL01"]){
                    
            NandDiagram1Image = [UIImage imageNamed:@"NAND1 7400.png"];
            [DiagramaImage setImage:NandDiagram1Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7400 o 74SL00"];

        }
    }
    
    if ([CompuertaString isEqualToString:@"XOR"]) {
        
        if ([ModeloLabel.text isEqualToString:@"74136 o 74SL136"]) {
            
            XorDiagram1Image = [UIImage imageNamed:@"XOR1 7486.png"];
            [DiagramaImage setImage:XorDiagram1Image];
            
            ModeloLabel.text = [[NSString alloc]initWithFormat:@"7486 o 74SL86"];
            
        }
        
    }


    
}

- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Aqui encontraras el diagrama del circuito integrado que corresponde a la compuerta logica seleccionada anteriormente, lo puedes adquirir con el numero de circuito que aparece arriba del diagrama." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
    
}

- (IBAction)Atras:(id)sender {
    
    CompuertasView = [self.storyboard instantiateViewControllerWithIdentifier:@"Compuertalogica"];
    CompuertasView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:CompuertasView animated:YES completion:NULL];
}
- (void)viewDidUnload {
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end
