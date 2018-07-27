//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Jose De Jesus Garfias Lopez on 09/01/16.
//  Copyright © 2016 Jose De Jesus Garfias Lopez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreMotion
import RealmSwift
import Parse

class ViewController: UIViewController{
    
    //Instance Variables
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0

    var currentSpeed:Double = 0.0
    var beforeSpeed:Double = 0.0
    var currentMaxForceG: Double = 0.0
    var currentMaxSpeed: Double = 0.0

    var movementManager = CMMotionManager()
    let locationManager = CLLocationManager()
    
    var MaxSettingG = 0.0;
    var MaxSettingS = 0.0;
    
    var KilometersPerHour=0.0;
    var CurrentTimeStamp = "1";

    
    let Store = StoreData();
    var SaveOnDatabase = false;
    
    var device = "";
    
    var TmpToStore:Array<BaseModel> = [];
    
    var Timestamp: String {
        return "\(NSDate().timeIntervalSince1970 * 1000)"
    }
    
    
    var Timer = NSTimer();

    //Outlets
    
    @IBOutlet var accX: UILabel!
    @IBOutlet var accY: UILabel!
    @IBOutlet var accZ: UILabel!
    @IBOutlet var maxAccX: UILabel!
    @IBOutlet var maxAccY: UILabel!
    @IBOutlet var maxAccZ: UILabel!
    
    @IBOutlet var rotX: UILabel!
    @IBOutlet var rotY: UILabel!
    @IBOutlet var rotZ: UILabel!
    @IBOutlet var maxRotX: UILabel!
    @IBOutlet var maxRotY: UILabel!
    @IBOutlet var maxRotZ: UILabel!
    
    @IBOutlet weak var forceG: UILabel!
    
    @IBOutlet weak var forceGX: UILabel!
    @IBOutlet weak var forceGY: UILabel!
    @IBOutlet weak var forceGZ: UILabel!
    
    @IBOutlet weak var maxForceG: UILabel!
    
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var maxSpeed: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var SwitchDatabase: UISwitch!
    
    @IBAction func resetMaxValues(sender: AnyObject) {
        
        
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0
        
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
        
        currentMaxSpeed = 0
        
        currentMaxForceG = 0

    }
    
    override func viewDidLoad() {
        
        self.SwitchDatabase.on = false;
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation();
        
        currentMaxAccelX = 0
        currentMaxAccelY = 0
        currentMaxAccelZ = 0
        
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0

        currentMaxForceG = 0
        currentMaxSpeed = 0

        movementManager.gyroUpdateInterval = 0.2
        movementManager.accelerometerUpdateInterval = 0.2
        
        //Start Recording Data
        
        movementManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            
            self.outputAccData(accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
        
        movementManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: { (gyroData: CMGyroData?, NSError) -> Void in
            self.outputRotData(gyroData!.rotationRate)
            if (NSError != nil){
                print("\(NSError)")
            }
            
            
        })

  
    }
    
    func startTimer(){
        
        self.Timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "saveDataAfterSecond", userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(self.Timer, forMode: NSRunLoopCommonModes);
        
    }
    
