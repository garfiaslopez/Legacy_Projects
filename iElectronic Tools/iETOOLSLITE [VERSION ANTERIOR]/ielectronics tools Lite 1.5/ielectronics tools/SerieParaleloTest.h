//
//  SerieParaleloTest.h
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 07/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SerieParaleloTest : UIViewController
<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *Resistencias;

@property(strong, nonatomic) NSMutableArray *Valores;

@property(strong, nonatomic) NSMutableArray *NumResistencia;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabel;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabel1;

@property (strong, nonatomic) IBOutlet UISegmentedControl *SerieParalelo;
@property (strong, nonatomic) IBOutlet UILabel *SerieLabel;

@property (strong, nonatomic) IBOutlet UILabel *ParaleloLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;
- (IBAction)AddItem:(id)sender;

- (IBAction)LimpiarTabla:(id)sender;

-(IBAction)inicio:(id)sender;

@end
