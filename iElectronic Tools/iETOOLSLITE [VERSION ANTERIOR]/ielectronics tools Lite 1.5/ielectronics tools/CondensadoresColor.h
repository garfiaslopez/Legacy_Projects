//
//  CondensadoresColor.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 30/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Primerabanda 0
#define Segundabanda 1
#define Tercerabanda 2
#define Cuartabanda 3
#define Quintabanda 4


@interface CondensadoresColor : UIViewController<UIPickerViewDelegate>{
    
    IBOutlet UIPickerView *Colorescondensador;
    
    NSArray *customPickerArray;
    NSArray *customPickerArray2;
    NSArray *customPickerArray3;
    NSArray *customPickerArray4;
    NSArray *customPickerArray5;
    
    IBOutlet UILabel * Resultado;
    IBOutlet UILabel * Tolerancia;
    IBOutlet UILabel * Tension;
    IBOutlet UILabel * tolerancialabel;
    IBOutlet UILabel * tensionlabel;
    IBOutlet UILabel * titulo;
    IBOutlet UILabel * unidadlabel;
    
    
}


-(IBAction)inicio:(id)sender;
-(IBAction)instrucciones:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel * Tension;

@property (nonatomic, retain) IBOutlet UILabel * Tolerancia;

@property (nonatomic, retain) IBOutlet UIPickerView *Colorescondensador;

@property (nonatomic, retain) IBOutlet UILabel * Resultado;

@property (nonatomic, retain) IBOutlet UILabel * tolerancialabel;
@property (nonatomic, retain) IBOutlet UILabel * tensionlabel;
@property (nonatomic, retain) IBOutlet UILabel * titulo;
@property (nonatomic, retain) IBOutlet UILabel * unidadlabel;

@property (nonatomic, retain) NSArray *customPickerArray;
@property (nonatomic, retain) NSArray *customPickerArray2;
@property (nonatomic, retain) NSArray *customPickerArray3;
@property (nonatomic, retain) NSArray *customPickerArray4;
@property (nonatomic, retain) NSArray *customPickerArray5;
@property (strong, nonatomic) IBOutlet UILabel *ResTituloLabel;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@end
