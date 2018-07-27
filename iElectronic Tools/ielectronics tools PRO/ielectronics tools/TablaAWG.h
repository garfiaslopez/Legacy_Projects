//
//  TablaAWG.h
//  iElectronic Tools PRO
//
//  Created by Jose Garfias Lopez on 24/06/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TablaAWG : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *Scroller;

-(IBAction)inicio:(id)sender;
@property (strong, nonatomic) IBOutlet UINavigationBar *TituloNav;

- (IBAction)Ayuda:(id)sender;


@end
