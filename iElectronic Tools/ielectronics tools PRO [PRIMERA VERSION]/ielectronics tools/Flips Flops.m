//
//  Flips Flops.m
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 25/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Flips Flops.h"

@interface Flips_Flops ()

@end

@implementation Flips_Flops
@synthesize TituloNav;
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
        self.Scroller.contentSize=CGSizeMake(320,887);

        
    }
    else{
        [Scroller setScrollEnabled:YES];
        self.Scroller.contentSize=CGSizeMake(320,987);
    }
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
- (IBAction)Inicio:(id)sender {

    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    

}


- (IBAction)Ayuda:(id)sender {
    
    UIAlertView *error = [[UIAlertView alloc]initWithTitle:nil message:@"4 Diferentes tipos de FlipFlops, Diagrama, Formula y Tabla de verdad" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [error show];
    
}
@end
