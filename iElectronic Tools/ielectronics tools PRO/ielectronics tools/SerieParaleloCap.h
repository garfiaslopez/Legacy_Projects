//
//  SerieParaleloCap.h
//  ielectronic tools
//
//  Created by Jose Garfias Lopez on 08/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SerieParaleloCap : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

@property (strong, nonatomic) IBOutlet UITableView *Capacitores;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabelPar1;
@property (strong, nonatomic) NSMutableArray *ValoresCap;
@property (strong, nonatomic) NSMutableArray *NumCapacitor;

@property (strong, nonatomic) IBOutlet UILabel *ResultadoLabelSer;
@property (strong, nonatomic) IBOutlet UILabel *ParaleloLabel;
@property (strong, nonatomic) IBOutlet UILabel *SerieLabel;

-(IBAction)inicio:(id)sender;

- (IBAction)AddCap:(id)sender;

- (IBAction)LimpiarTabla:(id)sender;

@end
