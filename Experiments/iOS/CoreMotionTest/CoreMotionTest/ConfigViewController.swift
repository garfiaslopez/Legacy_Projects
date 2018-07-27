//
//  ConfigViewController.swift
//  CoreMotionTest
//
//  Created by Jose De Jesus Garfias Lopez on 16/01/16.
//  Copyright © 2016 Jose De Jesus Garfias Lopez. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    
    
    @IBOutlet weak var maxGTextfield: UITextField!
    @IBOutlet weak var maxSpeedTextfield: UITextField!
    @IBOutlet weak var deviceTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func Save(sender: AnyObject) {
        
        if let parent = self.presentingViewController as? ViewController{
            parent.MaxSettingG = Double(self.maxGTextfield.text!)!;
            parent.MaxSettingS = Double(self.maxSpeedTextfield.text!)!;
            parent.device = self.deviceTextfield.text!;
        }
        
        self.dismissViewControllerAnimated(true, completion: nil);
        
    
    
    }

}
