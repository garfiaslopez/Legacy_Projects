//
//  PaginaWeb.m
//  ExpoAcustica-IPN
//
//  Created by Jose De Jesus Garfias Lopez on 21/01/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "PaginaWeb.h"

@interface PaginaWeb ()

@end

@implementation PaginaWeb
@synthesize MainWeb;


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
    
    NSURL *url = [NSURL URLWithString:@"http://www.expoacustica.ipn.mx/inicio.html"];
    NSURLRequest *loadURL =[[NSURLRequest alloc] initWithURL:url];
    
    [MainWeb loadRequest:loadURL];
    [MainWeb scalesPageToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end