//
//  VideoMain.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "VideoMain.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoMain ()

@end

@implementation VideoMain

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)Reload:(id)sender{
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.mp4') OR (self ENDSWITH '.m4v') OR (self ENDSWITH '.mov') OR (self ENDSWITH '.avi') OR (self ENDSWITH '.MOV')"];
    
    dataArray = [bundleDirectory filteredArrayUsingPredicate:filter];
    
    finalArray = [dataArray copy];
    
    [self->myTableView reloadData];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.mp4') OR (self ENDSWITH '.m4v') OR (self ENDSWITH '.mov') OR (self ENDSWITH '.avi') OR (self ENDSWITH '.MOV')"];
    
    dataArray = [bundleDirectory filteredArrayUsingPredicate:filter];
    
    finalArray = [dataArray copy];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [finalArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //this is by default: i think...
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell... how i want to look it.
    
    cell.textLabel.text = [[finalArray objectAtIndex:indexPath.row] stringByDeletingPathExtension];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //agarro el nombre de la celda y lo meto en valueString
    NSString *valueString = [finalArray objectAtIndex:indexPath.row];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"NOMBRE DEL ARCHIVO: %@",valueString);
    
    //this is my method to put in URL the video request:
    NSString *videoPath = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",valueString]];
    
    NSURL *url = [NSURL fileURLWithPath:videoPath];
    
    MPMoviePlayerViewController *playercontroller =
    [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
    [self presentMoviePlayerViewControllerAnimated:playercontroller];
    
    playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    
    [playercontroller.moviePlayer play];
    playercontroller = nil;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
