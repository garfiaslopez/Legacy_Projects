//
//  ViewNotes.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 16/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

@class TableNotes;
@class ViewNotes;

#import <UIKit/UIKit.h>

@interface ViewNotes : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *MainTextView;

@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNote;

@property(strong,nonatomic) NSMutableArray *ArreglodeNotas;

@property(strong,nonatomic) NSMutableArray *ArreglodeTitulos;

@property (strong, nonatomic) IBOutlet UILabel *DoneLayout;

- (IBAction)Close:(id)sender;


@end
