//
//  Model.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/16/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit
import FirebaseDatabase



class Model: NSObject {
    
    static let model = Model()
    
    private var locations: [Location]
    private var requests: [Request]
    
    var currentUser: User?
    
    var ref: DatabaseReference = Database.database().reference()
    
    
    func getCurrentUser() -> User? {
        return currentUser
    }
    
    func setCurrentUser(user: User?) {
        currentUser = user
    }
    
    func getLocations() -> [Location] {
        var tmpLocs: [Location] = []
        ref.child("locations").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let locationDict = snapshot.value as? NSDictionary
            for tmp in locationDict! {
                let location: Location = Location(dict: tmp.value as! NSDictionary)
                tmpLocs.append(location)
            }
            self.locations = tmpLocs
            
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        print("Updating Locations")
        return locations
    }
    
    func getRequests() -> [Request] {
        var tmpReqs: [Request] = []
        ref.child("requests").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let requestDict = snapshot.value as? NSDictionary
            for tmp in requestDict ?? [:] {
                let request: Request = Request(dict: tmp.value as! NSDictionary)
                tmpReqs.append(request)
            }
            self.requests = tmpReqs
            
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        print("Updating Requests")
        return requests
    }
    
    func getUser(uid: String, user: User) {
        ref.child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let tmp = User(dict: value ?? [:])
            user.email = tmp.email
            user.fname = tmp.fname
            user.lname = tmp.lname
            user.uid = tmp.uid
            user.phone = tmp.phone

        }) { (error) in
            print(error.localizedDescription)
        }
        print("Getting user: \(uid)")
    }
    
    func updateRequest(request: Request) {
        if request.rid == "" {
            request.rid = self.ref.child("requests").childByAutoId().key!
        }
        print("Updating Request: \(request.rid)")
        self.ref.child("requests").child(request.rid).setValue(request.toDict())
        getRequests()
    }
    
    func updateUser(user: User) {
        print("Updating User: \(user.uid)")
        self.ref.child("users").child(user.uid).setValue(user.toDict())
    }
    
    func updateLocation(location: Location) {
        print("Updating Location: \(location.lid)")
        self.ref.child("locations").child(location.lid).setValue(location.toDict())
        getLocations()
    }
    
    func login(uid: String) {
        print("Logging in user: \(uid)")
        let user: User = User(id: uid)
        getUser(uid: uid, user: user)
        setCurrentUser(user: user)
    }
    
    
    private override init() {
        currentUser = nil
        locations = []
        requests = []
        
    }

}
