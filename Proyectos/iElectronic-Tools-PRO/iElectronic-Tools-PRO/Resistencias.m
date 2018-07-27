//
//  Resistencias.m
//  iElectronic-Tools-PRO
//
//  Created by Jose De Jesus Garfias Lopez on 22/11/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Resistencias.h"
#import "SWRevealViewController.h"


@interface Resistencias (){
    int NoBandas;

    NSMutableArray *viewArray;
    NSMutableArray *viewArray2;
    NSMutableArray *viewArray3;
}

@end

@implementation Resistencias
@synthesize ViewColor;
@synthesize ColorPicker;
@synthesize BandasSegment;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    
    //TAB BAR:
    //call the function and send the first object to execute the code for the first tab.
    [self tabBar:self.tabBar didSelectItem:[self.tabBar.items firstObject]];
    //select the firstobject of the tabbar.
    self.tabBar.selectedItem = [self.tabBar.items firstObject];
    
    
    //Arrays of colors:
    
    
    
    viewArray = [[NSMutableArray alloc] init];
    viewArray2 = [[NSMutableArray alloc]init];
    viewArray3 = [[NSMutableArray alloc]init];
    
    
    UIImage * negro = [UIImage imageNamed:@"Negro.png"];
    UIImage * marron = [UIImage imageNamed:@"Marron.png"];
    UIImage * rojo = [UIImage imageNamed:@"Rojo.png"];
    UIImage * naranja = [UIImage imageNamed:@"Naranja.png"];
    UIImage * amarillo = [UIImage imageNamed:@"Amarillo.png"];
    UIImage * verde = [UIImage imageNamed:@"Verde.png"];
    UIImage * azul = [UIImage imageNamed:@"Azul.png"];
    UIImage * violeta = [UIImage imageNamed:@"Violeta.png"];
    UIImage * gris = [UIImage imageNamed:@"Gris.png"];
    UIImage * blanco = [UIImage imageNamed:@"Blanco.png"];
    UIImage * oro = [UIImage imageNamed:@"Oro.png"];
    UIImage * plateado = [UIImage imageNamed:@"Plateado.png"];
    
    
    UIImageView *NegroView = [[UIImageView alloc] initWithImage: negro];
    UIImageView *MarronView = [[UIImageView alloc] initWithImage: marron];
    UIImageView *RojoView = [[UIImageView alloc] initWithImage: rojo];
    UIImageView *NaranjaView = [[UIImageView alloc] initWithImage: naranja];
    UIImageView *AmarilloView = [[UIImageView alloc] initWithImage: amarillo];
    UIImageView *VerdeView = [[UIImageView alloc] initWithImage: verde];
    UIImageView *AzulView = [[UIImageView alloc] initWithImage: azul];
    UIImageView *VioletaView = [[UIImageView alloc] initWithImage: violeta];
    UIImageView *GrisView = [[UIImageView alloc] initWithImage: gris];
    UIImageView *BlancoView = [[UIImageView alloc] initWithImage: blanco];
    UIImageView *OroView = [[UIImageView alloc] initWithImage: oro];
    UIImageView *PlateadoView = [[UIImageView alloc] initWithImage: plateado];
    
    
    [viewArray addObject:NegroView];
    [viewArray addObject:MarronView];
    [viewArray addObject:RojoView];
    [viewArray addObject:NaranjaView];
    [viewArray addObject:AmarilloView];
    [viewArray addObject:VerdeView];
    [viewArray addObject:AzulView];
    [viewArray addObject:VioletaView];
    [viewArray addObject:GrisView];
    [viewArray addObject:BlancoView];
    
    
    [viewArray2 addObject:MarronView];
    [viewArray2 addObject:RojoView];
    [viewArray2 addObject:OroView];
    [viewArray2 addObject:PlateadoView];
    
    
    [viewArray3 addObject:BlancoView];
    [viewArray3 addObject:VioletaView];
    [viewArray3 addObject:AzulView];
    [viewArray3 addObject:NaranjaView];
    [viewArray3 addObject:AmarilloView];
    [viewArray3 addObject:RojoView];
    [viewArray3 addObject:MarronView];
        
    
    
    
    ColorPicker.delegate = self;
    NoBandas = 4;
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item;
{
    switch (item.tag)
    {
        case 0:
            NSLog(@"Load view1");
            ViewColor.hidden = NO;
            break;
        case 1:
            NSLog(@"Load view2");
            ViewColor.hidden = YES;
            break;
    }
    
}

- (IBAction)BandaisChanged:(id)sender{

    switch (BandasSegment.selectedSegmentIndex) {
        case 0:
            NoBandas = 4;
            break;
        case 1:
            NoBandas = 5;
            break;
        case 2:
            NoBandas = 6;
            break;
            
        default:
            break;
    }
    
    [ColorPicker reloadAllComponents];

}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return NoBandas;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    if (NoBandas == 4) {
        
        switch (component) {
            case 0:
                return [viewArray count];
                break;
            case 1:
                return [viewArray count];
                break;
            case 2:
                return [viewArray count];
                break;
            case 3:
                return [viewArray2 count];
                break;
                
            default:
                break;
        }
    }
    
    if (NoBandas == 5) {
        
        
        
        switch (component) {
            case 0:
                return [viewArray count];
                break;
            case 1:
                return [viewArray count];
                break;
            case 2:
                return [viewArray count];
                break;
            case 3:
                return [viewArray count];
                break;
            case 4:
                return [viewArray2 count];
                break;
                
            default:
                break;
        }

        
    }
    
    if (NoBandas == 6) {
        
        
        switch (component) {
            case 0:
                return [viewArray count];
                break;
            case 1:
                return [viewArray count];
                break;
            case 2:
                return [viewArray count];
                break;
            case 3:
                return [viewArray count];
                break;
            case 4:
                return [viewArray2 count];
                break;
            case 5:
                return [viewArray3 count];
                break;
                
            default:
                break;
        }

    }
    
    return 0;
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    
    UIView * myView;
    
    if (NoBandas == 4) {
        
        if (component == 0 || component == 1 || component == 2) {
            
            myView = [viewArray objectAtIndex:row];
        }
        
        if (component == 3) {
            
            myView = [viewArray2 objectAtIndex:row];
        }

    }
    
    if (NoBandas == 5) {
        
        
        if (component == 0 || component == 1 || component == 2 || component == 3) {
            
            myView = [viewArray objectAtIndex:row];
            
        }
        
        if (component == 4) {
            
            myView = [viewArray2 objectAtIndex:row];
        }
        

    }
    
    if (NoBandas == 6) {
        
        if (component == 0 || component == 1 || component == 2 || component == 3) {
            
            myView = [viewArray objectAtIndex:row];
            
        }
        
        if (component == 4) {
            
            myView = [viewArray2 objectAtIndex:row];
        }
        
        if (component == 5) {
            
            myView = [viewArray3 objectAtIndex:row];

        }
        
    }
    
    
    // first convert to a UIImage
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // then convert back to a UIImageView and return it
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
    
}



@end
