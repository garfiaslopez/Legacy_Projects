//
//  ViewController.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bienvenida.h"
#import <MessageUI/MessageUI.h>

@class Bienvenida;

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate>{
    
    Bienvenida *BienvenidaView;

}


@property (strong, nonatomic) IBOutlet UIImageView *Asterisco1;
@property (strong, nonatomic) IBOutlet UIImageView *Asterisco2;
@property (strong, nonatomic) IBOutlet UIImageView *Asterisco3;
@property (strong, nonatomic) IBOutlet UIImageView *Asterisco4;
@property (strong, nonatomic) IBOutlet UIImageView *Asterisco5;










- (IBAction)Number0Action:(id)sender;

- (IBAction)Number1Action:(id)sender;

- (IBAction)Number2Action:(id)sender;

- (IBAction)Number3Action:(id)sender;

- (IBAction)Number4Action:(id)sender;

- (IBAction)Number5Action:(id)sender;

- (IBAction)Number6Action:(id)sender;

- (IBAction)Number7Action:(id)sender;

- (IBAction)Number8Action:(id)sender;

- (IBAction)Number9Action:(id)sender;















@end
