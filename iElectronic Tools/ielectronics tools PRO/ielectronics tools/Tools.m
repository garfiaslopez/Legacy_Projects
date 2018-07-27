//
//  Tools.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import "Tools.h"
#import "CalcResistor4.h"

@interface Tools ()

@end

@implementation Tools

-(IBAction)loadfourbands:(id)sender{

    fourbands = [self.storyboard instantiateViewControllerWithIdentifier:@"fourbands"];
    
    fourbands.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:fourbands animated:YES completion:NULL];

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
