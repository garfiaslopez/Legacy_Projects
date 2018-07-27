//
//  Accounts.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Accounts.h"

@interface Accounts ()

@end

@implementation Accounts
@synthesize TableViewAccounts;
@synthesize NombreArray;
@synthesize TipoArray;
@synthesize PassArray;
@synthesize TypeLabel;
@synthesize UserLabel;
@synthesize PasswordLabel;
@synthesize AddContactView;
@synthesize TypeTextField;
@synthesize UserTextField;
@synthesize PasswordTextField;
@synthesize Scroll;

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
    
    [Scroll setScrollEnabled:YES];
        
    TipoArray = [[NSMutableArray alloc]init];
    NombreArray = [[NSMutableArray alloc]init];
    PassArray = [[NSMutableArray alloc]init];
    
    
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    
    TipoArray = [[Salvar objectForKey:@"tipoCuenta"]mutableCopy];
    NombreArray = [[Salvar objectForKey:@"nombreCuenta"]mutableCopy];
    PassArray = [[Salvar objectForKey:@"passCuenta"]mutableCopy];
    
    
    NSLog(@"%d",TipoArray.count);
    NSLog(@"%d",NombreArray.count);
    NSLog(@"%d",PassArray.count);

    
    for (int i=0; i<TipoArray.count; i++) {
        NSLog(@"%@",TipoArray[i]);
    }
    
    for (int i=0; i<NombreArray.count; i++) {
        NSLog(@"%@",NombreArray[i]);
    }
    
    for (int i=0; i<PassArray.count; i++) {
        NSLog(@"%@",PassArray[i]);
    }

}

-(void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"APARECIO LA FUCKING PANTALLA");

    NSUserDefaults *Salvar = [[NSUserDefaults alloc]init];
    
    TipoArray = [[Salvar objectForKey:@"tipoCuenta"]mutableCopy];
    NombreArray = [[Salvar objectForKey:@"nombreCuenta"]mutableCopy];
    PassArray = [[Salvar objectForKey:@"passCuenta"]mutableCopy];
    
    [self->TableViewAccounts reloadData];

}

#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return TipoArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [TipoArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NombreArray objectAtIndex:indexPath.row];
    
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;
    
    if ([TipoArray[indexPath.row] isEqual:@"FACEBOOK"]||
        [TipoArray[indexPath.row] isEqual:@"Facebook"]||
        [TipoArray[indexPath.row] isEqual:@"facebook"]) {
        cell.imageView.image = [UIImage imageNamed:@"Facebook.png"];

    }
    if ([TipoArray[indexPath.row] isEqual:@"HOTMAIL"]||
        [TipoArray[indexPath.row] isEqual:@"hotmail"]||
        [TipoArray[indexPath.row] isEqual:@"outlook"]) {
        cell.imageView.image = [UIImage imageNamed:@"Outlook.png"];
    }
    
    if ([TipoArray[indexPath.row] isEqual:@"TARINGA"]||
        [TipoArray[indexPath.row]isEqual:@"taringa"]) {
        cell.imageView.image = [UIImage imageNamed:@"Taringa.png"];
    }
    
    return cell;

}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //se elimina el valor del arreglo y de la tabla.
        
        [NombreArray removeObjectAtIndex:indexPath.row];
        [TipoArray removeObjectAtIndex:indexPath.row];
        [PassArray removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
        
        [Salvar setObject:TipoArray forKey:@"tipoCuenta"];
        [Salvar setObject:NombreArray forKey:@"nombreCuenta"];
        [Salvar setObject:PassArray forKey:@"passCuenta"];
        
       // [Salvar synchronize];
        
        [self->TableViewAccounts reloadData];
        
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /* cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     
     self.TableViewNotes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];*/
    
}



#pragma mark - UITableView Delegate methods


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TypeLabel.text = [[NSString alloc]initWithString:TipoArray[indexPath.row]];
    UserLabel.text = [[NSString alloc]initWithString:NombreArray[indexPath.row]];
    PasswordLabel.text = [[NSString alloc]initWithString:PassArray[indexPath.row]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveAction:(id)sender {
    
    [PasswordTextField resignFirstResponder];
    [UserTextField resignFirstResponder];
    [TypeTextField resignFirstResponder];
    
    NSString*typeTmp = [[NSString alloc]initWithString:TypeTextField.text];
    NSString*userTmp = [[NSString alloc]initWithString:UserTextField.text];
    NSString*passTmp = [[NSString alloc]initWithString:PasswordTextField.text];
    
    
    if ([typeTmp isEqual:@""] || [userTmp isEqual:@""] || [passTmp isEqual:@""] ) {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Please don't leave spaces in blank" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
    else{
        if (!TipoArray) {
            TipoArray = [[NSMutableArray alloc]init];
        }
        if (!NombreArray) {
            NombreArray = [[NSMutableArray alloc]init];
        }
        if (!PassArray) {
            PassArray = [[NSMutableArray alloc]init];
        }
        
        [TipoArray addObject:typeTmp];
        [NombreArray addObject:userTmp];
        [PassArray addObject:passTmp];
        
        NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
        
        [Salvar setObject:TipoArray forKey:@"tipoCuenta"];
        [Salvar setObject:NombreArray forKey:@"nombreCuenta"];
        [Salvar setObject:PassArray forKey:@"passCuenta"];

      //  [Salvar synchronize];
        
        [self->TableViewAccounts reloadData];
        
        [UIView animateWithDuration:1.5 animations:^(){
            AddContactView.frame = CGRectMake(480, 63, 320, 170);
        }];
        
        TypeTextField.text = @"";
        UserTextField.text = @"";
        PasswordTextField.text = @"";
        
    }

}

- (IBAction)AddContact:(id)sender {
        
     [UIView animateWithDuration:1.0 animations:^(){
     AddContactView.frame = CGRectMake(0, 63, 320, 170);
 }];

    
}

- (IBAction)CancelButton:(id)sender {
    
    [PasswordTextField resignFirstResponder];
    [UserTextField resignFirstResponder];
    [TypeTextField resignFirstResponder];
    
    [UIView animateWithDuration:1.0 animations:^(){
        AddContactView.frame = CGRectMake(-320, 63, 320, 170);
    }];
    
    TypeTextField.text = @"";
    UserTextField.text = @"";
    PasswordTextField.text = @"";

}


@end
