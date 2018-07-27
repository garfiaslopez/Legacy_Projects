//
//  ConfigInicial.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 13/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigInicial : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *AdminTextField;

@property (weak, nonatomic) IBOutlet UITextField *PassTextField;

@property (weak, nonatomic) IBOutlet UITextField *PassConfirmTextField;

@property (weak, nonatomic) IBOutlet UITextField *NameEnterTextField;


- (IBAction)Guardar:(id)sender;


@end
