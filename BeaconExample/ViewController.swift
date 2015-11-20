//
//  ViewController.swift
//  BeaconExample
//
//  Created by eze on 11/19/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import UIKit
import Darwin
import CoreLocation

protocol BeaconDelegate
{
    func updateBeaconLocation(beacon : CLBeacon, region : CLBeaconRegion)
    func didEnterRegion(region : CLBeaconRegion)
    func didExitRegion(region : CLBeaconRegion)
}

class ViewController: UIViewController, BeaconDelegate {

    @IBOutlet weak var accuracyProgressBar1: UIProgressView!
    @IBOutlet weak var beaconProximityLabel1: UILabel!
    @IBOutlet weak var beaconIDLabel1: UILabel!
    
    @IBOutlet weak var accuracyProgressBar2: UIProgressView!
    @IBOutlet weak var beaconProximityLabel2: UILabel!
    @IBOutlet weak var beaconIDLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //--------------------------------------
    // MARK: Setup
    //--------------------------------------

    func setupView () {
        let transform : CGAffineTransform = CGAffineTransformMakeScale(1.0, 3.0)
        accuracyProgressBar1.transform = transform
        accuracyProgressBar2.transform = transform
        
        beaconIDLabel1.text = "Unknown"
        beaconProximityLabel1.text = "Unknown"
        beaconIDLabel2.text = "Unknown"
        beaconProximityLabel2.text = "Unknown"
    }
    
    func updateBeaconLocation(beacon : CLBeacon, region : CLBeaconRegion) {
        if region == RegionsManager.sharedInstance.region1 {
            switch beacon.proximity
            {
            case CLProximity.Far:
                beaconProximityLabel1.text = "Far"
            case CLProximity.Near:
                beaconProximityLabel1.text = "Near"
            case CLProximity.Immediate:
                beaconProximityLabel1.text = "Immediate"
            default:
                break;
            }
            
            print("Accuracy: \(beacon.accuracy)\nRSSI: \(beacon.rssi)")
            if beacon.accuracy > 0 {
                let accuracy : Float = Float(1 - beacon.accuracy / 8) // 8 mts is the max distance regitered by my phone
                accuracyProgressBar1.setProgress(accuracy, animated: true)
            }
        }
        else {
            switch beacon.proximity
            {
            case CLProximity.Far:
                beaconProximityLabel2.text = "Far"
            case CLProximity.Near:
                beaconProximityLabel2.text = "Near"
            case CLProximity.Immediate:
                beaconProximityLabel2.text = "Immediate"
            default:
                break;
            }
            
            print("Accuracy: \(beacon.accuracy)\nRSSI: \(beacon.rssi)")
            if beacon.accuracy > 0 {
                let accuracy : Float = Float(1 - beacon.accuracy / 8) // 8 mts is the max distance regitered by my phone
                accuracyProgressBar2.setProgress(accuracy, animated: true)
            }
        }
    }
    
    func didEnterRegion(region : CLBeaconRegion) {
        //Start Ranging
        if region == RegionsManager.sharedInstance.region1 {
            beaconIDLabel1.text = RegionsManager.sharedInstance.region1.identifier
        }
        else {
            beaconIDLabel2.text = RegionsManager.sharedInstance.region2.identifier
        }
    }
    
    func didExitRegion(region : CLBeaconRegion) {
        //Stop Ranging here
        if region == RegionsManager.sharedInstance.region1 {
            beaconIDLabel1.text = "Unknown"
            beaconProximityLabel1.text = "Unknown"
        }
        else {
            beaconIDLabel2.text = "Unknown"
            beaconProximityLabel2.text = "Unknown"
        }
    }
}

