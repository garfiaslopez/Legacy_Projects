//
//  MusicView.h
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 23/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicView : UIViewController<AVAudioPlayerDelegate>{
    
    NSString *listName;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *AlbumLabel;
@property (weak, nonatomic) IBOutlet UILabel *ArtistaLabel;

@property (nonatomic, retain) AVAudioPlayer* player;
@property (nonatomic, strong) NSTimer* timer;

@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceCurrentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfChannelsLabel;
@property (weak, nonatomic) IBOutlet UILabel *playingLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLabel;

@property (weak, nonatomic) IBOutlet UISlider *currentTimeSlider;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;


//This is my actions;
@property (nonatomic, retain) NSString *listName;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavigationBar;

- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

- (IBAction)currentTimeSliderValueChanged:(id)sender;
- (IBAction)currentTimeSliderTouchUpInside:(id)sender;
//This is my actions:
- (IBAction)Close:(id)sender;

@end
