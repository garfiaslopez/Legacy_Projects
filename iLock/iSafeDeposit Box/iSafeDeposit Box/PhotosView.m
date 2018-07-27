//
//  PhotosView.m
//  iSafeDeposit Box
//
//  Created by Jose De Jesus Garfias Lopez on 24/12/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "PhotosView.h"

@interface PhotosView ()

@end

@implementation PhotosView

@synthesize NavigationBar;
@synthesize listName;

- (IBAction)Close:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    
    //RECUPERAR EL NOMBRE DEL ARCHIVO:
    NSUserDefaults *RecuperarCelda = [[NSUserDefaults alloc]init];
    listName = [RecuperarCelda objectForKey:@"nombrePhoto"];
    
    NavigationBar.topItem.title = listName;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Considering your pdf is stored in documents directory with name as "pdfFileName"
    
    NSLog(@"NOMBRE DEL ARCHIVO EN LA WEBVIEW: %@",listName);
    
    NSString *pdfPath = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",listName]];
    NSURL *url = [NSURL fileURLWithPath:pdfPath];
    
    /*
    NSString* webViewContent = [NSString stringWithFormat:
                                @"<html>"
                                "<body>"
                                "<img src=\"file://%@\" width=\"200\" height=\"500\"/>"
                                "</body></html>", url];
    [webView loadHTMLString:webViewContent baseURL:nil];
    */
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [webView setScalesPageToFit:YES];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