    func outputAccData(acceleration: CMAcceleration){
        
        accX?.text = "\(acceleration.x).2fg"
        if fabs(acceleration.x) > fabs(currentMaxAccelX)
        {
            currentMaxAccelX = acceleration.x
        }
        
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(currentMaxAccelY)
        {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(currentMaxAccelZ)
        {
            currentMaxAccelZ = acceleration.z
        }
        
        
        maxAccX?.text = "\(currentMaxAccelX).2f"
        maxAccY?.text = "\(currentMaxAccelY).2f"
        maxAccZ?.text = "\(currentMaxAccelZ).2f"
        
        
        let squareX = acceleration.x * acceleration.x;
        let squareY = acceleration.y * acceleration.y;
        let squareZ = acceleration.z * acceleration.z;
        
        let forceX = acceleration.x / 9.81;
        let forceY = acceleration.y / 9.81;
        let forceZ = acceleration.z / 9.81;
        
        
        let force = fabs(sqrt(squareX + squareY + squareZ) - 1) ;
        
        forceGX.text = "\(forceX)";
        forceGY.text = "\(forceY)";
        forceGZ.text = "\(forceZ)";

        
        forceG.text = "\(force)";
        if fabs(force) > fabs(currentMaxForceG)
        {
            currentMaxForceG = force;
        }
        
        maxForceG.text = "\(currentMaxForceG)";
        
        
        var speedRached = false;
        var GRached = false;
        
        
        if (self.MaxSettingS != 0 && self.MaxSettingG != 0){
            
            if (self.KilometersPerHour >= Double(self.MaxSettingS)){
                speedRached = true;
            }
            
            if(force >= self.MaxSettingS){
                GRached = true;
            }
        }
        
        if(GRached && speedRached){
            self.statusLabel.text = "VELOCIDAD/GRADOS SUPERADA";
        }else if (GRached){
            self.statusLabel.text = "GRADOS SUPERADA";
        }else if(speedRached){
            self.statusLabel.text = "VELOCIDAD SUPERADA";
        }else{
            self.statusLabel.text = "NORMAL";
        }
        
        //APENDD THE DATA TO ARRAY:
        
        if SaveOnDatabase {
            let Tmp:BaseModel = BaseModel();
            Tmp.speed = self.currentSpeed;
            Tmp.absoluteG = force;
            Tmp.forceInX = forceX;
            Tmp.forceInY = forceY;
            Tmp.forceInZ = forceZ;
            Tmp.timestamp = self.CurrentTimeStamp;
            Tmp.device = self.device;
            self.TmpToStore.append(Tmp);
        }
        
        
        /*
        if SaveOnDatabase {
            
            //Just Save One Speed And The Max G........
            
            if self.currentSpeed == self.beforeSpeed {
                print("SAME SPEED");
                
                let Tmp:BaseModel = BaseModel();
                
                Tmp.speed = self.currentSpeed;
                Tmp.absoluteG = force;
                Tmp.forceInX = forceX;
                Tmp.forceInY = forceY;
                Tmp.forceInZ = forceZ;
                Tmp.timestamp = self.CurrentTimeStamp;
                Tmp.device = self.device;
                
                self.TmpToStore.append(Tmp);
                
            }else{
                
                print("DIFERENT SPEED");
                
                self.beforeSpeed = self.currentSpeed;
                
                //Get The MaxG & Save To db
                
                var max = 0.0;
                var maxIndex = 0;
                
                for var index = 0; index < TmpToStore.count; ++index {
                    if self.TmpToStore[index].absoluteG > max {
                        max = self.TmpToStore[index].absoluteG;
                        maxIndex = index;
                    }
                }
                
                print("objs:  \(self.TmpToStore.count)");
                print("MaxIndex: \(maxIndex)");
                if self.TmpToStore.count > 0{
                    Store.SaveBaseModel(self.TmpToStore[maxIndex]);
                    self.TmpToStore = [];
                }

            }

        }

        */
        
    }
    
    func saveDataAfterSecond(){
        
        print("SAVING IN SECOND");
        //GET THE MAX ON ARRAY AND SAVE ON DB:
        var max = 0.0;
        var maxIndex = 0;
        for var index = 0; index < TmpToStore.count; ++index {
            if self.TmpToStore[index].absoluteG > max {
                max = self.TmpToStore[index].absoluteG;
                maxIndex = index;
            }
        }
        if self.TmpToStore.count > 0{
            Store.SaveBaseModel(self.TmpToStore[maxIndex]);
            self.TmpToStore = [];
        }
        
    
    }
    
    func outputRotData(rotation: CMRotationRate){
        
        
        rotX?.text = "\(rotation.x).2fr/s"
        if fabs(rotation.x) > fabs(currentMaxRotX)
        {
            currentMaxRotX = rotation.x
        }
        
        rotY?.text = "\(rotation.y).2fr/s"
        if fabs(rotation.y) > fabs(currentMaxRotY)
        {
            currentMaxRotY = rotation.y
        }
        
        rotZ?.text = "\(rotation.z).2fr/s"
        if fabs(rotation.z) > fabs(currentMaxRotZ)
        {
            currentMaxRotZ = rotation.z
        }
        
        
        maxRotX?.text = "\(currentMaxRotX).2f"
        maxRotY?.text = "\(currentMaxRotY).2f"
        maxRotZ?.text = "\(currentMaxRotZ).2f"
    
        
    }
    
    
    
    
    @IBAction func reset(sender: AnyObject) {
        self.currentMaxForceG = 0.0;
        self.currentMaxAccelX = 0.0;
        self.currentMaxAccelY = 0.0;
        self.currentMaxAccelZ = 0.0;
        
        self.currentMaxSpeed = 0.0;
        
        self.locationManager.startUpdatingLocation();
        
    }
    
    @IBAction func ChangeDatabaseStatment(sender: AnyObject) {
        
        if self.SwitchDatabase.on {
            self.startTimer();
            self.CurrentTimeStamp = Timestamp;
            print("New:TimeStamp : " + self.CurrentTimeStamp );
        }else{
            
            var max = 0.0;
            var maxIndex = 0;
            
            if self.TmpToStore.count > 0{
                
                for var index = 0; index < TmpToStore.count; ++index {
                    if self.TmpToStore[index].absoluteG > max {
                        max = self.TmpToStore[index].absoluteG;
                        maxIndex = index;
                    }
                }
                
                Store.SaveBaseModel(self.TmpToStore[maxIndex]);
                self.TmpToStore = [];
            }
            
            self.Timer.invalidate();
        }
        
        self.SaveOnDatabase = self.SwitchDatabase.on;
        
        
    }
    
    func SendToServerData(){
    
        self.Store.GetAllBaseModel();
        
        for tmp in self.Store.StoredBaseModel {
            
            let newObj = PFObject(className:"BaseModel");
            
            newObj["speed"] = tmp.speed;
            newObj["forceInX"] = tmp.forceInX;
            newObj["forceInY"] = tmp.forceInY;
            newObj["forceInZ"] = tmp.forceInY;
            newObj["absoluteG"] = tmp.absoluteG;
            newObj["timestamp"] = tmp.timestamp;
            
            newObj.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    // The object has been saved.
                    print("SAVED ON PARSE");
                    self.Store.DeleteAllBaseModel();
                    
                } else {
                    print("ERROR" + error!.description);
                }
            }
        }
    }
    
    func DeleteALlInLocal(){
        //self.Store.DeleteAllBaseModel();
    }
    
    @IBAction func Delete(sender: AnyObject) {
        DeleteALlInLocal();
    }
    
    @IBAction func SaveOnServer(sender: AnyObject) {
        SendToServerData();
    }
    
    
}


// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error);
    }
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let speed = location.speed;
            let KMperHour = speed * 3.6;
            
            if fabs(KMperHour) > fabs(currentMaxSpeed){
                currentMaxSpeed = KMperHour;
            }
            
            self.KilometersPerHour = KMperHour;
            
            self.speed.text = "\(KMperHour)";
            self.maxSpeed.text = "\(currentMaxSpeed)";
            
            self.currentSpeed = speed;
            
        }
    }
}
