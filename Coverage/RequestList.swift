//
//  Request List.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class RequestList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var requestList: [[String]] = [["Alexander Hammond", "Atlanta Municipal", "50.00"], ["Evan Chase", "Gwinett County", "40.00"]]
    
    var selectedRequest: [String] = ["", "", ""]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "requestCell", for: indexPath) as? RequestListCell  else {
            fatalError("The dequeued cell is not an instance of RequestListCell.")
        }
        let request = requestList[indexPath.row]
        
        //TODO: update for request class
        cell.requester.text = request[0]
        cell.location.text = request[1]
        cell.location.text = request[2]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRequest = requestList[indexPath.row]
        performSegue(withIdentifier: "to_request_detail", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RequestDetail {
            let dest = segue.destination as? RequestDetail
            dest?.request = selectedRequest
        }
    }
    
    @IBOutlet weak var requestTable: UITableView!
    
    @IBAction func checkOut(_ sender: Any) {
        //TODO: Check out with database
        performSegue(withIdentifier: "request_list_to_home", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
