//
//  TableNotes.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 16/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "TableNotes.h"
#import "ViewNotes.h"



@interface TableNotes ()

@end

@implementation TableNotes
@synthesize TableViewNotes;
@synthesize ArregloBodyNotas;
@synthesize ArregloTituloNotas;



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
    
    
    NSLog(@"SE CARGAN LOS ARREGLOS BUENO SE RELLENA EL NSMUTABLE ARRAY");
    
    ArregloTituloNotas = [[NSMutableArray alloc]init];
    
    ArregloBodyNotas = [[NSMutableArray alloc]init];
    
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    
    ArregloTituloNotas = [[Salvar objectForKey:@"Titulos"]mutableCopy];
    ArregloBodyNotas = [[Salvar objectForKey:@"Notas"]mutableCopy];
    
    
    NSLog(@"%d",ArregloBodyNotas.count);
    NSLog(@"%d",ArregloTituloNotas.count);
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArregloTituloNotas.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArregloBodyNotas.count);

    
    for (int i=0; i<ArregloTituloNotas.count; i++) {
        NSLog(@"%@",ArregloTituloNotas[i]);
    }
    
    for (int i=0; i<ArregloBodyNotas.count; i++) {
        NSLog(@"%@",ArregloBodyNotas[i]);
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    NSLog(@"DEBIO APARECER LA JODIDA VISTA");
    
    //NOESTAMAL:
    
    NSUserDefaults *RecuperarNotas = [[NSUserDefaults alloc]init];
    
    //Recuperar el Arreglo de notas:
    
    ArregloBodyNotas = [[RecuperarNotas objectForKey:@"Notas"]mutableCopy];
    
    //Recuperar el areglo de titulos:
    
    ArregloTituloNotas = [[RecuperarNotas objectForKey:@"Titulos"]mutableCopy];
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArregloTituloNotas.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArregloBodyNotas.count);

    for (int i=0; i<ArregloTituloNotas.count; i++) {
        NSLog(@"%@",ArregloTituloNotas[i]);
    }
    
    for (int i=0; i<ArregloBodyNotas.count; i++) {
        NSLog(@"%@",ArregloBodyNotas[i]);
    }
    
    [self->TableViewNotes reloadData];

}

- (IBAction)AddNote:(id)sender {
    
    
    UIAlertView *Recibetitulo = [[UIAlertView alloc]initWithTitle:@"Title of note" message:Nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    Recibetitulo.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[Recibetitulo textFieldAtIndex:0]setKeyboardType:UIKeyboardTypeDefault];

    [Recibetitulo show];
    
    
}

#pragma mark - UIAlertViewDelegate methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        NSLog(@"ENTRO EN 1");
        
        //se mete el valor al arreglo y a la tabla.
        
        NSString *temptextfield = [alertView textFieldAtIndex:0].text;
        
        if (!ArregloTituloNotas) {
            ArregloTituloNotas = [[NSMutableArray alloc]init];
        }
        if (!ArregloBodyNotas) {
            ArregloBodyNotas = [[NSMutableArray alloc]init];
        }
        if ([temptextfield isEqual:@""]) {
            NSLog(@"NO HACE NADA");
        }
        else{
            NSLog(@"DEBIO ENTRAR A GUARDAR COSAS AL ARREGLO");
            
            [ArregloTituloNotas addObject:temptextfield];
            [ArregloBodyNotas addObject:@"(Empty)"];
            
            //SALVAR
            
            NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
            [Salvar setObject:ArregloBodyNotas forKey:@"Notas"];
            [Salvar setObject:ArregloTituloNotas forKey:@"Titulos"];
          //  [Salvar synchronize];
            
            
            NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArregloTituloNotas.count);
            NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArregloBodyNotas.count);
            
            for (int i=0; i<ArregloTituloNotas.count; i++) {
                NSLog(@"%@",ArregloTituloNotas[i]);
            }
            
            for (int i=0; i<ArregloBodyNotas.count; i++) {
                NSLog(@"%@",ArregloBodyNotas[i]);
            }
            
            [self->TableViewNotes reloadData];
            
        }
        
    }
    if (buttonIndex == 0) {
        NSLog(@"ENTRO EN EL 0");
    }
    
    if (buttonIndex == 2) {
        NSLog(@"Entro en el 2");
    }
    
}



#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ArregloTituloNotas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [ArregloTituloNotas objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [ArregloBodyNotas objectAtIndex:indexPath.row];
    
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
               //se elimina el valor del arreglo y de la tabla.
        
        [ArregloBodyNotas removeObjectAtIndex:indexPath.row];
        [ArregloTituloNotas removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //salvar en nsuserdefaults
        
        for (int i=0; i<ArregloBodyNotas.count; i++) {
            NSLog(@"%@",ArregloBodyNotas[i]);
        }
        
        NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
        [Salvar setObject:ArregloBodyNotas forKey:@"Notas"];
        [Salvar setObject:ArregloTituloNotas forKey:@"Titulos"];
        [Salvar synchronize];
        
        NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArregloTituloNotas.count);
        NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArregloBodyNotas.count);

        for (int i=0; i<ArregloTituloNotas.count; i++) {
            NSLog(@"%@",ArregloTituloNotas[i]);
        }
        
        for (int i=0; i<ArregloBodyNotas.count; i++) {
            NSLog(@"%@",ArregloBodyNotas[i]);
        }
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
   /* cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
    
    self.TableViewNotes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];*/
    
}



#pragma mark - UITableView Delegate methods


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    NSUInteger row = [indexPath row];
    
    NSLog(@"Numero de celda:%i",row);
    
    NSUserDefaults *salvarcelda = [[NSUserDefaults alloc]init];
    
    [salvarcelda setInteger:row forKey:@"ValorCelda"];
        
    
    ViewNotesVista = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewNotesSB"];
    
    ViewNotesVista.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:ViewNotesVista animated:YES completion:NULL];
    
    
    NSLog(@"NUMERO DE ELEMENTOS EN TITULOS: %d",ArregloTituloNotas.count);
    NSLog(@"NUMERO DE ELEMENTOS EN NOTAS: %d",ArregloBodyNotas.count);
    
    for (int i=0; i<ArregloTituloNotas.count; i++) {
        NSLog(@"%@",ArregloTituloNotas[i]);
    }
    
    for (int i=0; i<ArregloBodyNotas.count; i++) {
        NSLog(@"%@",ArregloBodyNotas[i]);
    }
    
}

@end
