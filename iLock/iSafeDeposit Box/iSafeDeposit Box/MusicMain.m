//
//  MusicMain.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 23/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "MusicMain.h"

@interface MusicMain ()

@end

@implementation MusicMain


-(IBAction)Reload:(id)sender{
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.mp3') OR (self ENDSWITH '.aiff') OR (self ENDSWITH '.wav')"];
    
    dataArray = [bundleDirectory filteredArrayUsingPredicate:filter];
    
    
    finalArray = [dataArray copy];
    
    [self->myTableView reloadData];
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    //para hacer un filtro de dos o mas condiciones se usa el OR!!! :D 
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.mp3') OR (self ENDSWITH '.aiff') OR (self ENDSWITH '.wav')"];


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
    
    //Put a webview for PDF read:
    
    //agarro el nombre de la celda y lo meto en valueString
    NSString *valueString = [finalArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",valueString);
    
    //paso el valor a la pdfVIEW
    
    MusicView *musicVista = [[MusicView alloc] init];
    
    NSUserDefaults *salvarcelda = [[NSUserDefaults alloc]init];
    [salvarcelda setObject:valueString forKey:@"nombreMP3"];
    
    
    //mando a llamar en Modal mode al webview:
    musicVista = [self.storyboard instantiateViewControllerWithIdentifier:@"MusicViewSB"];
    
    musicVista.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:musicVista animated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
