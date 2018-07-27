//
//  Servicios.h
//  AdminEnterprise
//
//  Created by Jose De Jesus Garfias Lopez on 14/05/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCImagePickerController.h"


@interface Servicios : UIViewController<ELCImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImage;
@property (weak, nonatomic) IBOutlet UITextField *ConceptoTextField;
@property (weak, nonatomic) IBOutlet UITextField *PrecioTextField;
@property (weak, nonatomic) IBOutlet UITextField *InvenTextField;
@property (weak, nonatomic) IBOutlet UIImageView *LogoServImageView;
@property (weak, nonatomic) IBOutlet UIButton *ImageButton;
@property (weak, nonatomic) IBOutlet UIScrollView *MainScroller;
@property (weak, nonatomic) IBOutlet UIButton *EditServButton;

@property (weak, nonatomic) IBOutlet UITableView *ServiciosTableView;

@property (nonatomic) NSInteger IndexEnterprise;


- (IBAction)Atras:(id)sender;
- (IBAction)Guardar:(id)sender;
- (IBAction)Borrar:(id)sender;
- (IBAction)SelectPhoto:(id)sender;
- (IBAction)EditarTableView:(id)sender;



@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic) ELCImagePickerController *elcPicker;


@end
