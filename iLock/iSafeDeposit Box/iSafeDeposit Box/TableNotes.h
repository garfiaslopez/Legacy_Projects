//
//  TableNotes.h
//  iSafeDeposit Box
//
//  Created by Jose Garfias Lopez on 16/08/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewNotes;

@interface TableNotes : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{

    ViewNotes *ViewNotesVista;

}

@property (strong, nonatomic) IBOutlet UITableView *TableViewNotes;

@property (strong, nonatomic) NSMutableArray *ArregloTituloNotas;
@property (strong, nonatomic) NSMutableArray *ArregloBodyNotas;



- (IBAction)AddNote:(id)sender;

@end
