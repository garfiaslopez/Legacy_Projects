//
//  StoreData.swift
//  nun2x3
//
//  Created by Jose De Jesus Garfias Lopez on 26/11/15.
//  Copyright © 2015 Jose De Jesus Garfias Lopez. All rights reserved.
//

import Foundation
import RealmSwift
import Parse


class BaseModel: Object {
    
    //Piece of scanning.
    dynamic var speed = 0.0;
    dynamic var forceInX = 0.0;
    dynamic var forceInY = 0.0;
    dynamic var forceInZ = 0.0;
    dynamic var absoluteG = 0.0;
    dynamic var timestamp = "";
    dynamic var device = "";
    dynamic var date = NSDate();
    
}

class StoreData {

    let realm = try! Realm();
    var StoredBaseModel:Array<BaseModel> = [];

    
    func SaveBaseModel(BaseObj:BaseModel){
        try! realm.write {
            self.realm.add(BaseObj);
        }
    }
    
    
    func GetAllBaseModel(){
        
        self.StoredBaseModel = [];
        
        let Query = realm.objects(BaseModel);
        for BM in Query {
            self.StoredBaseModel.append(BM);
        }
    }
    
    
    func DeleteAllBaseModel(){
        let Query = realm.objects(BaseModel);
        try! realm.write {
            self.realm.delete(Query);
        }
    }
    
}

