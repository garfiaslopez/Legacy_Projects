//
//  DetalleConferencias.m
//  ExpoAcustica-IPN
//
//  Created by Jose De Jesus Garfias Lopez on 22/01/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "DetalleConferencias.h"

@interface DetalleConferencias ()

@end

@implementation DetalleConferencias
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

-(void)viewDidAppear:(BOOL)animated{


    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320, 504);
    }
    else{
        [MainScroller setScrollEnabled:YES];
        self.MainScroller.contentSize=CGSizeMake(320,604);
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
