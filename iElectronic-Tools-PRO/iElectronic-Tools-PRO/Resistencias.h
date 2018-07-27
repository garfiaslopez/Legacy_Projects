//
//  Resistencias.h
//  iElectronic-Tools-PRO
//
//  Created by Jose De Jesus Garfias Lopez on 22/11/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Resistencias : UIViewController <UITabBarDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;


@property (weak, nonatomic) IBOutlet UIView *ViewColor;
@property (weak, nonatomic) IBOutlet UIPickerView *ColorPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *BandasSegment;




- (IBAction)BandaisChanged:(id)sender;

@end
