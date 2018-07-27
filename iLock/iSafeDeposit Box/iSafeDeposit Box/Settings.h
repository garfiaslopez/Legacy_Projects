//
//  Settings.h
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Settings : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *EmailField;
@property (weak, nonatomic) IBOutlet UITextField *OldPassField;
@property (weak, nonatomic) IBOutlet UITextField *NewPassField;
@property (weak, nonatomic) IBOutlet UISwitch *SwitchDelete;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tabSelector;

- (IBAction)ChangeStateDelete:(id)sender;
- (IBAction)SaveEmail:(id)sender;
- (IBAction)SaveNewPass:(id)sender;
- (IBAction)changeTab:(id)sender;



@end
