//
//  Login.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainWindow;

@interface Login : UIViewController
{

    MainWindow *MainView;
}


@property (weak, nonatomic) IBOutlet UITextField *UsuarioTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *PassTextField;
@property (nonatomic) NSInteger IndexEnterprise;



- (IBAction)Login:(id)sender;
- (IBAction)Atras:(id)sender;


@end
