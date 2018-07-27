//
//  Bienvenida.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Instructions;

@interface Bienvenida : UIViewController<UITextFieldDelegate>{

    Instructions *instruccionesView;

}


@property (strong, nonatomic) IBOutlet UITextField *PasswordField;

- (IBAction)SaveButton:(id)sender;


@end
