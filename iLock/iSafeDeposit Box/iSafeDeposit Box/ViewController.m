//
//  ViewController.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "ViewController.h"
#import "Bienvenida.h"

@interface ViewController (){
    int Errores;
    int Touches;
    int EntrysApp;
    int passtmp;
    int password;
    NSMutableString *Password;
    NSString *email;
    
}

@end

@implementation ViewController
@synthesize Asterisco1;
@synthesize Asterisco2;
@synthesize Asterisco3;
@synthesize Asterisco4;
@synthesize Asterisco5;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Touches =0;
    Errores = 0;
    Password = [[NSMutableString alloc]init];
    
    Asterisco1.hidden = YES;
    Asterisco2.hidden = YES;
    Asterisco3.hidden = YES;
    Asterisco4.hidden = YES;
    Asterisco5.hidden = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Number0Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    
    if (Touches <5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"0"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
    
}

- (IBAction)Number1Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"1"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number2Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"2"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number3Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"3"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number4Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"4"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number5Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"5"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number6Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"6"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number7Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"7"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number8Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        
        [Password appendFormat:@"8"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

- (IBAction)Number9Action:(id)sender {
    Touches++;
    [self ComparationAsterisk];
    if (Touches <=5) {
        //guarda el valor  del numero pulsado en el arreglo.
        [Password appendFormat:@"9"];
    }
    if (Touches == 5) {
        [self ComparationPass];
    }
}

-(void)ComparationAsterisk{
    
    if (Touches == 1) {
        Asterisco1.hidden = NO;
    }
    if (Touches == 2) {
        Asterisco2.hidden = NO;
    }
    if (Touches == 3) {
        Asterisco3.hidden = NO;
    }
    if (Touches == 4) {
        Asterisco4.hidden = NO;
    }
    if (Touches == 5) {
        Asterisco5.hidden = NO;
    }
}


-(void)ComparationPass{

    passtmp = [Password integerValue];
    
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];

    password = [ContadorUserDefault integerForKey:@"PassInteger"];
    
    
    NSUserDefaults *recuperarTab = [NSUserDefaults standardUserDefaults];
    
    NSInteger tabrecuperada = [recuperarTab integerForKey:@"TabSettingInteger"];
    
    NSLog(@"%d",passtmp);
    NSLog(@"%d",password);
    if (passtmp == password) {
        
        UITabBarController *menu = [self.storyboard instantiateViewControllerWithIdentifier:@"mainWindowTab"];
        menu.selectedIndex=tabrecuperada;
        [self presentViewController:menu animated:YES completion:nil];
        
        
        Errores=0;

    }
    else{
        
        //Aqui poner el metodo de tomar foto y mandarla por email.
        Errores++;
        
        
        if (Errores<4) {
            //Se muestra el error.
            UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Wrong!" message:@"Password Incorrect!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [error show];
        }
        

        
        if (Errores == 4) {
            
            email = [[NSString alloc]initWithFormat:@""];

            NSUserDefaults *recuperarmail = [NSUserDefaults standardUserDefaults];
            email = [recuperarmail objectForKey:@"emailtosend"];
            NSLog(@"CORREO: %@",email);
            
            if (email.length == 0) {
                NSLog(@"NO HAY CORREO");
                //Errores = 0;
                
                UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Wrong!" message:@"Password Incorrect!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [error show];
                
                
            }
            else{
                
                UIAlertView *restorePass = [[UIAlertView alloc]initWithTitle:@"¿You Need Your pass?" message:@"A email is going to send you at your email with your password." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK Send Me.", nil];
                
                [restorePass show];
                
                //Errores = 0;
            }
            
        }
        
        if (Errores == 5) {
            //Advertir que se falta un intento y se va a borrar la informacion:D
            NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
            BOOL boton =[ContadorUserDefault boolForKey:@"deleteData"];
            
            if (boton==YES) {
                
                UIAlertView *restorePass = [[UIAlertView alloc]initWithTitle:@"¡Warning!" message:@"you failed 4 times the password, you only have 1 more chance to do it right." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                
                [restorePass show];
            }
            else{
                
                UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Wrong!" message:@"Password Incorrect!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                
                [error show];
                
            }

            
        }
        
        if (Errores == 6) {
            NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
            BOOL boton =[ContadorUserDefault boolForKey:@"deleteData"];
            if (boton==YES) {
                //DELETE FUCKING!!
                
                [[NSUserDefaults standardUserDefaults] setPersistentDomain:[NSDictionary dictionary] forName:[[NSBundle mainBundle] bundleIdentifier]];
                
                UIAlertView *restorePass = [[UIAlertView alloc]initWithTitle:@"¡Data Clear!" message:@"Your accounts, notes, emails, & all your data was deleted. \nDefault pass: 00000" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                
                [restorePass show];
                
                //check how to delete itunesfilesharing files for implementing in tables and this shit

            }
            else{
                UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Wrong!" message:@"Password Incorrect!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [error show];
                Errores = 0;
            }
            
            
            [ContadorUserDefault setInteger: 00000 forKey:@"PassInteger"];
            [ContadorUserDefault synchronize];
        }
        
        //
        
        
        
        
        //Se ocultan los asteriscos
        Asterisco1.hidden = YES;
        Asterisco2.hidden = YES;
        Asterisco3.hidden = YES;
        Asterisco4.hidden = YES;
        Asterisco5.hidden = YES;
        //se borra el temporal del pass y los touches
        [Password setString:@""];
        Touches = 0;

        
        
    }

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIAlertViewDelegate methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        
        
        MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc]init]; [mailcontroller setMailComposeDelegate:self];
        NSString *adress = email;
        NSArray *adressArray = [[NSArray alloc]initWithObjects:adress, nil];
        
        //attach a image:
       // UIImage *myImage = [UIImage imageNamed:@"Number 0.png"];
       // NSData *imageData = UIImagePNGRepresentation(myImage);
       //[mailcontroller addAttachmentData:imageData mimeType:@"image/png" fileName:@"Name"];

        //Recover the pass:
        int passwordinteger;
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        passwordinteger = [ContadorUserDefault integerForKey:@"PassInteger"];
        
        //Encoding the pass:
        NSString* myStr = [[NSString alloc]initWithFormat:@"This is your password for iSafeBox\n %d \n Thanks :D Have a nice day.",passwordinteger];
        NSData* cData = [myStr dataUsingEncoding:NSUTF8StringEncoding];
        
        //adding to the email:
        [mailcontroller addAttachmentData:cData mimeType:@"mime" fileName:@"PasswordRecover.txt"];
        
        [mailcontroller setMessageBody:@"This is a txt of your password for iSafeBox. \n\n\nSending from iSafeBox." isHTML:NO];
        [mailcontroller setToRecipients:adressArray];
        [mailcontroller setSubject:@"iSafeBox Password Recover."];
        
        [self presentViewController:mailcontroller animated:YES completion:nil];
    }

}



- (BOOL)shouldAutorotate {
    return NO;
}
@end
