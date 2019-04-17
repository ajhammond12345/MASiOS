//
//  Location.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class Location: NSObject {
    var lid: String
    var name: String
    var checkedIn: [User]?
    var requests: [Request]?
    
    override convenience init() {
        self.init(id: "", locationName: "")
    }
    
    init(id: String, locationName: String) {
        lid = id
        name = locationName
    }
    
    init(id: String, locationName: String, checked: [User], reqs: [Request]) {
        lid = id
        name = locationName
        checkedIn = checked
        requests = reqs
    }
    
    convenience init(dict: NSDictionary) {
        let id: String = dict["lid"] as? String ?? ""
        let locationName: String = dict["name"] as? String ?? ""
        let checked: NSDictionary = dict["checkedIn"] as? NSDictionary ?? [:]
        let reqs: NSDictionary = dict["requests"] as? NSDictionary ?? [:]
        var userList:[User] = []
        for tmp in checked {
            userList.append(User(dict: tmp.value as! NSDictionary))
        }
        
        var reqList:[Request] = []
        for tmp in reqs {
            reqList.append(Request(dict: tmp.value as! NSDictionary))
        }
        
        self.init(id: id, locationName: locationName, checked: userList, reqs: reqList)
        
    }
    
    func toDict() -> NSDictionary {
        var checkedInDict: Dictionary<String, NSDictionary> = [:]
        for user: User in checkedIn! {
            checkedInDict[user.uid] = user.toDict()
            print("usering")
            print(user.toDict())
        }
        var reqDict: Dictionary<String, NSDictionary> = [:]
        for request: Request in requests! {
            reqDict[request.rid] = request.toDict()
            print("Requestingan;ldj")
            print(request.toDict())
        }
        return ["lid": self.lid,
                "name": self.name,
                "checkedIn": checkedInDict,
                "requests": reqDict]
    }
    
}
