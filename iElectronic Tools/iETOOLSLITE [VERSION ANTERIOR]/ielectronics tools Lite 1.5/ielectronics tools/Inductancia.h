//
//  Inductancia.h
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 13/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface Inductancia : UIViewController<ADBannerViewDelegate>



@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UITextField *AreaTextField;
@property (strong, nonatomic) IBOutlet UITextField *LongTextField;
@property (strong, nonatomic) IBOutlet UITextField *InductanciaTextField;
@property (strong, nonatomic) IBOutlet UITextField *PermTextField;
@property (strong, nonatomic) IBOutlet UITextField *VueltasTextField;

@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesArea;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesLongitud;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesInductancia;
@property (strong, nonatomic) IBOutlet UILabel *Resultado1Label;
@property (strong, nonatomic) IBOutlet UILabel *Resultado2Label;
@property (strong, nonatomic) IBOutlet UILabel *Resultado3Label;
@property (strong, nonatomic) IBOutlet UILabel *Unidad1Label;
@property (strong, nonatomic) IBOutlet UILabel *Unidad2Label;
@property (strong, nonatomic) IBOutlet UILabel *Unidad3Label;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;





- (IBAction)Calcular:(id)sender;
- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;

@end
