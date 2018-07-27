//
//  Empresas.m
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Empresas.h"
#import "EmpresaCollection.h"
#import "Empresa.h"
#import "Empleado.h"
#import "Venta.h"
#import "Gasto.h"
#import "ConfigInicial.h"
#import "Login.h"
#import "ConfigEmpresas.h"


@interface Empresas ()
{
    NSMutableArray *EmpresasArray;
    
}
@end

@implementation Empresas
@synthesize EmpresasCollectionView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    EmpresasArray = [[NSMutableArray alloc]init];

}

-(void)viewDidAppear:(BOOL)animated
{
    
    //revisa si ya guardo las configuraciones iniciales:
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
    BOOL Count = [ContadorUserDefault boolForKey:@"FirstSession"];
    
    [ContadorUserDefault setBool: Count forKey:@"FirstSession"];
    [ContadorUserDefault synchronize];
    
    if (Count == NO) //sino desplega la vista de configuracion inicial:
    {
        UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        
        FirstView = [Main instantiateViewControllerWithIdentifier:@"InitialSetUp"];
        FirstView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:FirstView animated:YES completion:NULL];
    }
    

    
    [self ReloadData];

    [EmpresasCollectionView reloadData];
}

-(void)ReloadData
{
    EmpresasArray = [self loadArrayOfCustomObjectsWithKey:@"Empresas"];
    
    NSLog(@"NUMBEROFENTERPRISES: %lu",[EmpresasArray count]);
    
}


- (IBAction)Configuracion:(id)sender
{
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    ConfigEmpresasView = [Main instantiateViewControllerWithIdentifier:@"ConfigEmpresasView"];
    ConfigEmpresasView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:ConfigEmpresasView animated:YES completion:NULL];
    
    
}



#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return EmpresasArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    EmpresaCollection *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Celda" forIndexPath:indexPath];
    
    cell.NombreCell.text = [[EmpresasArray objectAtIndex:indexPath.row] Nombre];
    
    [cell.LogotipoCell setImage:[[EmpresasArray objectAtIndex:indexPath.row] LogoEnterprise]];
    
    //cell.ImagenFondoCell.image = [UIImage imageNamed:@""];

    cell.VentasCell.text = [NSString stringWithFormat:@"$%.2f",[self TotalVentasEmpresa:(int)indexPath.row]];
    cell.GastosCell.text = [NSString stringWithFormat:@"$%.2f",[self TotalGastosEmpresa:(int)indexPath.row]];
    cell.EmpleadosCell.text = [NSString stringWithFormat:@"%lu",[[[EmpresasArray objectAtIndex:indexPath.row] Empleados] count]];
    
    
    
    return cell;
    
}
/*
 
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return nil;
 }
 */


#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *Main = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    LoginView = [Main instantiateViewControllerWithIdentifier:@"LoginView"];
    LoginView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    LoginView.IndexEnterprise = indexPath.row;
    
    [self presentViewController:LoginView animated:YES completion:NULL];

}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{

}




#pragma mark Collection view layout things

// Layout: Set cell size
/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
 
 CGSize mElementSize = CGSizeMake(104, 104);
 return mElementSize;
 }*/

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 15.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 45.0;
}



-(double)TotalVentasEmpresa:(int)index
{
    
    double Suma=0.0;
    
    for ( int i = 0; i<[[[EmpresasArray objectAtIndex:index] Empleados] count]; i++) {
        
        for ( int j=0; j< [[[[[EmpresasArray objectAtIndex:index] Empleados] objectAtIndex:i] Ventas] count]; j++) {
            
            Suma = Suma + [[[[[[EmpresasArray objectAtIndex:index]Empleados] objectAtIndex:i] Ventas] objectAtIndex:j] Total];
            
        }
    }

    return Suma;
    
}

-(double)TotalGastosEmpresa:(int)index
{
    double Suma = 0.0;
    
    for ( int i = 0; i<[[[EmpresasArray objectAtIndex:index] Empleados] count]; i++) {
        
        for ( int j=0; j< [[[[[EmpresasArray objectAtIndex:index]Empleados] objectAtIndex:i] Gastos] count]; j++) {
            
            Suma = Suma + [[[[[[EmpresasArray objectAtIndex:index]Empleados] objectAtIndex:i] Gastos] objectAtIndex:j] Precio];
            
        }
    }
    return Suma;
    
}





//METODOS:


-(NSMutableArray *)loadArrayOfCustomObjectsWithKey:(NSString *)Key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:Key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
}



-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

@end
