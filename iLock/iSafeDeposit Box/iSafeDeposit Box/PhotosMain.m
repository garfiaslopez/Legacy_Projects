//
//  PhotosMain.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "PhotosMain.h"

@interface PhotosMain ()

@end

@implementation PhotosMain


-(IBAction)Reload:(id)sender{
    //recarga los documentos añadidos:
    
    NSLog(@"Entro a reload");
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.jpg') OR (self ENDSWITH '.png') OR (self ENDSWITH '.tiff') OR (self ENDSWITH '.gif')"];
    
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
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.jpg') OR (self ENDSWITH '.png') OR (self ENDSWITH '.tiff') OR (self ENDSWITH '.gif')"];
    
    dataArray = [bundleDirectory filteredArrayUsingPredicate:filter];
    
    finalArray = [dataArray copy];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
     PhotosView *photoView = [[PhotosView alloc] init];
    
    NSUserDefaults *salvarcelda = [[NSUserDefaults alloc]init];
    [salvarcelda setObject:valueString forKey:@"nombrePhoto"];
    
    
    //mando a llamar en Modal mode al webview:
    
    photoView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewPhotoSB"];
    
    photoView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:photoView animated:YES completion:NULL];
}


@end
