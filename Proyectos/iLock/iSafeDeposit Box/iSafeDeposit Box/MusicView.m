//
//  MusicView.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 23/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "MusicView.h"

#define IDZTrace() NSLog(@"%s", __PRETTY_FUNCTION__)

@interface MusicView ()



- (void)updateDisplay;
- (void)updateSliderLabels;

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag;
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player
                                 error:(NSError *)error;

@end

@implementation MusicView


@synthesize currentTimeLabel = mCurrentTimeLabel;
@synthesize deviceCurrentTimeLabel = mDeviceCurrentTimeLabel;
@synthesize durationLabel = mDurationLabel;
@synthesize numberOfChannelsLabel = mNumberOfChannels;
@synthesize playingLabel = mPlayingLabel;
@synthesize elapsedTimeLabel = mElapsedTimeLabel;
@synthesize remainingTimeLabel = mRemainingTimeLabel;
@synthesize currentTimeSlider = mCurrentTimeSlider;
@synthesize playButton = mPlayingButton;
@synthesize pauseButton = mPauseButton;
@synthesize stopButton = mStopButton;
@synthesize player = mPlayer;
@synthesize timer = mTimer;

//This is my synthesize:
@synthesize listName;
@synthesize NavigationBar;
@synthesize NameLabel;
@synthesize imageview;
@synthesize AlbumLabel;
@synthesize ArtistaLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //CONTROLAR EL STOP CUANDO LAS SEÑALES SE ACTIVEN EN EL TELEFONO
    
    
    //RECUPERAR EL NOMBRE DEL ARCHIVO:
    NSUserDefaults *RecuperarCelda = [[NSUserDefaults alloc]init];
    listName = [RecuperarCelda objectForKey:@"nombreMP3"];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Considering your pdf is stored in documents directory with name as "pdfFileName"
    
    NSLog(@"NOMBRE DEL ARCHIVO: %@",listName);
    
    
    //this is my method to put in URL the mp3 Song request:
    NSString *mp3Path = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",listName]];
    NSURL *url = [NSURL fileURLWithPath:mp3Path];
    
    //NSURL* url = [[NSBundle mainBundle] URLForResource:@"Rondo_Alla_Turka_Short" withExtension:@"aiff"];
    
    
    NSAssert(url, @"URL is valid.");
    NSError* error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    if(!self.player)
    {
        NSLog(@"Error creating player: %@", error);
    }
    
    self.player.delegate = self;
    
    [self.player prepareToPlay];
    
    
    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:nil];
    
    NSArray *metadata = [asset commonMetadata];
    
    /*
    for ( AVMetadataItem* item in metadata ) {
        NSString *key = [item commonKey];
        NSString *value = [item stringValue];
        NSLog(@"key = %@, value = %@", key, value);
    }
    */
    
    //for (NSString *format in metadata) {
        for (AVMetadataItem *item in metadata) {
            
            if ([[item commonKey] isEqual:@"title"]) {
                NavigationBar.topItem.title = (NSString *)[item value];
                NSLog(@" title : %@", (NSString *)[item value]);
            }
            if ([[item commonKey] isEqual:@"artist"]) {
                ArtistaLabel.text = (NSString *)[item value];
            }
            if ([[item commonKey] isEqual:@"albumName"]) {
                  AlbumLabel.text = (NSString *)[item value];
            }
            if ([[item commonKey] isEqual:@"artwork"]) {
                
                NSData *data = [(NSDictionary *)[item value] objectForKey:@"data"];
                UIImage *img = [UIImage imageWithData:data];
                imageview.image = img;
                continue;
            }
        }
   // }
    
    
    // Fill in the labels that do not change:
    self.durationLabel.text = [NSString stringWithFormat:@"%.02fs",self.player.duration];
    self.numberOfChannelsLabel.text = [NSString stringWithFormat:@"%d", self.player.numberOfChannels];
    self.currentTimeSlider.minimumValue = 0.0f;
    self.currentTimeSlider.maximumValue = self.player.duration;
    [self updateDisplay];
    
    [self play:self];
}
-(void)viewDidDisappear:(BOOL)animated{
    [self stop:self];
    NSLog(@"LA VISTA DESAPARECIO");
}

-(void)viewWillDisappear:(BOOL)animated{
    [self stop:self];
    NSLog(@"LA VISTA VA A DESAPARECER");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setPauseButton:nil];
    [self setPlayButton:nil];
    [self setStopButton:nil];
    [self setCurrentTimeLabel:nil];
    [self setDeviceCurrentTimeLabel:nil];
    [self setDurationLabel:nil];
    [self setNumberOfChannelsLabel:nil];
    [self setPlayingLabel:nil];
    [self setElapsedTimeLabel:nil];
    [self setRemainingTimeLabel:nil];
    [self setCurrentTimeSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)Close:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)play:(id)sender {
    IDZTrace();
    [self.player play];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
}

- (IBAction)pause:(id)sender {
    IDZTrace();
    [self.player pause];
    [self stopTimer];
    [self updateDisplay];
}

- (IBAction)stop:(id)sender {
    IDZTrace();
    
    [self.player stop];
    [self stopTimer];
    self.player.currentTime = 0;
    [self.player prepareToPlay];
    [self updateDisplay];
}

- (IBAction)currentTimeSliderValueChanged:(id)sender
{
    if(self.timer)
        [self stopTimer];
    [self updateSliderLabels];
}

- (IBAction)currentTimeSliderTouchUpInside:(id)sender
{
    [self.player stop];
    self.player.currentTime = self.currentTimeSlider.value;
    [self.player prepareToPlay];
    [self play:self];
}

#pragma mark - Display Update
- (void)updateDisplay
{
    NSTimeInterval currentTime = self.player.currentTime;
    NSString* currentTimeString = [NSString stringWithFormat:@"%.02f", currentTime];
    
    self.currentTimeSlider.value = currentTime;
    [self updateSliderLabels];
    
    self.currentTimeLabel.text = currentTimeString;
    self.playingLabel.text = self.player.playing ? @"YES" : @"NO";
    self.deviceCurrentTimeLabel.text = [NSString stringWithFormat:@"%.02f", self.player.deviceCurrentTime];
}

- (void)updateSliderLabels
{
    NSTimeInterval currentTime = self.currentTimeSlider.value;
    NSString* currentTimeString = [NSString stringWithFormat:@"%.02f", currentTime];
    
    self.elapsedTimeLabel.text =  currentTimeString;
    self.remainingTimeLabel.text = [NSString stringWithFormat:@"%.02f", self.player.duration - currentTime];
}

#pragma mark - Timer
- (void)timerFired:(NSTimer*)timer
{
    [self updateDisplay];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
    [self updateDisplay];
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    NSLog(@"%s successfully=%@", __PRETTY_FUNCTION__, flag ? @"YES"  : @"NO");
    [self stopTimer];
    [self updateDisplay];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"%s error=%@", __PRETTY_FUNCTION__, error);
    [self stopTimer];
    [self updateDisplay];
}
@end
