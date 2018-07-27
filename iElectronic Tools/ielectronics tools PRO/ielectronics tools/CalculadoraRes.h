//
//  CalculadoraRes.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 29/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculadoraRes : UIViewController
<UIPickerViewDelegate>
{

    IBOutlet UIPickerView *resistencias;
    IBOutlet UISegmentedControl *bandas;
    IBOutlet UILabel *labelresultado;
    IBOutlet UILabel *labelresultadoK;
    IBOutlet UILabel *labelresultadoM;
    IBOutlet UILabel *toleranciaresultado;
    IBOutlet UILabel *coeficienteresultado;
    IBOutlet UILabel *titulo;
    
    IBOutlet UILabel *tolerancialabel;
    
    NSArray	*customPickerArray;
    NSArray *customPickerArray2;
    NSArray *customPickerArray3;


}

-(IBAction)instrucciones:(id)sender;
-(IBAction)numerobandas:(id)sender;
-(IBAction)inicio:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (nonatomic,retain) IBOutlet UISegmentedControl *bandas;
@property (nonatomic,retain) IBOutlet UILabel *labelresultado;
@property (nonatomic,retain) IBOutlet UILabel *labelresultadoK;
@property (nonatomic,retain) IBOutlet UILabel *labelresultadoM;
@property (nonatomic,retain) IBOutlet UILabel *toleranciaresultado;
@property (nonatomic,retain) IBOutlet UILabel *titulo;
@property (nonatomic,retain) IBOutlet UILabel *tolerancialabel;
@property (nonatomic,retain) IBOutlet UILabel *coeficienteresultado;



@property (nonatomic, retain) NSArray *customPickerArray;
@property (nonatomic, retain) NSArray *customPickerArray2;
@property (nonatomic, retain) NSArray *customPickerArray3;

@end
