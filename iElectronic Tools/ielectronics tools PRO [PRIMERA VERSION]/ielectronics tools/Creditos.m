//
//  Creditos.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 04/03/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Creditos.h"

@interface Creditos ()

@end

@implementation Creditos

-(IBAction)Cargafacebook:(id)sender{

     [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://www.facebook.com/josegarfiaslopez"]];
}

-(IBAction)Cargatwitter:(id)sender{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"https://twitter.com/garfiaslopez"]];

}

-(IBAction)inicio:(id)sender{
    
    UIStoryboard *InglesStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UIViewController *InicioInglesStoryboard = [InglesStoryboard instantiateInitialViewController];
    
    InicioInglesStoryboard.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:InicioInglesStoryboard animated:YES completion:NULL];
    
    
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
