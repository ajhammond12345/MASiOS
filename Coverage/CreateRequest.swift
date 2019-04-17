//
//  CreateRequest.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class CreateRequest: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var locationSelected: Location?
    
    var locationList: [Location]? = nil
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (locationList != nil) {
            return locationList!.count;
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
    @IBOutlet weak var dateTime: UIDatePicker!
    @IBOutlet weak var amount: UITextField!
    
    @IBAction func createRequest(_ sender: Any) {
        let today = Date()
        let date = dateTime.date;
        let calendar = Calendar.current
        
        let todayMonth = calendar.component(.month, from: today)
        let todayDay = calendar.component(.day, from: today)
        let todayYear = calendar.component(.year, from: today)
        
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        let dateText = "\(day)/\(month)/\(year)"
        let todayText = "\(todayDay)/\(todayMonth)/\(todayYear)"
        let timeText = "\(hour)/\(minute)"
        let locationText = locationSelected?.name;
        
        let amountText = amount.text
        
        if (amountText != nil && amountText != "" && dateText != "" && timeText != "" && locationSelected != nil) {
            let request = Request(user: (Model.model.getCurrentUser()?.uid)!, day: dateText, when: timeText, location: locationText!, money: amountText!)
            
            Model.model.updateRequest(request: request)
            locationSelected?.requests?.append(request)
            Model.model.updateLocation(location: locationSelected!)
            
            if dateText.elementsEqual(todayText) {
                performSegue(withIdentifier: "create_request_to_checked_in", sender: self)
            } else {
                performSegue(withIdentifier: "create_request_to_home", sender: self)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UserList {
            let dest = segue.destination as? UserList
            dest?.location = locationSelected
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.location.delegate = self
        self.location.dataSource = self
        
        locationList = Model.model.getLocations()

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
