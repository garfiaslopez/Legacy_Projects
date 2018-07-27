//
//  PhotosView.h
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosView : UIViewController<UIWebViewDelegate> {
    
    IBOutlet UIWebView *webView;
    
    NSString *listName;
}

@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;

@property (strong, nonatomic)  NSString *listName;

- (IBAction)Close:(id)sender;


@end
