//
//  RequestDetail.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class RequestDetail: UIViewController {
    
    var request: Request?
    var location: Location?

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBAction func willCover(_ sender: Any) {
        //TODO: Update database with covering list
        request!.finalCover = Model.model.getCurrentUser()!.uid
        Model.model.updateRequest(request: request!)
        performSegue(withIdentifier: "back_to_request_list", sender: self)
    }
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "back_to_request_list", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RequestList {
            let dest = segue.destination as? RequestList
            dest?.location = location
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user: User = User(id: request!.uid)
        Model.model.getUser(uid: request!.uid, user: user)
        name.text = user.getName()
        locationLabel.text = location?.name
        amount.text = request?.amount
        time.text = request?.time
        date.text = request?.date
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
