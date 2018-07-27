//
//  Settings.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "Settings.h"

@interface Settings ()

@end

@implementation Settings
@synthesize SwitchDelete;
@synthesize OldPassField;
@synthesize NewPassField;
@synthesize EmailField;
@synthesize tabSelector;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [EmailField resignFirstResponder];
    [OldPassField resignFirstResponder];
    [NewPassField resignFirstResponder];


}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //when view is loaded check with the memory the state of the switch.
    
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];

    
    BOOL boton =[ContadorUserDefault boolForKey:@"deleteData"];
    
    if (boton) {
        [SwitchDelete setOn:YES];
    }
    else{
        [SwitchDelete setOn:NO];
    }
    
    //Recover email and putholder in textfield:
    
    NSString *email = [[NSString alloc]init];
    NSUserDefaults *recuperarmail = [NSUserDefaults standardUserDefaults];
    email = [recuperarmail objectForKey:@"emailtosend"];

    EmailField.placeholder = email;
    
    
    
    
    NSUserDefaults *recuperarTab = [NSUserDefaults standardUserDefaults];
    
    NSInteger tabrecuperada = [recuperarTab integerForKey:@"TabSettingInteger"];
    
    tabSelector.selectedSegmentIndex = tabrecuperada;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChangeStateDelete:(id)sender {
    NSLog(@"SE CAMBIO EL ESTADO DEL SWITCH");
    
    if (SwitchDelete.on){
        //Remember Login Details
        NSLog(@"EL SWITCH ESTA ENCENDIDO");
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        [ContadorUserDefault setBool:YES forKey:@"deleteData"];
        
        [ContadorUserDefault synchronize];
        

    }
    else{
        //Code something else
        
        NSLog(@"EL SWITCH ESTA APAGADO");
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        [ContadorUserDefault setBool:NO forKey:@"deleteData"];
        
        [ContadorUserDefault synchronize];
    }
    
}

- (IBAction)SaveEmail:(id)sender {
    
    
    NSString *email = EmailField.text;
    
    if ([email isEqual:@""]) {
        
        UIAlertView *msgError = [[UIAlertView alloc]initWithTitle:@"Error 'Empty field'" message:@"Please enter your email." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [msgError show];

    }
    else{
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        [ContadorUserDefault setObject:email forKey:@"emailtosend"];
        [ContadorUserDefault synchronize];
        
        UIAlertView *msgSaved = [[UIAlertView alloc]initWithTitle:@"e-Mail Saved" message:@"iSafeBox will send you emails when someone try to enter and failed the password." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [msgSaved show];
    
    }
}

- (IBAction)SaveNewPass:(id)sender {
    //recuperar la contraseña anterior..
    //escanear los nuevos campos...
    //comparar la anterior con el campo de OLD, si coinciden guardar el campo de New reemplazando el NSUSERDEFAULTS.
    
    
    
    NSUserDefaults *recuperarPass = [NSUserDefaults standardUserDefaults];
    
    NSInteger contravieja = [recuperarPass integerForKey:@"PassInteger"];
    
    NSInteger contraOldField = [OldPassField.text integerValue];
    
    int Passwordtosave = [NewPassField.text integerValue];
    
    
    
    if (contravieja == contraOldField && Passwordtosave != 0) {
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        [ContadorUserDefault setInteger: Passwordtosave forKey:@"PassInteger"];
        [ContadorUserDefault synchronize];

        UIAlertView *msgSaved = [[UIAlertView alloc]initWithTitle:@"New Password Saved" message:@"Now you can access whit this new password." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [msgSaved show];
        
    }
    else{
        UIAlertView *msgError = [[UIAlertView alloc]initWithTitle:@"Error Password" message:@"The Old password field doesnt match with the actual password." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        
        [msgError show];
    }
    
    

    
    //si las contraseñas coinciden
    
    
    
    //Reemplazar y dar este mensaje.

}

- (IBAction)changeTab:(id)sender {
    
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
    [ContadorUserDefault setInteger: tabSelector.selectedSegmentIndex forKey:@"TabSettingInteger"];
    [ContadorUserDefault synchronize];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return (newLength > 5) ? NO : YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}


@end
