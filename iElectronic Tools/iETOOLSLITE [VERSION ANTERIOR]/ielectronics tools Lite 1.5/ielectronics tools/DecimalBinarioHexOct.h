//
//  DecimalBinarioHexOct.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 10/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DecimalBinarioHexOct : UIViewController{
    
    IBOutlet UITextField*ValorField;
    
    IBOutlet UISegmentedControl *Unidad;
    
    IBOutlet UILabel *Decimallabel;
    IBOutlet UILabel *Binariolabel;
    IBOutlet UILabel *Octallabel;
    IBOutlet UILabel *Hexalabel;
    
    IBOutlet UILabel *Decimallabeltxt;
    IBOutlet UILabel *Binariolabeltxt;
    IBOutlet UILabel *Octallabeltxt;
    IBOutlet UILabel *Hexalabeltxt;
    
}


@property(nonatomic,retain)IBOutlet UITextField*ValorField;
@property(nonatomic,retain)IBOutlet UISegmentedControl *Unidad;

@property(nonatomic,retain)IBOutlet UILabel *Decimallabel;
@property(nonatomic,retain)IBOutlet UILabel *Binariolabel;
@property(nonatomic,retain)IBOutlet UILabel *Octallabel;
@property(nonatomic,retain)IBOutlet UILabel *Hexalabel;

@property(nonatomic,retain)IBOutlet UILabel *Decimallabeltxt;
@property(nonatomic,retain)IBOutlet UILabel *Binariolabeltxt;
@property(nonatomic,retain)IBOutlet UILabel *Octallabeltxt;
@property(nonatomic,retain)IBOutlet UILabel *Hexalabeltxt;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
-(IBAction)Inicio:(id)sender;
-(IBAction)Calcular:(id)sender;
-(IBAction)instrucciones:(id)sender;


@end
