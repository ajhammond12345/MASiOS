//
//  User.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class User: NSObject {
    var uid: String
    var fname: String
    var lname: String
    var email: String
    var phone: String
    
    
    init(id: String, first: String, last: String, emailAddress: String, phoneNumber: String) {
        self.uid = id
        self.fname = first
        self.lname = last
        self.email = emailAddress
        self.phone = phoneNumber
    }
    
    convenience init(id: String) {
        self.init(id: id, first: "", last: "", emailAddress: "", phoneNumber: "")
    }
    
    override convenience init() {
        self.init(id: "")
    }
    
    convenience init(dict: NSDictionary) {
        let id: String = dict["uid"] as? String ?? ""
        let first: String = dict["fname"] as? String ?? ""
        let last: String = dict["lname"] as? String ?? ""
        let emailAddress: String = dict["email"] as? String ?? ""
        let phoneNumber: String = dict["phone"] as? String ?? ""
        self.init(id: id, first: first, last: last, emailAddress: emailAddress, phoneNumber: phoneNumber)
        
    }
    
    func toDict() -> NSDictionary {
        return ["uid": self.uid,
                "fname": self.fname,
                "lname": self.lname,
                "email": self.email,
                "phone": self.phone]
    }
    
    func getName() -> String? {
        if fname != "" || lname != "" {
            return "\(fname) \(lname)"
        } else {
            return nil;
        }
    }
    
    
}
