//
//  UserList.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class UserList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userList: [String] = ["Alexander Hammond", "Evan Chase"]
    var selectedUser: String = ""
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserListCell  else {
            fatalError("The dequeued cell is not an instance of UserListCell.")
        }
        let user = userList[indexPath.row]
        cell.name.text = user
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userList[indexPath.row]
        performSegue(withIdentifier: "to_user_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UserDetail {
            let dest = segue.destination as? UserDetail
            dest?.user = selectedUser
        }
    }
    
    @IBOutlet weak var userTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.delegate = self
        userTable.dataSource = self

        //TODO: load users into userList
        
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
