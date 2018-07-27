//
//  VideoMain.h
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoMain : UIViewController<UITableViewDataSource,UIWebViewDelegate,UITabBarDelegate>{
    
        IBOutlet UITableView *myTableView;
    
    NSArray *dataArray;
    NSMutableArray *finalArray;
    
    NSString *nombreArchivo;
}

-(IBAction)Reload:(id)sender;



@end
