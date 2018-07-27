//
//  DecimalGrados.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 03/07/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DecimalGrados : UIViewController


@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UITextField *NumeroTextField;
@property (strong, nonatomic) IBOutlet UILabel *Grados1Label;
@property (strong, nonatomic) IBOutlet UILabel *ResGradosLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResMinLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResSegLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResMsegLabel;
@property (strong, nonatomic) IBOutlet UILabel *TangenteLabel;
@property (strong, nonatomic) IBOutlet UILabel *SenoLabel;
@property (strong, nonatomic) IBOutlet UILabel *CosenoLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResTangenteLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResSenoLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResCosenoLabel;
@property (strong, nonatomic) IBOutlet UILabel *Grados2Label;
@property (strong, nonatomic) IBOutlet UITextField *GradosTextfield;
@property (strong, nonatomic) IBOutlet UITextField *MinTextField;
@property (strong, nonatomic) IBOutlet UITextField *SegTextField;
@property (strong, nonatomic) IBOutlet UITextField *MsegTextField;
@property (strong, nonatomic) IBOutlet UILabel *Decimal2Label;
@property (strong, nonatomic) IBOutlet UILabel *Decimal1Label;
@property (strong, nonatomic) IBOutlet UILabel *ResDecimalLabel;

- (IBAction)CalcularDec:(id)sender;
- (IBAction)CalcularGrados:(id)sender;
- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;


@end
