//
//  Request List.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class RequestList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var location: Location?
    
    var requestList: [Request]?
    
    var selectedRequest: Request?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (requestList != nil) {
            return requestList!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "requestCell", for: indexPath) as? RequestListCell  else {
            fatalError("The dequeued cell is not an instance of RequestListCell.")
        }
        let request = requestList![indexPath.row]
        
        //TODO: update for request class
        cell.date.text = "\(request.date) \(request.time)"
        cell.location.text = location!.name
        cell.amount.text = request.amount
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRequest = requestList![indexPath.row]
        performSegue(withIdentifier: "to_request_detail", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RequestDetail {
            let dest = segue.destination as? RequestDetail
            dest?.request = selectedRequest
            dest?.location = location
        }
    }
    
    @IBOutlet weak var requestTable: UITableView!
    
    @IBAction func checkOut(_ sender: Any) {
        var i: Int = 0
        while i < location!.checkedIn!.count {
            if location!.checkedIn![i].uid == Model.model.getCurrentUser()?.uid {
                location?.checkedIn?.remove(at: i)
            } else {
                i += 1
            }
        }
        Model.model.updateLocation(location: location!)
        performSegue(withIdentifier: "request_list_to_home", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (location != nil) {
            requestList = location?.requests
        }
        requestTable.delegate = self
        requestTable.dataSource = self
        
        //TODO: load requests into requestList
        
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
