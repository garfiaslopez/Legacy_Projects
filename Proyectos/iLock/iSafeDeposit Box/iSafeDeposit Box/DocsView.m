//
//  DocsView.m
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 21/09/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DocsView.h"

@interface DocsView ()

@end

@implementation DocsView

@synthesize listName;
@synthesize NavigationBar;

- (IBAction)Close:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //RECUPERAR EL NOMBRE DEL ARCHIVO:
    NSUserDefaults *RecuperarCelda = [[NSUserDefaults alloc]init];
    listName = [RecuperarCelda objectForKey:@"nombrePDF"];
    
    NavigationBar.topItem.title = listName;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Considering your pdf is stored in documents directory with name as "pdfFileName"
    
    NSLog(@"NOMBRE DEL ARCHIVO EN LA WEBVIEW: %@",listName);

    NSString *pdfPath = [[paths objectAtIndex:0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",listName]];
    NSURL *url = [NSURL fileURLWithPath:pdfPath];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [webView setScalesPageToFit:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return YES;
}

@end

