//
//  About.m
//  ExpoAcustica-IPN
//
//  Created by Jose De Jesus Garfias Lopez on 21/01/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "About.h"

@interface About ()

@end

@implementation About

@synthesize MainScroller;


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


-(void)viewDidAppear:(BOOL)animated{
    
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320, 661);
    }
    else{
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320,761);
    }
    
    
}



- (IBAction)Close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
