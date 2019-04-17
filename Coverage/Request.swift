//
//  Request.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

/*
 String rid;
 
 String uid;
 String date;
 String time;
 String locationID;
 String amount;
 
 String finalCover;
 ArrayList<String> potentialCoverage;
 */

class Request: NSObject {
    var rid: String
    var uid: String
    var date: String
    var time: String
    var locationID: String
    var amount: String
    var finalCover: String
    var potentialCoverage: [String]?
    
    init(id: String, user: String, day: String, when: String, location: String, money: String, cover: String, potential: [String]?) {
        rid = id
        uid = user
        date = day
        time = when
        locationID = location
        amount = money
        finalCover = cover
        potentialCoverage = potential
    }
    
    convenience init(user: String, day: String, when: String, location: String, money: String) {
        self.init(id: "", user: user, day: day, when: when, location: location, money: money, cover: "", potential: nil)
    }
    
    convenience init(dict: NSDictionary) {
        let id: String = dict["rid"] as? String ?? ""
        let user: String = dict["uid"] as? String ?? ""
        let day: String = dict["date"] as? String ?? ""
        let when: String = dict["time"] as? String ?? ""
        let location: String = dict["locationID"] as? String ?? ""
        let money: String = dict["amount"] as? String ?? ""
        let cover: String = dict["finalCover"] as? String ?? ""
        let potential: NSArray = dict["potentialCoverage"] as? NSArray ?? []
        
        var userList:[String] = []
        for user in potential {
            let tmp: String = user as? String ?? ""
            if (tmp != "") {
                userList.append(tmp)
            }
        }
        
        self.init(id: id, user: user, day: day, when: when, location: location, money: money, cover: cover, potential: userList)
        
    }
    
    func toDict() -> NSDictionary {
        let tmp: NSArray = NSArray()
        for id in potentialCoverage ?? [] {
            tmp.adding(id)
        }
        return ["rid": self.rid,
                "uid": self.uid,
                "date": self.date,
                "time": self.time,
                "locationID": self.locationID,
                "amount": self.amount,
                "finalCover": self.finalCover,
                "potentialCoverage": tmp]
    }
    
}
