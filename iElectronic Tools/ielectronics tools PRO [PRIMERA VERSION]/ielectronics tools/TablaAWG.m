//
//  TablaAWG.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 24/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "TablaAWG.h"

@interface TablaAWG ()

@end

@implementation TablaAWG
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
    
    [self.TituloNav setTitleTextAttributes:@{UITextAttributeFont:[UIFont fontWithName:@"Coming Soon" size:22]}];
    
   
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320, 1260);
        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,1263);
    }
    
    
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

- (void)viewDidUnload {
    [self setTituloNav:nil];
    [super viewDidUnload];
}
- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"Tabla con los valores en milimetros de los calibres AWG (american Wire Gauge)" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
}
@end
