//
//  CheckIn.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class CheckIn: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var locationSelected: Location?
    
    var locationList: [Location]? = nil
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (locationList != nil) {
            return locationList!.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationList?[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row < locationList?.count ?? 0 {
            locationSelected = locationList?[row]
        }
    }
    
    @IBOutlet weak var location: UIPickerView!

    @IBAction func checkIn(_ sender: Any) {
        if locationSelected != nil {
            locationSelected?.checkedIn?.append(Model.model.getCurrentUser()!)
            Model.model.updateLocation(location: locationSelected!)
            performSegue(withIdentifier: "to_request_list", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.delegate = self;
        location.dataSource = self;
        
        locationList = Model.model.getLocations()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RequestList {
            let dest = segue.destination as? RequestList
            dest?.location = locationSelected
            
        }
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
