//
//  Servicios.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Servicios.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Gasto.h"
#import "Servicio.h"
#import "Venta.h"

//picker:

#import "ELCImagePickerController.h"
#import "ELCAlbumPickerController.h"
#import "ELCAssetTablePicker.h"


@interface Servicios ()
{
    NSMutableArray *EmpresasArray;
    Empleado *UsuarioSesion;
    UIImage *ImagePicked;

    
}
@property (nonatomic, strong) ALAssetsLibrary *specialLibrary;
@end


@implementation Servicios
@synthesize BackgroundImage;
@synthesize ConceptoTextField;
@synthesize PrecioTextField;
@synthesize InvenTextField;
@synthesize LogoServImageView;
@synthesize ImageButton;
@synthesize ServiciosTableView;
@synthesize IndexEnterprise;
@synthesize MainScroller;
@synthesize EditServButton;
//Picker:
@synthesize imagePickerController;
@synthesize elcPicker;

-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    EmpresasArray = [[NSMutableArray alloc]init];
    UsuarioSesion = [[Empleado alloc]init];
    
    [self RecargarDatos];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    
}

-(void)RecargarDatos
{
    
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    UsuarioSesion = [self LoadEmpleado:@"Sesion"];

    [ServiciosTableView reloadData];
}
- (IBAction)Atras:(id)sender
{
 
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)keyboardDidShow:(NSNotification *)notification {
    
    self.MainScroller.contentSize=CGSizeMake(1024,720);
    
    if (ConceptoTextField.editing) {
        CGPoint bottomOffset = CGPointMake(0, self.MainScroller.contentSize.height - self.MainScroller.bounds.size.height);
        [self.MainScroller setContentOffset:bottomOffset animated:YES];
    }
    
    
}

-(void)dismissKeyboard {
    [ConceptoTextField resignFirstResponder];
    [PrecioTextField resignFirstResponder];
    [InvenTextField resignFirstResponder];
    
}

- (IBAction)Guardar:(id)sender
{
    
    if (![ConceptoTextField.text isEqual:@""] && ![PrecioTextField.text isEqual:@""] && ![InvenTextField.text isEqual:@""]) {
        
        
        bool encontrado = false;
        
        //Realizar busqueda para reemplazar:
        for (int i = 0; i<[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] count]; i++)
        {
            
            if ([ConceptoTextField.text isEqual:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios]objectAtIndex:i] Concepto]])
            {
                NSLog(@"ENCONTRADO SERV");
                encontrado = true;
                [[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:i] setPrecio:[PrecioTextField.text doubleValue]];
                
                [[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:i] setCantidad:[InvenTextField.text intValue]];
                
            }
        }
        
        if (encontrado == false) {
            
            //SAVE:
            NSLog(@"AGREGAR NUEVO SERV");
            
            Servicio *ServTemp;
            ServTemp = [[Servicio alloc]init];
            
            [ServTemp setConcepto:ConceptoTextField.text];
            [ServTemp setPrecio:[PrecioTextField.text doubleValue]];
            [ServTemp setCantidad:[InvenTextField.text intValue]];
            [ServTemp setImagen:ImagePicked];
            
            [[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] addObject:ServTemp];
            
        }
        
        [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
        
        ConceptoTextField.text = @"";
        PrecioTextField.text = @"";
        InvenTextField.text = @"";
        
        [LogoServImageView setImage:nil];
        ImagePicked = nil;
        ImageButton.hidden = NO;
        
        
        UIAlertView *exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha guardado." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [exito show];
        
        [self RecargarDatos];
    
    }
    else
    {
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Rellena todos los campos para poder agregar un servicio." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [error show];
    }
    
    
    
}

- (IBAction)Borrar:(id)sender
{
    
    ConceptoTextField.text = @"";
    PrecioTextField.text = @"";
    InvenTextField.text = @"";
    
}



