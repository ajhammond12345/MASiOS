//
//  UserList.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class UserList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var location: Location?
    var userList: [User]?
    var selectedUser: User?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (userList != nil) {
            return userList!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserListCell  else {
            fatalError("The dequeued cell is not an instance of UserListCell.")
        }
        let user = userList![indexPath.row]
        cell.name.text = user.getName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = userList![indexPath.row]
        performSegue(withIdentifier: "to_user_detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UserDetail {
            let dest = segue.destination as? UserDetail
            dest?.user = selectedUser
            dest?.location = location
        }
    }
    
    @IBOutlet weak var userTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.delegate = self
        userTable.dataSource = self

        //TODO: load users into userList
        if (location != nil) {
            userList = location?.checkedIn
            print(location?.checkedIn?.count ?? 0)
            for user: User in (location?.checkedIn)! {
                print("Loading in user \(String(describing: user.getName()))")
            }
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
