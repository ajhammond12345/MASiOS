//
//  RequestDetail.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class RequestDetail: UIViewController {
    
    var request: [String] = ["", "", ""]

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBAction func willCover(_ sender: Any) {
        //TODO: Update database with covering list
        performSegue(withIdentifier: "back_to_request_list", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = request[0]
        location.text = request[1]
        amount.text = request[2]
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
