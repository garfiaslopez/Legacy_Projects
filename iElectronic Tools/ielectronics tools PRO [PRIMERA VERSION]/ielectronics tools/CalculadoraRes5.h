//
//  CalculadoraRes5.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 29/12/12.
//  Copyright (c) 2012 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Primbanda 0
#define Segubanda 1
#define tercbanda 2
#define cuartabanda 3
#define quintabanda 4

@class CalculadoraRes;
@class CalculadoraRes6;


@interface CalculadoraRes5 : UIViewController
<UIPickerViewDelegate>
{

    CalculadoraRes *cuatrobandas;
    CalculadoraRes6 *seisbandas;
    
    IBOutlet UISegmentedControl *bandas;
    IBOutlet UIPickerView *resistencias;
    IBOutlet UILabel *labelresultado;
    IBOutlet UILabel *labelresultadoK;
    IBOutlet UILabel *labelresultadoM;
    IBOutlet UILabel *toleranciaresultado;
    IBOutlet UILabel *titulo;
    IBOutlet UILabel *tolerancialabel;


    
    NSArray *customPickerArray;
    NSArray *customPickerArray2;
    NSArray *customPickerArray3;
    NSArray *customPickerArray4;
    NSArray *customPickerArray5;
    
    

}

-(IBAction)numerobandas:(id)sender;
-(IBAction)inicio:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property(nonatomic,retain) IBOutlet UISegmentedControl *bandas;
@property (nonatomic,retain) IBOutlet UILabel *labelresultado;
@property (nonatomic,retain) IBOutlet UILabel *labelresultadoK;
@property (nonatomic,retain) IBOutlet UILabel *labelresultadoM;
@property (nonatomic, retain) IBOutlet UILabel *toleranciaresultado;
@property (nonatomic, retain) IBOutlet UILabel *titulo;
@property (nonatomic, retain) IBOutlet UILabel *tolerancialabel;

@property (nonatomic, retain) NSArray *customPickerArray;
@property (nonatomic, retain) NSArray *customPickerArray2;
@property (nonatomic, retain) NSArray *customPickerArray3;
@property (nonatomic, retain) NSArray *customPickerArray4;
@property (nonatomic, retain) NSArray *customPickerArray5;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;




@end
