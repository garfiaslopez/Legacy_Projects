//
//  ViewController.h
//  DecisionApp
//
//  Created by Jose De Jesus Garfias Lopez on 08/02/14.
//  Copyright (c) 2014 Jose De Jesus Garfias Lopez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *AnswerView;

@property (weak, nonatomic) IBOutlet UIImageView *BackImage;

@property (weak, nonatomic) IBOutlet UITextView *Frase;

@property (retain, nonatomic) NSMutableArray *Acciones;

@property (retain, nonatomic) NSMutableArray *Sujetos;

@property (retain, nonatomic) NSMutableArray *MatrixNO;

@property (retain, nonatomic) NSMutableArray *MatrixYES;

@property (weak, nonatomic) IBOutlet UIImageView *AnswerImage;

@property (weak, nonatomic) IBOutlet UITextView *AnswerText;



- (IBAction)AnswerClose:(id)sender;

- (IBAction)Decidir:(id)sender;

@end
