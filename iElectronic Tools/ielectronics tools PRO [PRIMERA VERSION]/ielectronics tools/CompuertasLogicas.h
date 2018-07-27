//
//  CompuertasLogicas.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 11/02/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompuertasDiagramas.h"

@class CompuertasDiagramas;

@interface CompuertasLogicas : UIViewController{

    IBOutlet UISegmentedControl * A;
    IBOutlet UISegmentedControl * B;
    
    IBOutlet UILabel *Yes;
    IBOutlet UILabel *No;
    IBOutlet UILabel *And;
    IBOutlet UILabel *Or;
    IBOutlet UILabel *Nand;
    IBOutlet UILabel *Nor;
    IBOutlet UILabel *Xor;
    IBOutlet UILabel *Xnor;
    
    IBOutlet UILabel *Yeslabel;
    IBOutlet UILabel *Nolabel;
    IBOutlet UILabel *Andlabel;
    IBOutlet UILabel *Orlabel;
    IBOutlet UILabel *Nandlabel;
    IBOutlet UILabel *Norlabel;
    IBOutlet UILabel *Xorlabel;
    IBOutlet UILabel *Xnorlabel;
    IBOutlet UILabel *entradas;
    IBOutlet UILabel *Alabel;
    IBOutlet UILabel *Blabel;

    CompuertasDiagramas *loadDiagrama;
}

-(IBAction)Inicio:(id)sender;

-(IBAction)Calcular:(id)sender;

-(IBAction)instrucciones:(id)sender;

- (IBAction)LoadYES:(id)sender;

- (IBAction)LoadNOT:(id)sender;

- (IBAction)LoadAND:(id)sender;

- (IBAction)LoadOR:(id)sender;

- (IBAction)LoadNand:(id)sender;

- (IBAction)LoadNor:(id)sender;

- (IBAction)LoadXor:(id)sender;

- (IBAction)LoadXnor:(id)sender;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (nonatomic, retain)     CompuertasDiagramas *loadDiagrama;

@property(nonatomic,retain) IBOutlet UISegmentedControl * A;

@property(nonatomic,retain)IBOutlet UISegmentedControl * B;

@property(nonatomic,retain)IBOutlet UILabel *Yes;
@property(nonatomic,retain)IBOutlet UILabel *No;
@property(nonatomic,retain)IBOutlet UILabel *And;
@property(nonatomic,retain)IBOutlet UILabel *Or;
@property(nonatomic,retain)IBOutlet UILabel *Nand;
@property(nonatomic,retain)IBOutlet UILabel *Nor;
@property(nonatomic,retain)IBOutlet UILabel *Xor;
@property(nonatomic,retain)IBOutlet UILabel *Xnor;

@property(nonatomic,retain)IBOutlet UILabel *Yeslabel;
@property(nonatomic,retain)IBOutlet UILabel *Nolabel;
@property(nonatomic,retain)IBOutlet UILabel *Andlabel;
@property(nonatomic,retain)IBOutlet UILabel *Orlabel;
@property(nonatomic,retain)IBOutlet UILabel *Nandlabel;
@property(nonatomic,retain)IBOutlet UILabel *Norlabel;
@property(nonatomic,retain)IBOutlet UILabel *Xorlabel;
@property(nonatomic,retain)IBOutlet UILabel *Xnorlabel;
@property(nonatomic,retain)IBOutlet UILabel *entradas;
@property(nonatomic,retain)IBOutlet UILabel *Alabel;
@property(nonatomic,retain)IBOutlet UILabel *Blabel;


@end
