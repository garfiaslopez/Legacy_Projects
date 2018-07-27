//
//  impedancia.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 25/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface impedancia : UIViewController<ADBannerViewDelegate>

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesR;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesXL;
@property (strong, nonatomic) IBOutlet UISegmentedControl *UnidadesXC;
@property (strong, nonatomic) IBOutlet UITextField *RTextField;
@property (strong, nonatomic) IBOutlet UITextField *XLTextField;
@property (strong, nonatomic) IBOutlet UITextField *XCTextField;
@property (strong, nonatomic) IBOutlet UILabel *ResOhms;
@property (strong, nonatomic) IBOutlet UILabel *ResKohms;
@property (strong, nonatomic) IBOutlet UILabel *ResMohms;




- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;
- (IBAction)Calcular:(id)sender;

@end
