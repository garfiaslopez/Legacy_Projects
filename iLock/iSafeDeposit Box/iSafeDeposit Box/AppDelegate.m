//
//  AppDelegate.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MusicView.h"



@implementation AppDelegate{
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
    NSInteger Count = [ContadorUserDefault integerForKey:@"IntegerCount"];
    
    Count++;
    
    [ContadorUserDefault setInteger: Count forKey:@"IntegerCount"];
    [ContadorUserDefault synchronize];
    
    
    if (Count == 15 || Count == 30 || Count == 60 || Count == 90) {
        
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"¿Te gustó o te ha sido útil iSafeDeposit Box?" message:@"Por favor calificame o dejame algun comentario, sugerencia, chiste, critica o reseña en la appstore. Gracias." delegate:self cancelButtonTitle:@"No, Gracias." otherButtonTitles:@"¡Ok! Calificar Ahora",@"No preguntar de nuevo.",nil];
        
        [error show];
    }
    
    NSLog(@"Abridas %d",Count);

    
  //  [self Navigation];
    
    return YES;
}

-(void)Navigation{
    
    UITabBar *MainTabBar = [UITabBar appearance];
    [MainTabBar setBackgroundImage:[UIImage imageNamed:@"Nav.png"]];

}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		NSLog(@"0");
	}
	if (buttonIndex == 1) {
        NSLog(@"1");
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/ilock-pro/id794903165?l=es&ls=1&mt=8"]];
        
    }
    if (buttonIndex == 2) {
        NSLog(@"2");
        
        NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
        NSInteger CountCancel = 100;
        
        [ContadorUserDefault setInteger: CountCancel forKey:@"IntegerCount"];
        [ContadorUserDefault synchronize];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"Se minimizo, puedo regresar a la pantalla principal");
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"Se Maximizo, puedo regresar a la pantalla principal");
    
    MusicView *introClip = [[MusicView alloc]init];
    
    [introClip stop:introClip];
    
    [introClip performSelector:@selector(stop:) withObject:introClip];
    
    int EntrysApp;
    
    NSUserDefaults *ContadorUserDefault = [NSUserDefaults standardUserDefaults];
    EntrysApp = [ContadorUserDefault integerForKey:@"IntegerCount"];
    [ContadorUserDefault synchronize];
    
    NSLog(@"LO QUE VALE ENTRYSAPP%d",EntrysApp);
    
    if (EntrysApp == 1) {
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        UIViewController *Bienvenida = (UIViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"BienvenidaSB"];
        
        //set the root controller to it
        self.window.rootViewController = Bienvenida;
        EntrysApp++;
        [ContadorUserDefault setInteger: EntrysApp forKey:@"IntegerCount"];
        [ContadorUserDefault synchronize];
            
        
    }
    else{
        
        
        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        UIViewController *PasswordView = (UIViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"PasswordView"];
        self.window.rootViewController = PasswordView;

        //UITabBarController *mainwindows = (UITabBarController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"mainWindowTab"];
    
        //set the root controller to it
        //self.window.rootViewController = mainwindows;

        
       // [self.window.rootViewController presentViewController:PasswordView animated:YES completion:NULL];
        
    }
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
