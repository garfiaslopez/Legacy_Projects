//
//  DiagramaFuentedepoder.m
//  ielectronics tools
//
//  Created by Jose Garfias Lopez on 21/01/13.
//  Copyright (c) 2013 Jose Garfias Lopez. All rights reserved.
//

#import "DiagramaFuentedepoder.h"
#import "Diagramas.h"

@interface DiagramaFuentedepoder ()

@end

@implementation DiagramaFuentedepoder
@synthesize imageView;
@synthesize DiagramaAcargar;


-(IBAction)opciones:(UITapGestureRecognizer *)recognizer{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opciones:" message:@"¿Que desea hacer?"delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Regresar", @"Guardar Diagrama", @"Materiales",nil];
	[alert show];

}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		NSLog(@"0");
	}
	if (buttonIndex == 1) {
        NSLog(@"1");
        
        //menudiagramas = [self.storyboard instantiateViewControllerWithIdentifier:@"Diagramas"];
       // menudiagramas.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
       // [self presentViewController:menudiagramas animated:YES completion:NULL];
        
        [self dismissViewControllerAnimated:YES completion:nil];


        
    }
    if (buttonIndex == 2) {
        NSLog(@"2");
        
        
        if ([DiagramaAcargar isEqual: @"Fuente De Poder"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Fuente de poder" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
        }
        
        if ([DiagramaAcargar isEqual: @"Sirena Policial"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Sirena policial" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            
        }
        
        if ([DiagramaAcargar isEqual: @"Leds Variables"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Leds intermitentes" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            
        }
        
        if ([DiagramaAcargar isEqual: @"Piano Electronico"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Piano electronico" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            

        }
        
        if ([DiagramaAcargar isEqual: @"Luz Nocturna"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Luz nocturna automatica" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            

        }
        
        if ([DiagramaAcargar isEqual: @"Detector De Humedad"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Detector de humedad" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            

        }
        
        if ([DiagramaAcargar isEqual: @"Repelente Ultrasonico"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Repelente ultrasonico" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            
            
        }
        
        if ([DiagramaAcargar isEqual: @"Alarma Electronica"]) {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"EL diagrama se Guardó en el carrete" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
            UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Alarma electronica" ofType:@"png"]];
            
            UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
            
        }

        
    }
    
    
    if (buttonIndex == 3) {
        NSLog(@"3");
        
        
        if ([DiagramaAcargar isEqual: @"Fuente De Poder"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Materiales:" message:@"1 Clavija Electrica\n1 Transformador 12v/1A\n4 Diodos 1N4007\n1 Capacitor electrolitico 2.2µf\n1 Capacitor Ceramico 2.2µf\n1 Resistencia 1.5KΩ\n1 Resistencia 220Ω\n1 Potenciometro 5KΩ\n1 Circuito Integrado LM317\n1 Capacitor electrolitico 33µf\n1 Capacitor electrolitico 1µf"delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
        }
        
        if ([DiagramaAcargar isEqual: @"Sirena Policial"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Materiales:" message:@"1 Circuito Integrado 555\n1 Resistencia 220Ω\n1 Resistencia 1KΩ\n1 Resistencia 120KΩ\n1 Resistencia 6.8KΩ\n1 Resistencia 2.2KΩ\n1 Resistencia 10Ω\n1 Capacitor ceramico 10nf\n1 Push Button\n1 Capacitor electrolitico 1milif\n1 Transistor 2N3904\n1 Bocina 4Ω u 8Ω"delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];

        }
        
        if ([DiagramaAcargar isEqual: @"Leds Variables"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"1 Circuito Integrado 555\n1 Resistencia 6.8KΩ\n1 Resistencia 1KΩ\n2 Resistencias 220Ω\n2 LEDS\n1 Potenciometro 100KΩ"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
        
        if ([DiagramaAcargar isEqual: @"Piano Electronico"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"1 Circuito Integrado 555\n1 Capacitor electrolitico 100nf\n1 Capacitor electrolitico 22µf\n1 Capacitor electrolitico 10nf\n9 Push Buttons\n1 Resistencia 10KΩ\n2 Resistencias 6.8KΩ\n2 Resistencias 4.7KΩ\n2 Resistencias 2.2KΩ\n1 Resistencia 5.6KΩ\n1 Resistencia 8.2KΩ\n1 Bocina 4Ω u 8Ω"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];

        }
        
        if ([DiagramaAcargar isEqual: @"Luz Nocturna"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"1 Fotocelda o Fotoresistencia\n1 Circuito Integrado LM358\n1 Capacitor electrolitico 100nf\n1 Capacitor electrolitico 47µf\n1 Diodo 1N4007\n1 Relevador 12 Volts\n1 Transistor 2N3904\n1 Resistencia 10KΩ\n1 Resistencia 3.3KΩ\n1 Resistencia 100KΩ\n1 Resistencia 10Ω\n 1 Lampara o foco\n1 Fusible\nCorriente Alterna"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            
            
        }
        
        if ([DiagramaAcargar isEqual: @"Detector De Humedad"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"1 LED\n1 resistencia 220Ω\n1 Resistencia 6.8KΩ\n1 Resistencia 1KΩ\n1 Circuito Integrado 555\n1 Capacitor electrolitico 10µf\n1 Capacitor ceramico 10nf"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
        
        if ([DiagramaAcargar isEqual: @"Repelente Ultrasonico"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"1 Circuito Integrado 555\n1 LED\n1 Resistencia 47Ω\n2 Resistencias 1KΩ\n2 Resistencias 100Ω\n1Resistencia 470KΩ\n1 Capacitor Cerámico 10nf\n1 Capacitor electrolitico 1milif\n1 Capacitor electrolitico 10µf\n1 Transistor 2N3904\n1 Transistor 2N3906\n1 Speaker"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        
        if ([DiagramaAcargar isEqual: @"Alarma Electronica"]) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Materiales:" message:@"2 Switch\n1 Capacitor Cerámico 100nf\n1 SCR De Uso General\n2 Resistencias 33KΩ\n1 Resistencia 220Ω\n1 Diodo 1N4007\n1 LED\n1 Buzzer\n1 LED"delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        
        
    }
    
    
}

-(IBAction)InicioDiagramas:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)Guardarimagen:(id)sender{
    UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"¡Correcto!" message:@"La Foto Se Guardó En El Album De Cámara" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [error show];
    
    UIImage *Imagen = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Fuente de poder" ofType:@"png"]];
    
    UIImageWriteToSavedPhotosAlbum(Imagen, nil, nil, nil);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"%@",DiagramaAcargar);
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
    
    
    
    if ([DiagramaAcargar isEqual: @"Fuente De Poder"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Fuente de poder 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;

        [self.view addSubview:imageView];
    
    
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Sirena Policial"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Sirena policial 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Leds Variables"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Leds variables 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Piano Electronico"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Piano electronico 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Luz Nocturna"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Luz nocturna 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Detector De Humedad"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Detector de humedad 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Repelente Ultrasonico"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Repelente ultrasonico 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }
    
    if ([DiagramaAcargar isEqual: @"Alarma Electronica"]) {
        
        UIImage * image = [UIImage imageNamed:@"Diagrama Alarma electronica 1024.png"];
        imageView = [[UIImageView alloc]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        
        [self.view addSubview:imageView];
        
        
        [(UIScrollView *) self.view setContentSize:[image size]];
        [(UIScrollView *) self.view setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        [(UIScrollView *) self.view setMinimumZoomScale:0.5];
        [(UIScrollView *) self.view setMaximumZoomScale:4.0];
        [(UIScrollView *) self.view setBackgroundColor:[UIColor colorWithWhite:1 alpha:1]];
    }


    

}

-(UIView *)viewForZoomingInScrollView:(UIScrollView*)scrollView{
    return imageView;
}


- (BOOL)shouldAutorotate {
    
    return YES;
}

@end
