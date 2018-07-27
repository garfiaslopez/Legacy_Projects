//
//  DecodeMessage.m
//  ChatCifrado
//
//  Created by Jose De Jesus Garfias Lopez on 22/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import "DecodeMessage.h"

@interface DecodeMessage()
{
    UITapGestureRecognizer *tap;
    
}

@end

@implementation DecodeMessage

@synthesize MessageView;



-(void)viewDidLoad
{

    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getClipboardString)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];

    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)getClipboardString
{
    MessageView.text = [UIPasteboard generalPasteboard].string;

}

-(void)dismissKeyboard
{

    [MessageView resignFirstResponder];
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    
    [self.view addGestureRecognizer:tap];

    
}

- (void)keyboardDidHide:(NSNotification *)notification {
    
    [self.view removeGestureRecognizer:tap];
    
}


@end
