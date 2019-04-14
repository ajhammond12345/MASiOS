//
//  CreateRequest.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class CreateRequest: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        let locationText = locationSelected;
        
        let amountText = amount.text
        
        if (amountText != nil && dateText != "" && timeText != "" && locationText != "") {
            //TODO: createRequest in database here
            
            if dateText.elementsEqual(todayText) {
                performSegue(withIdentifier: "create_request_to_checked_in", sender: self)
            } else {
                performSegue(withIdentifier: "create_request_to_home", sender: self)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.location.delegate = self
        self.location.dataSource = self

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
