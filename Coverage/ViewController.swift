//
//  ViewController.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        Model.model.getRequests()
        Model.model.getLocations()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

