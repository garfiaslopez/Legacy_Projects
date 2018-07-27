//
//  Instructions.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Instructions.h"

@interface Instructions ()

@end

@implementation Instructions

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

- (BOOL)shouldAutorotate {
    return NO;
}

- (IBAction)bingo:(id)sender {
    
    NSUserDefaults *recuperarTab = [NSUserDefaults standardUserDefaults];
    NSInteger tabrecuperada = [recuperarTab integerForKey:@"TabSettingInteger"];
    
    UITabBarController *tbc = [self.storyboard instantiateViewControllerWithIdentifier:@"mainWindowTab"];
    tbc.selectedIndex=tabrecuperada;
    [self presentViewController:tbc animated:YES completion:nil];

}
@end
