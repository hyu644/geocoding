//
//  ViewController.swift
//  GeoCoding
//
//  Created by hyu on R 2/06/18.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    @IBOutlet weak var AddressText: UITextField!
    @IBOutlet weak var geoButton: UIButton!
    @IBOutlet weak var resultText: UILabel!
    
    var fieldTextData = ""
    //var locationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AddressText.delegate = self
        
        
       }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        AddressText.resignFirstResponder()
        fieldTextData = AddressText.text!
        print(fieldTextData)
        return true
    }
    
    @IBAction func textTogeoAction(_ sender: UIButton) {
        CLGeocoder().geocodeAddressString(fieldTextData){
         [weak self](placeMarks, error) in
            guard let placeMark = placeMarks?.first,
                let latitude = placeMark.location?.coordinate.latitude,
                let longitude = placeMark.location?.coordinate.longitude
                
            else{
                 return
            }
            self?.resultText.text = "lat" + String(latitude) + "long" + String(longitude)
        }
    }
}

