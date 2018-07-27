//
//  Accounts.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 05/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Accounts : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *TableViewAccounts;

@property(strong,nonatomic) NSMutableArray *NombreArray;
@property(strong,nonatomic) NSMutableArray *PassArray;
@property(strong,nonatomic) NSMutableArray *TipoArray;

@property (strong, nonatomic) IBOutlet UILabel *TypeLabel;

@property (strong, nonatomic) IBOutlet UILabel *UserLabel;

@property (strong, nonatomic) IBOutlet UILabel *PasswordLabel;

@property (strong, nonatomic) IBOutlet UIView *AddContactView;

@property (weak, nonatomic) IBOutlet UIScrollView *Scroll;

@property (strong, nonatomic) IBOutlet UITextField *TypeTextField;


@property (strong, nonatomic) IBOutlet UITextField *UserTextField;

@property (strong, nonatomic) IBOutlet UITextField *PasswordTextField;

- (IBAction)SaveAction:(id)sender;
- (IBAction)AddContact:(id)sender;
- (IBAction)CancelButton:(id)sender;

@end
