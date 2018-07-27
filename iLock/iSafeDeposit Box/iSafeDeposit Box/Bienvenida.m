//
//  Bienvenida.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Bienvenida.h"
#import "Instructions.h"

@interface Bienvenida ()


@end

@implementation Bienvenida
@synthesize PasswordField;


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
    
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
    [ContadorUserDefault setInteger:2 forKey:@"TabSettingInteger"];
    [ContadorUserDefault synchronize];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)SaveButton:(id)sender {
    
    int Passwordtosave;
    
    Passwordtosave = [PasswordField.text integerValue];
    NSLog(@"LO QUE VALE PINCHI PASWORD %d",Passwordtosave);
    if (Passwordtosave!=0) {
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        [ContadorUserDefault setInteger: Passwordtosave forKey:@"PassInteger"];
        [ContadorUserDefault synchronize];
        
        
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Good" message:@"Keep Safe your personal password and don't forget it. \n To continue press the 'Start' button." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];

        
        instruccionesView = [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionsSB"];
        instruccionesView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:instruccionesView animated:YES completion:NULL];
        
        

    }
    else{
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please enter a 5 digits password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [error show];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 5) ? NO : YES;
}


@end
