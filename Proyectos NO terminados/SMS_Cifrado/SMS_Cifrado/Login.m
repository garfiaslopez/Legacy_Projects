//
//  Login.m
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "Login.h"

@interface Login ()
{

    UITapGestureRecognizer *tap;

}

@end

@implementation Login
@synthesize NombreTextField;
@synthesize PassServerTextField;
@synthesize CorreoTextField;


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
    
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
}


-(void)dismissKeyboard
{
    
    [NombreTextField resignFirstResponder];
    [PassServerTextField resignFirstResponder];
    [CorreoTextField resignFirstResponder];

}

- (void)keyboardDidShow:(NSNotification *)notification
{
    
    [self.view addGestureRecognizer:tap];
    
    
}

- (void)keyboardDidHide:(NSNotification *)notification {
    
    [self.view removeGestureRecognizer:tap];
    
}


- (IBAction)Login:(id)sender
{
    
    
    
}
@end
