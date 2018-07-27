//
//  DocsView.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 21/09/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "ViewController.h"

@interface DocsView : ViewController <UIWebViewDelegate> {
    
    IBOutlet UIWebView *webView;
    
    NSString *listName;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;

@property (strong, nonatomic)  NSString *listName;

- (IBAction)Close:(id)sender;

@end
