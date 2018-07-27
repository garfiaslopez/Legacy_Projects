//
//  DiodoZener.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 20/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiodoZener : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *VinTextField;
@property (strong, nonatomic) IBOutlet UITextField *VoutTextField;
@property (strong, nonatomic) IBOutlet UITextField *IoutTextField;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (strong, nonatomic) IBOutlet UILabel *VinLabel;
@property (strong, nonatomic) IBOutlet UILabel *VoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *IoutLabel;

@property (strong, nonatomic) IBOutlet UILabel *ZenerLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResistenciaLabel;

@property (strong, nonatomic) IBOutlet UILabel *Rzener;
@property (strong, nonatomic) IBOutlet UILabel *RpZener;

@property (strong, nonatomic) IBOutlet UILabel *Rres;
@property (strong, nonatomic) IBOutlet UILabel *RpRes;

- (IBAction)Calcular:(id)sender;

- (IBAction)Inicio:(id)sender;

- (IBAction)Ayuda:(id)sender;

@end
