//
//  SerieParaleloTest.m
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 07/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "SerieParaleloTest.h"

@interface SerieParaleloTest ()

@end

@implementation SerieParaleloTest
@synthesize Resistencias;
@synthesize Valores;
@synthesize ResultadoLabel;
@synthesize ResultadoLabel1;
@synthesize SerieParalelo;
@synthesize NumResistencia;
@synthesize TituloNav;
@synthesize SerieLabel;
@synthesize ParaleloLabel;
@synthesize Scroller;

double resultado=0,tmp=0,resultado1=0,tmp1=0,tmp2=0;

int NumResis=3;



-(IBAction)inicio:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
    
    
    [self.TituloNav setTitleTextAttributes:@{
                                             UITextAttributeFont:[UIFont fontWithName:@"SparTakus Round" size:13],
                                             UITextAttributeTextColor:[UIColor whiteColor]
                                             }];
    
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    ResultadoLabel.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoLabel1.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    
    
    Valores = [[NSMutableArray alloc]init];
    NumResistencia = [[NSMutableArray alloc]init];
    
    
    resultado=0;
    resultado1=0;
    tmp=0;
    tmp1=0;
    tmp2=0;
    
    for (int i=0; i<Valores.count; i++) {
        
        tmp = [[Valores objectAtIndex:i]integerValue];
        tmp1= [[Valores objectAtIndex:i]integerValue];
        tmp1=1/tmp1;
        
        resultado = resultado+tmp;
        
        tmp2 = tmp2+tmp1;
        resultado1 = 1/tmp2;
    }
    
    ResultadoLabel.text = [[NSString alloc]initWithFormat:@"%.2f",resultado];
    ResultadoLabel1.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [Resistencias setEditing:editing animated:animated];
    
}

- (IBAction)AddItem:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Nuevo" message:@"Inserta el valor de la nueva resistencia en Ohms" delegate:self cancelButtonTitle:@"Cancelar "otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alert textFieldAtIndex:0]setKeyboardType:UIKeyboardTypeDecimalPad];
    [alert show];

}

- (IBAction)LimpiarTabla:(id)sender {
    
    [Valores removeAllObjects];
    [Resistencias reloadData];
    
}


#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return Valores.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewStyleGrouped reuseIdentifier:cellIdentifier];
    }
    
    
    cell.textLabel.text = [NumResistencia objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [Valores objectAtIndex:indexPath.row];

    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor brownColor];
    
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        
        [Valores removeObjectAtIndex:indexPath.row];
        [NumResistencia removeObjectAtIndex:indexPath.row];
      //  NumResis--;
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        resultado=0;
        resultado1=0;
        tmp=0;
        tmp1=0;
        tmp2=0;
        
        for (int i=0; i<Valores.count; i++) {
            
            tmp = [[Valores objectAtIndex:i]integerValue];
            tmp1= [[Valores objectAtIndex:i]integerValue];
            tmp1=1/tmp1;
            
            resultado = resultado+tmp;
            
            tmp2 = tmp2+tmp1;
            resultado1 = 1/tmp2;
        }
        
        ResultadoLabel.text = [[NSString alloc]initWithFormat:@"%.2f",resultado];
        ResultadoLabel1.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1];

    }

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];

    self.Resistencias.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     */
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    

}

#pragma mark - UIAlertViewDelegate methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
        //se mete el vaor al arreglo y a la tabla.
        NSString *temptextfield = [alertView textFieldAtIndex:0].text;
        
        if (!Valores) {
            Valores = [[NSMutableArray alloc]init];
        }
        
        if ([temptextfield isEqual:@""]) {
            
        }
        else{
            if (Valores.count == 0) {
                NumResis = 0;
            }
            NumResis++;
            
            NSString *tmpnumres = [[NSString alloc]initWithFormat:@"Resistencia %d",NumResis];
            [Valores insertObject:temptextfield atIndex:0];
            [NumResistencia insertObject:tmpnumres atIndex:0];
            
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
            
            [self.Resistencias insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        //se hace la suma de los valores en el arreglo.
        resultado=0;
        resultado1=0;
        tmp=0;
        tmp1=0;
        tmp2=0;
        
        for (int i=0; i<Valores.count; i++) {
            
            tmp = [[Valores objectAtIndex:i]integerValue];
            tmp1= [[Valores objectAtIndex:i]integerValue];
            tmp1=1/tmp1;
            
            resultado = resultado+tmp;
            
            tmp2 = tmp2+tmp1;
            resultado1 = 1/tmp2;
        }
        
        ResultadoLabel.text = [[NSString alloc]initWithFormat:@"%.2f",resultado];
        ResultadoLabel1.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1];
      
        
    }

}

- (void)viewDidUnload {
    [self setSerieLabel:nil];
    [self setParaleloLabel:nil];
    [self setTituloNav:nil];
    [self setScroller:nil];
    [super viewDidUnload];
}
@end