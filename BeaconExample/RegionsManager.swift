//
//  RegionsManager.swift
//  BeaconExample
//
//  Created by eze on 11/19/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import UIKit
import CoreLocation

class RegionsManager: NSObject {

    static let sharedInstance : RegionsManager = RegionsManager()
    
    var region1 : CLBeaconRegion!
    var region2 : CLBeaconRegion!
    
    private override init() {
        
        let uuid : NSUUID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!
        
        region1 = CLBeaconRegion(proximityUUID: uuid, major: 36613, minor: 54594, identifier: "Beacon ICE")
        region1.notifyOnEntry = true
        region1.notifyOnExit = true
        region1.notifyEntryStateOnDisplay = true
        
        region2 = CLBeaconRegion(proximityUUID: uuid, major: 46289, minor: 59383, identifier: "Beacon MINT")
        region2.notifyOnEntry = true
        region2.notifyOnExit = true
        region2.notifyEntryStateOnDisplay = true
        
        super.init()
    }
}
