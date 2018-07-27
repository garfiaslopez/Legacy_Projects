//
//  PaginaWeb.h
//  ExpoAcustica-IPN
//
//  Created by Jose De Jesus Garfias Lopez on 21/01/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaginaWeb : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *MainWeb;

- (IBAction)Close:(id)sender;

@end
