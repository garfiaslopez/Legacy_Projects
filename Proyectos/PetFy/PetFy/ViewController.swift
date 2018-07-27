//
//  ViewController.swift
//  PetFy
//
//  Created by Jose De Jesus Garfias Lopez on 12/17/16.
//  Copyright © 2016 Karmapulse. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SwiftSpinner


class ViewController: UIViewController,  GIDSignInUIDelegate, GIDSignInDelegate {

    var googleProfile: GIDProfileData!;
    var fireProfile:FIRUser!;
    
    
    @IBOutlet weak var SignIn: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self;
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors =   [
            UIColor(red: 41/255, green: 201/255, blue: 221/255, alpha: 1).cgColor,
            UIColor(red: 56/255, green: 150/255, blue: 207/255, alpha: 1).cgColor ];
        gradient.locations = [0.0 , 1.0]
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height);
        
        
        self.view.layer.insertSublayer(gradient, at: 0);
    
    }

    func alerta(_ Titulo:String,Mensaje:String){
        let alertController = UIAlertController(title: Titulo, message:
            Mensaje, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            print("Ok Pressed");
        }
        alertController.addAction(okAction);
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DashboardSegue"){
            if let destination = segue.destination as? DashboardViewController {
                destination.googleProfile = self.googleProfile;
                destination.fireProfile = self.fireProfile;
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print(signIn);
        self.present(viewController, animated: true, completion: nil);
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil);
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription);
            return
        }
        
        self.googleProfile = user.profile;
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!);
        FIRAuth.auth()?.signIn(with: credential) { (firebaseuser, error) in
            
            self.fireProfile = firebaseuser;
            self.performSegue(withIdentifier: "DashboardSegue", sender: self);
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        //try! FIRAuth.auth()!.signOut();
        
        print("USER SIGNOUT");
        
    }



}

