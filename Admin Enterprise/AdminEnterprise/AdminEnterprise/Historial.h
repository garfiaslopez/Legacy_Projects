//
//  Historial.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Historial : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *MainScroller;
@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImage;

@property (weak, nonatomic) IBOutlet UISegmentedControl *TipoBusquedaSegment;
@property (weak, nonatomic) IBOutlet UIPickerView *PickerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;

@property (weak, nonatomic) IBOutlet UITableView *VentasTableView;

@property (weak, nonatomic) IBOutlet UILabel *TotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *VentasLabel;

@property (weak, nonatomic) IBOutlet UIImageView *DetalleVentaImageView;

@property (weak, nonatomic) IBOutlet UIScrollView *VentaScrollView;



- (IBAction)Busqueda:(id)sender;
- (IBAction)Atras:(id)sender;
- (IBAction)ChangeTypeSearch:(id)sender;

@property (nonatomic) NSInteger IndexEnterprise;


@end
