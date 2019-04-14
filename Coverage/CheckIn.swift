//
//  CheckIn.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class CheckIn: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var locationSelected: String = ""
    
    let locationList = ["Atlanta Municipal Court", "Fulton County Court", "Gwinnet County Court"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationList.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationSelected = locationList[row]
    }
    
    @IBOutlet weak var location: UIPickerView!

    @IBAction func checkIn(_ sender: Any) {
        let locationText = locationSelected
        
        if locationText != "" {
            print(locationText)
            //check in to database
            performSegue(withIdentifier: "to_request_list", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.delegate = self;
        location.dataSource = self;

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
