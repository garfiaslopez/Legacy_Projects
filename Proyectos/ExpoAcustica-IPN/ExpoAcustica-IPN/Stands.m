//
//  Stands.m
//  ExpoAcustica-IPN
//
//  Created by Jose De Jesus Garfias Lopez on 22/01/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Stands.h"

@interface Stands ()

@end

@implementation Stands


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
    
    
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:@"Stands"
                                                        ofType:@"png"];
    NSURL *url = [NSURL fileURLWithPath:pdfPath];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [webView setScalesPageToFit:YES];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
