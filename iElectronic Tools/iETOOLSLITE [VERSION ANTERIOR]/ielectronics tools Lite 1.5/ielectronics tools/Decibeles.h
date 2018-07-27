//
//  Decibeles.h
//  iElectronic Tools PRO
//
//  Created by Jose De Jesus Garfias Lopez on 20/02/14.
//  Copyright (c) 2014 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface Decibeles : UIViewController<ADBannerViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *IntensidadTextField;

@property (weak, nonatomic) IBOutlet UITextField *RefIntensidadTextField;

@property (weak, nonatomic) IBOutlet UITextField *DecibelTextField;

@property (weak, nonatomic) IBOutlet UILabel *Resultado;

@property (weak, nonatomic) IBOutlet UILabel *UnidadResul;

@property (weak, nonatomic) IBOutlet UIScrollView *MainScroller;

- (IBAction)Calcular:(id)sender;
- (IBAction)Inicio:(id)sender;
- (IBAction)Ayuda:(id)sender;

@end
