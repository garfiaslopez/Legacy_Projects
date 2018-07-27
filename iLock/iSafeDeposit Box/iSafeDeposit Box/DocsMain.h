//
//  DocsMain.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 21/09/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "ViewController.h"
#import "DocsView.h"


@interface DocsMain : ViewController<UITableViewDataSource,UIWebViewDelegate,UITabBarDelegate>{
   
    
    IBOutlet UIWebView *webView;
    IBOutlet UITableView *myTableView;
    
    NSArray *dataArray;
    NSMutableArray *finalArray;
    
    NSString *nombreArchivo;
}

-(IBAction)Reload:(id)sender;


@end
