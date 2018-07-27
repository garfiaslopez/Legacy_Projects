//
//  LedResistencia.h
//  iElectronic Tools PRO
//
//  Created by Jose De Jesus Garfias Lopez on 20/02/14.
//  Copyright (c) 2014 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LedResistencia : UIViewController


@property (weak, nonatomic) IBOutlet UISegmentedControl *VFuenteSegmented;

@property (weak, nonatomic) IBOutlet UISegmentedControl *VLedSegmented;

@property (weak, nonatomic) IBOutlet UISegmentedControl *ILedSegmented;

@property (weak, nonatomic) IBOutlet UITextField *VFuenteTextField;

@property (weak, nonatomic) IBOutlet UITextField *VLedTextField;

@property (weak, nonatomic) IBOutlet UITextField *ILedTextField;

@property (weak, nonatomic) IBOutlet UILabel *ResultadoOhms;

@property (weak, nonatomic) IBOutlet UILabel *ResultadoKOhms;

@property (weak, nonatomic) IBOutlet UILabel *ResultadoMOhms;

@property (weak, nonatomic) IBOutlet UIScrollView *MainScroller;

- (IBAction)Calcular:(id)sender;

- (IBAction)Inicio:(id)sender;

- (IBAction)Ayuda:(id)sender;

@end
