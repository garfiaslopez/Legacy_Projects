//
//  DocsMain.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 21/09/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DocsMain.h"

@interface DocsMain ()

@end

@implementation DocsMain

//finalArray have the documents data...

-(IBAction)Reload:(id)sender{
    //recarga los documentos añadidos:
    
    NSLog(@"Entro a reload");
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.pdf') OR (self ENDSWITH '.doc') OR (self ENDSWITH '.docx') OR (self ENDSWITH '.xls') OR (self ENDSWITH '.xlsx') OR (self ENDSWITH '.ppt') OR (self ENDSWITH '.pptx') OR (self ENDSWITH '.numbers') OR (self ENDSWITH '.pages') OR (self ENDSWITH '.key') OR (self ENDSWITH '.rtf') "];
    
    dataArray = [bundleDirectory filteredArrayUsingPredicate:filter];
    
    finalArray = [dataArray copy];
    
    [self->myTableView reloadData];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Carga en la lista [los documentos:]
    
    
    NSArray *paths =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *bundleDirectory = [fileManager contentsOfDirectoryAtPath:documentsPath error:nil];
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"(self ENDSWITH '.pdf') OR (self ENDSWITH '.doc') OR (self ENDSWITH '.docx') OR (self ENDSWITH '.xls') OR (self ENDSWITH '.xlsx') OR (self ENDSWITH '.ppt') OR (self ENDSWITH '.pptx') OR (self ENDSWITH '.numbers') OR (self ENDSWITH '.pages') OR (self ENDSWITH '.key') OR (self ENDSWITH '.rtf') "];
    
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
    
    DocsView *pdfView = [[DocsView alloc] init];
    
    NSUserDefaults *salvarcelda = [[NSUserDefaults alloc]init];
    [salvarcelda setObject:valueString forKey:@"nombrePDF"];
    
    
    //mando a llamar en Modal mode al webview:
    pdfView = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewPdfsSB"];
    
    pdfView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:pdfView animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