- (IBAction)SelectPhoto:(id)sender
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    self.specialLibrary = library;
    NSMutableArray *groups = [NSMutableArray array];
    [_specialLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [groups addObject:group];
        } else {
            // this is the end
            [self displayPickerForGroup:[groups objectAtIndex:0]];
        }
    } failureBlock:^(NSError *error) {
        //self.chosenImages = nil;
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Album Error: %@ - %@", [error localizedDescription], [error localizedRecoverySuggestion]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
        NSLog(@"A problem occured %@", [error description]);
        // an error here means that the asset groups were inaccessable.
        // Maybe the user or system preferences refused access.
    }];
    
    
    ImageButton.hidden = YES;
    
}


- (IBAction)EditarTableView:(id)sender
{
    if (ServiciosTableView.editing == NO) {
        [ServiciosTableView setEditing:YES animated:YES];
        [EditServButton setTitle:@"Aceptar" forState:UIControlStateNormal];
    }
    else
    {
        [ServiciosTableView setEditing:NO animated:NO];
        [EditServButton setTitle:@"Editar" forState:UIControlStateNormal];
        
        [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
        [self RecargarDatos];
    }
}




#pragma mark - UITableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    [cell.imageView setImage:[[[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] objectAtIndex:indexPath.row] Imagen]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d - %@", [[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Cantidad],[[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Concepto]];
    
    cell.detailTextLabel.text = [[NSString alloc]initWithFormat:@"$%.2f",[[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Precio]];
    
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    
    
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    //Even if the method is empty you should be seeing both rearrangement icon and animation.
    
    
    [[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios] exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
    
    
    [tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[[EmpresasArray objectAtIndex:IndexEnterprise] Servicios]removeObjectAtIndex:indexPath.row];
    
    [self saveArrayOfCustomObjects:EmpresasArray key:@"Empresas"];
    
    [self RecargarDatos];
    
    ConceptoTextField.text = @"";
    PrecioTextField.text = @"";
    InvenTextField.text = @"";
    
    
    UIAlertView *exito = [[UIAlertView alloc]initWithTitle:@"Correcto" message:@"Se ha borrado." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [exito show];
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     
     self.Resistencias.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"PatternViewFlipsideBG.tiff"]];
     */
}

#pragma mark - UITableView Delegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ConceptoTextField.text = [[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Concepto];
    
    PrecioTextField.text = [[NSString alloc]initWithFormat:@"%.2f",[[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Precio]];
    
    InvenTextField.text = [NSString stringWithFormat:@"%d",[[[[EmpresasArray objectAtIndex:IndexEnterprise]Servicios] objectAtIndex:indexPath.row] Cantidad]];

}


- (void)displayPickerForGroup:(ALAssetsGroup *)group
{
    //load framwork:
	ELCAssetTablePicker *tablePicker = [[ELCAssetTablePicker alloc] initWithStyle:UITableViewStylePlain];
    tablePicker.singleSelection = YES;
    tablePicker.immediateReturn = YES;
    
	elcPicker = [[ELCImagePickerController alloc] initWithRootViewController:tablePicker];
    elcPicker.maximumImagesCount = 1;
    elcPicker.imagePickerDelegate = self;
    elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
	tablePicker.parent = elcPicker;
    
    // Move me
    tablePicker.assetGroup = group;
    [tablePicker.assetGroup setAssetsFilter:[ALAssetsFilter allAssets]];
    
    [self presentViewController:elcPicker animated:YES completion:nil];
}


#pragma mark ELCImagePickerControllerDelegate Methods

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
	
    for (NSDictionary *dict in info) {
        //image has the image selected by user
        UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];
        [LogoServImageView setImage:image];
        
        ImagePicked = image;
	}
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    //close the views
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (Empleado *)LoadEmpleado:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    Empleado *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

-(NSMutableArray *)loadArrayOfCustomObjectsWithKey:(NSString *)Key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:Key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
}

-(void)saveArrayOfCustomObjects:(NSMutableArray*)Arreglo key:(NSString*)Key{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:Arreglo];
    NSUserDefaults *Salvar = [NSUserDefaults standardUserDefaults];
    [Salvar setObject:encodedObject forKey:Key];
    [Salvar synchronize];
}



-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}



@end
