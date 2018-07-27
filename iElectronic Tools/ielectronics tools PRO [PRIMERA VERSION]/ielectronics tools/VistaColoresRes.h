//
//  VistaColoresRes.h
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 01/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface VistaColoresRes : UIView{

    NSString *title;
	UIImage *image;

}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIImage *image;

+ (CGFloat)viewWidth;
+ (CGFloat)viewHeight;


@end
