//
//  ConversorNBase.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 12/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ConversorNBase : UIViewController<ADBannerViewDelegate>{

    IBOutlet UITextField *Baseinicial;
    IBOutlet UITextField *BaseFinal;
    IBOutlet UITextField *Valorfield;
    
    IBOutlet UILabel *Resultadolabel;
    IBOutlet UILabel *titulo1;
    IBOutlet UILabel *titulo2;

}


-(IBAction)Inicio:(id)sender;
-(IBAction)Calcular:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property(nonatomic,retain) IBOutlet UITextField *Baseinicial;
@property(nonatomic,retain) IBOutlet UITextField *BaseFinal;
@property(nonatomic,retain) IBOutlet UITextField *Valorfield;

@property(nonatomic,retain) IBOutlet UILabel *Resultadolabel;
@property(nonatomic,retain) IBOutlet UILabel *titulo1;
@property(nonatomic,retain) IBOutlet UILabel *titulo2;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UILabel *ResTituloLabel;

@end
