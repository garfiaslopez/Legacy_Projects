//
//  DashboardViewController.swift
//  PetFy
//
//  Created by Jose De Jesus Garfias Lopez on 12/18/16.
//  Copyright © 2016 Karmapulse. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SparkSetup
import Spark_SDK
import SwiftSpinner


class DashboardViewController: UIViewController, SparkSetupMainControllerDelegate {

    
    var googleProfile: GIDProfileData!;
    var fireProfile:FIRUser!;
    var CoreDevice:SparkDevice?;
    var bucketDistance: Double = 0.0;
    var dishDistance: Double = 0.0;
    var splitToken: Array<String> = [];
    var sendedPiece = 0;
    var portion = 0;
    var unitTime = 0;
    var TimerVars = Foundation.Timer();
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var bucketLevelLabel: UILabel!
    @IBOutlet weak var dishLevelLabel: UILabel!
    @IBOutlet weak var portionStepper: UIStepper!
    @IBOutlet weak var portionLabel: UILabel!
    @IBOutlet weak var timeSegment: UISegmentedControl!
    @IBOutlet weak var timeTextfield: UITextField!
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        SwiftSpinner.show("Conectando tu Petfy");
        self.logIntoCore();
        
        
        portionStepper.value = 0.0;
        portionStepper.maximumValue = 5.0;
        
    }
    
    // Function will be called when setup finishes
    func sparkSetupViewController(_ controller: SparkSetupMainController!, didFinishWith result: SparkSetupMainControllerResult, device: SparkDevice!) {
        
        switch result
        {
        case .success:
            print("Setup completed successfully")
        case .failureConfigure:
            print("Setup failed")
        case .userCancel :
            print("User cancelled setup")
        case .loggedIn :
            print("User is logged in")
        default:
            print("Uknown setup error")
            
        }
    }
    
    func logIntoCore(){
        SparkCloud.sharedInstance().login(withUser: "garfiaslopez@hotmail.com", password: "SoftDeveloper12") {
            error -> Void in
            if ((error) != nil) {
                print("OOPS BAD");
            }else{
                print("TODO OK");
                self.getAllDevices();
            }
        }
    }
    
    func getAllDevices() {
        SparkCloud.sharedInstance().getDevices {
            (sparkDevices:[Any]?, error) -> Void in
            
            if ((error) != nil) {
                print("OOPS BAD");
            }else{
                if let devices = sparkDevices as? [SparkDevice] {
                    print("DEVICES");
                    print(devices);
                    for device in devices {
                        if device.name == "KarmaCore" {
                            self.CoreDevice = device;
                            
                            self.sendToken();
                            self.getParamaters();
                    
                        }
                    }
                }
            }
        }
    }
    
    func sendToken(){
        let token = FIRInstanceID.instanceID().token()!;
        self.splitToken = token.splitByLength(63);
        print(self.splitToken);
        for arg in self.splitToken {
            var Timer = Foundation.Timer();
            Timer = Foundation.Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(DashboardViewController.sendPieceOfToken), userInfo: nil, repeats: false);
            RunLoop.main.add(Timer, forMode: RunLoopMode.commonModes);
        }

    }
    
    func sendPieceOfToken() {
        
        print("ENVIANDO PEDAZO: \(self.sendedPiece)");
        let arguments = [self.splitToken[self.sendedPiece]];
        self.CoreDevice?.callFunction("setPushToken", withArguments: arguments) {
            (resulCode, error) -> Void in
            if(error == nil) {
                print("Successfully call function");
            }else{
                print("Error calling function");
                print(error?.localizedDescription ?? "Hello");
            }
        };
        self.sendedPiece = self.sendedPiece + 1;
        
        if(self.sendedPiece == 2){
            self.updateLayout();
            SwiftSpinner.hide();
        }
    }
    
    func getParamaters() {
        print("GETTING VARS");
        self.CoreDevice?.getVariable("buckDistance") {
            (result:Any?, error) -> Void in
            if ((error) != nil) {
                print("OOPS BAD");
                print(error?.localizedDescription ?? "Hello");
            }else{
                if let bucketD = result as? Double {
                    self.bucketDistance = bucketD;
                    self.updateLayout();
                }
            }
        }
        
        self.CoreDevice?.getVariable("dishDistance") {
            (result:Any?, error) -> Void in
            if ((error) != nil) {
                print("OOPS BAD");
                print(error?.localizedDescription ?? "Hello");

            }else{
                if let dishD = result as? Double {
                    self.dishDistance = dishD;
                    self.updateLayout();
                }
            }
        }
        
        self.CoreDevice?.getVariable("portion") {
            (result:Any?, error) -> Void in
            if ((error) != nil) {
                print("OOPS BAD");
                print(error?.localizedDescription ?? "Hello");
                
            }else{
                if let newPortion = result as? Int {
                    self.portion = newPortion;
                    self.portionStepper.value = Double(newPortion);
                    self.updateLayout();
                }
            }
        }
        
        self.CoreDevice?.getVariable("unitTime") {
            (result:Any?, error) -> Void in
            if ((error) != nil) {
                print("OOPS BAD");
                print(error?.localizedDescription ?? "Hello");
                
            }else{
                if let newUnitTime = result as? Int {
                    self.unitTime = newUnitTime;
                    self.updateLayout();
                }
            }
        }
    }
    
    func updateLayout() {
        print("UPDATING LAYOUT");
        
        self.ownerNameLabel.text = self.googleProfile.name;
        
        if (self.CoreDevice?.connected)! {
            self.statusImageView.image = UIImage(named: "Connected");
        }else{
            self.statusImageView.image = UIImage(named: "Disconnected");
        }
        
        self.bucketLevelLabel.text = self.calcualateBucket(distance: bucketDistance);
        self.dishLevelLabel.text = self.calcualateDish(distance: dishDistance);
        
        self.portionLabel.text = "\(self.portion)";
        self.timeTextfield.text = "\(self.unitTime)";
    }
    
    func calcualateBucket(distance: Double) -> String {
        let percent  = (distance * 100) / 35;
        
        if distance > 28 {
            return "Lleno al - \(percent)%";
        } else if (distance < 27 && distance > 20) {
            return "Al - \(percent)";
        } else if (distance < 20 && distance > 10) {
            return "A la mitad - \(percent)";
        } else if(distance < 10) {
            return "Por terminarse - \(percent)";
        }
        return "0%"
    }
    
    func calcualateDish(distance: Double) -> String {
        let percent  = (distance * 100) / 35;
        
        if distance > 28 {
            return "Lleno al - \(percent)%";
        } else if (distance < 27 && distance > 20) {
            return "Al - \(percent)";
        } else if (distance < 20 && distance > 10) {
            return "A la mitad - \(percent)";
        } else if(distance < 10) {
            return "Por terminarse - \(percent)";
        }
        return "0%"
    }
    
    @IBAction func changeStepper(_ sender: UIStepper) {
        if (portion != 0){
            let newValue = Int(sender.value);
            self.portionLabel.text = Int(sender.value).description;
            SwiftSpinner.show("Actualizando porcion");
            let arguments = ["\(newValue)"];
            self.CoreDevice?.callFunction("setPortion", withArguments: arguments) {
                (resulCode, error) -> Void in
                if(error == nil) {
                    print("Successfully call function");
                    self.portion = newValue;
                }else{
                    print("Error calling function");
                    print(error?.localizedDescription ?? "Hello");
                    self.portionStepper.value = Double(self.portion);
                }
                SwiftSpinner.hide();
                self.updateLayout();
            };
        }
    }
    
    @IBAction func changeTimeSegment(_ sender: Any) {
        
    }
    
    @IBAction func saveConfigPortion(_ sender: Any) {
        
        
    }
    
    
    @IBAction func feedNow(_ sender: Any) {
        SwiftSpinner.show("Llenando de comida n_n");
        let Args = ["1"];
        self.CoreDevice?.callFunction("serveFood", withArguments: Args) {
            (resulCode, error) -> Void in
            if(error == nil) {
                print("Successfully call function");
            }else{
                print("Error calling function");
            }
            SwiftSpinner.hide();
        };
    }
    
    @IBAction func LogOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }

}

extension String {
    func splitByLength(_ length: Int) -> [String] {
        var result = [String]()
        var collectedCharacters = [Character]()
        collectedCharacters.reserveCapacity(length)
        var count = 0
        
        for character in self.characters {
            collectedCharacters.append(character)
            count += 1
            if (count == length) {
                // Reached the desired length
                count = 0
                result.append(String(collectedCharacters))
                collectedCharacters.removeAll(keepingCapacity: true)
            }
        }
        
        // Append the remainder
        if !collectedCharacters.isEmpty {
            result.append(String(collectedCharacters))
        }
        
        return result
    }
}

