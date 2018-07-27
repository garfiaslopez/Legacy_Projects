//
//  DescifrarMensajeMenu.m
//  SMS_Cifrado
//
//  Created by Jose De Jesus Garfias Lopez on 30/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "DescifrarMensajeMenu.h"

@interface DescifrarMensajeMenu ()
{

    UITapGestureRecognizer *tap;

}

@end

@implementation DescifrarMensajeMenu
@synthesize MensajeView;

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getClipboardString)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    MensajeView.text = [UIPasteboard generalPasteboard].string;
    
}


-(void)viewWillDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)getClipboardString
{
    MensajeView.text = [UIPasteboard generalPasteboard].string;
    
}

-(void)dismissKeyboard
{
    
    [MensajeView resignFirstResponder];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    
    [self.view addGestureRecognizer:tap];
    
    
}

- (void)keyboardDidHide:(NSNotification *)notification {
    
    [self.view removeGestureRecognizer:tap];
    
}

- (IBAction)Cancel:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
