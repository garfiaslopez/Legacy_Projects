//
//  Resonancia.h
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 16/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Resonancia : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesCap;

@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesInduc;

@property (strong, nonatomic) IBOutlet UITextField *CapacitorIN;

@property (strong, nonatomic) IBOutlet UITextField *BobinaIN;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabel;
@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabelK;
@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabelM;
@property (strong, nonatomic) IBOutlet UILabel *CapacitorTituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *BobinaTituloLabel;

- (IBAction)Calcular:(id)sender;
- (IBAction)Ayuda:(id)sender;

-(IBAction)inicio:(id)sender;
@end
