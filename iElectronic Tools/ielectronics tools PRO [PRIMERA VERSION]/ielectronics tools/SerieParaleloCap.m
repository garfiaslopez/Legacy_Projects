//
//  SerieParaleloCap.m
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 08/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "SerieParaleloCap.h"

@interface SerieParaleloCap ()

@end

@implementation SerieParaleloCap
@synthesize ResultadoLabelPar1;
@synthesize ResultadoLabelSer;
@synthesize Capacitores;
@synthesize ValoresCap;
@synthesize NumCapacitor;
@synthesize ParaleloLabel;
@synthesize SerieLabel;
@synthesize Scroller;
@synthesize TituloNav;

double resultadocap=0,tmpcap=0,resultado1cap=0,tmp1cap=0,tmp2cap=0;

int Numerocap = 3;


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
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:NO];
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,592);
    }
    
    
    ParaleloLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    SerieLabel.font = [UIFont fontWithName:@"Coming Soon" size:20];
    
    ResultadoLabelPar1.font = [UIFont fontWithName:@"DS-Digital" size:60];
    ResultadoLabelSer.font = [UIFont fontWithName:@"DS-Digital" size:60];
    
    
    
    ValoresCap = [[NSMutableArray alloc]initWithObjects:@"100",@"1000",@"3000", nil];
    
    NumCapacitor = [[NSMutableArray alloc]initWithObjects:@"Capacitor 3",@"Capacitor 2",@"Capacitor 1", nil];
    
    resultadocap=0;
    resultado1cap=0;
    tmpcap=0;
    tmp1cap=0;
    tmp2cap=0;
    
    for (int i=0; i<ValoresCap.count; i++) {
        
        tmpcap = [[ValoresCap objectAtIndex:i]integerValue];
        tmp1cap= [[ValoresCap objectAtIndex:i]integerValue];
        tmp1cap=1/tmp1cap;
        
        resultadocap = resultadocap+tmpcap;
        
        tmp2cap = tmp2cap+tmp1cap;
        resultado1cap = 1/tmp2cap;
    }
    
    ResultadoLabelPar1.text = [[NSString alloc]initWithFormat:@"%.2f",resultadocap];
    ResultadoLabelSer.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1cap];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)inicio:(id)sender{
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
    
    
}
- (IBAction)AddCap:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Nuevo" message:@"Inserta el valor del nuevo capacitor en µf" delegate:self cancelButtonTitle:@"Cancelar "otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alert textFieldAtIndex:0]setKeyboardType:UIKeyboardTypeDecimalPad];
    [alert show];

    
}

- (IBAction)LimpiarTabla:(id)sender {
    
    [ValoresCap removeAllObjects];
    [Capacitores reloadData];
    
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
    [super setEditing:editing animated:animated];
    [Capacitores setEditing:editing animated:animated];
    
}

#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ValoresCap.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewStyleGrouped reuseIdentifier:cellIdentifier];
    }
    
    
    
    cell.textLabel.text = [NumCapacitor objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [ValoresCap objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor = [UIColor yellowColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //se elimina el valor del arreglo y de la tabla.
        [ValoresCap removeObjectAtIndex:indexPath.row];
        [NumCapacitor removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        resultadocap=0;
        resultado1cap=0;
        tmpcap=0;
        tmp1cap=0;
        tmp2cap=0;
        
        for (int i=0; i<ValoresCap.count; i++) {
            
            tmpcap = [[ValoresCap objectAtIndex:i]integerValue];
            tmp1cap= [[ValoresCap objectAtIndex:i]integerValue];
            tmp1cap=1/tmp1cap;
            
            resultadocap = resultadocap+tmpcap;
            
            tmp2cap = tmp2cap+tmp1cap;
            resultado1cap = 1/tmp2cap;
        }
        
        ResultadoLabelPar1.text = [[NSString alloc]initWithFormat:@"%.2f",resultadocap];
        ResultadoLabelSer.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1cap];
        
    }

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
    
    self.Capacitores.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
}


#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}



#pragma mark - UIAlertViewDelegate methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        //se mete el vaor al arreglo y a la tabla.
        NSString *temptextfield = [alertView textFieldAtIndex:0].text;
        
        if (!ValoresCap) {
            ValoresCap = [[NSMutableArray alloc]init];
        }
        
        if ([temptextfield isEqual:@""]) {
            
        }
        else{
            
            if (ValoresCap.count == 0) {
                Numerocap = 0;
            }
            
            
            Numerocap++;
            
            NSString *tmpnumcap = [[NSString alloc]initWithFormat:@"Capacitor %d",Numerocap];
            
            [ValoresCap insertObject:temptextfield atIndex:0];
            
            [NumCapacitor insertObject:tmpnumcap atIndex:0];
            
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
            
            [self.Capacitores insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        //se hace la suma de los valores en el arreglo.
        resultadocap=0;
        resultado1cap=0;
        tmpcap=0;
        tmp1cap=0;
        tmp2cap=0;
        
        for (int i=0; i<ValoresCap.count; i++) {
            
            tmpcap = [[ValoresCap objectAtIndex:i]integerValue];
            tmp1cap= [[ValoresCap objectAtIndex:i]integerValue];
            tmp1cap=1/tmp1cap;
            
            resultadocap = resultadocap+tmpcap;
            
            tmp2cap = tmp2cap+tmp1cap;
            resultado1cap = 1/tmp2cap;
        }
        
        ResultadoLabelPar1.text = [[NSString alloc]initWithFormat:@"%.2f",resultadocap];
        ResultadoLabelSer.text = [[NSString alloc]initWithFormat:@"%.2f",resultado1cap];
        
        
    }
    
}




- (void)viewDidUnload {
    [self setScroller:nil];
    [self setTituloNav:nil];
    [self setParaleloLabel:nil];
    [self setSerieLabel:nil];
    [super viewDidUnload];
}
@end
