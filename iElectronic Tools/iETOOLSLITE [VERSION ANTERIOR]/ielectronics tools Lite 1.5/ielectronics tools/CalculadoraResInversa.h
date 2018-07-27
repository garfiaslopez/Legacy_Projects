//
//  CalculadoraResInversa.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 17/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface CalculadoraResInversa : UIViewController<ADBannerViewDelegate>{

    IBOutlet UISegmentedControl *unidad;
    IBOutlet UISegmentedControl *tolerancia;
    IBOutlet UITextField *valor;
    IBOutlet UIImageView *banda1;
    IBOutlet UIImageView *banda2;
    IBOutlet UIImageView *banda3;
    IBOutlet UIImageView *banda4;
    IBOutlet UILabel *tolerancialabel;

}

-(IBAction)calcular:(id)sender;
-(IBAction)inicio:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (nonatomic,retain) IBOutlet UISegmentedControl *unidad;
@property (nonatomic,retain) IBOutlet UISegmentedControl *tolerancia;
@property (nonatomic,retain) IBOutlet UITextField *valor;
@property (nonatomic,retain) IBOutlet UIImageView *banda1;
@property (nonatomic,retain) IBOutlet UIImageView *banda2;
@property (nonatomic,retain) IBOutlet UIImageView *banda3;
@property (nonatomic,retain) IBOutlet UIImageView *banda4;
@property (nonatomic,retain) IBOutlet UILabel *tolerancialabel;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@end
