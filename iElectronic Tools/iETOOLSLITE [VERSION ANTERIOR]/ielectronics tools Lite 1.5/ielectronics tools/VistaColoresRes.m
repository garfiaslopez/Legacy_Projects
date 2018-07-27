//
//  VistaColoresRes.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 01/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "VistaColoresRes.h"

#define MAIN_FONT_SIZE 18
#define MIN_MAIN_FONT_SIZE 16


@implementation VistaColoresRes

@synthesize title, image;

const CGFloat kViewWidth = 50;
const CGFloat kViewHeight = 38;

+ (CGFloat)viewWidth
{
    return kViewWidth;
}

+ (CGFloat)viewHeight
{
    return kViewHeight;
}

- (id)initWithFrame:(CGRect)frame
{
	// use predetermined frame size
	self = [super initWithFrame:CGRectMake(0.0, 0.0, kViewWidth, kViewHeight)];
	if (self)
	{
		self.backgroundColor = [UIColor clearColor];	// make the background transparent
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    // draw the image and title using their draw methods
	CGFloat yCoord = (self.bounds.size.height - self.image.size.height) / 2;
	CGPoint point = CGPointMake(3.0, yCoord);
	[self.image drawAtPoint:point];
	
	yCoord = (self.bounds.size.height - MAIN_FONT_SIZE) / 2;
	point = CGPointMake(3.0 + self.image.size.width + 3.0, yCoord);
	[self.title drawAtPoint:point
                   forWidth:self.bounds.size.width
                   withFont:[UIFont systemFontOfSize:MAIN_FONT_SIZE]
                minFontSize:MIN_MAIN_FONT_SIZE
             actualFontSize:NULL
              lineBreakMode:NSLineBreakByTruncatingTail
         baselineAdjustment:UIBaselineAdjustmentAlignBaselines];

}

// Enable accessibility for this view.
- (BOOL)isAccessibilityElement
{
	return YES;
}

// Return a string that describes this view.
- (NSString *)accessibilityLabel
{
	return self.title;
}


@end
