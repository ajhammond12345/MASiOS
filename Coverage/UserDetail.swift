//
//  UserDetail.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class UserDetail: UIViewController {

    var location: Location?
    var user: User?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UserList {
            let dest = segue.destination as? UserList
            dest?.location = location
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user != nil {
            name.text = user?.getName()
            email.text = user?.email
            phone.text = user?.phone
        } else {
            email.text = "Unable to load user"
            name.text = ""
            phone.text = ""
        }
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
