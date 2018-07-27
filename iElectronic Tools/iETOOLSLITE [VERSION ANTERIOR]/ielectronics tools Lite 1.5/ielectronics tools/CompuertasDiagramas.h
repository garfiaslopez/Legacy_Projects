//
//  CompuertasDiagramas.h
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 19/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompuertasLogicas.h"

@class CompuertasLogicas;

@interface CompuertasDiagramas : UIViewController

@property (strong, nonatomic) CompuertasLogicas *CompuertasView;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property(retain,nonatomic) NSString*CompuertaString;
@property (strong, nonatomic) IBOutlet UILabel *TituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *SimboloLabel;
@property (strong, nonatomic) IBOutlet UIImageView *SimboloImage;
@property (strong, nonatomic) IBOutlet UILabel *SubtituloLabel;
@property (strong, nonatomic) IBOutlet UILabel *ModeloLabel;
@property (strong, nonatomic) IBOutlet UIImageView *DiagramaImage;

@property (strong,nonatomic) UIImage *YesSymbolImage;
@property (strong,nonatomic) UIImage *NotSymbolImage;
@property (strong,nonatomic) UIImage *AndSymbolImage;
@property (strong,nonatomic) UIImage *OrSymbolImage;
@property (strong,nonatomic) UIImage *NandSymbolImage;
@property (strong,nonatomic) UIImage *NorSymbolImage;
@property (strong,nonatomic) UIImage *XorSymbolImage;
@property (strong,nonatomic) UIImage *XnorSymbolImage;

@property (strong,nonatomic) UIImage *YesDiagram1Image;
@property (strong,nonatomic) UIImage *NotDiagram1Image;
@property (strong,nonatomic) UIImage *AndDiagram1Image;
@property (strong,nonatomic) UIImage *OrDiagram1Image;
@property (strong,nonatomic) UIImage *NandDiagram1Image;
@property (strong,nonatomic) UIImage *NorDiagram1Image;
@property (strong,nonatomic) UIImage *XorDiagram1Image;
@property (strong,nonatomic) UIImage *XnorDiagram1Image;

@property (strong,nonatomic) UIImage *AndDiagram2Image;
@property (strong,nonatomic) UIImage *NAndDiagram2Image;
@property (strong,nonatomic) UIImage *NAndDiagram3Image;
@property (strong, nonatomic) UIImage *XorDiagram2Image;



@property (strong, nonatomic) IBOutlet UIButton *NextButton;
@property (strong, nonatomic) IBOutlet UIButton *PrevButton;

- (IBAction)Next:(id)sender;
- (IBAction)Prev:(id)sender;
- (IBAction)Ayuda:(id)sender;
- (IBAction)Atras:(id)sender;

@end



