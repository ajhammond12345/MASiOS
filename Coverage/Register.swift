//
//  Register.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit

class Register: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func register(_ sender: Any) {
        let emailText = email.text
        let firstNameText = firstName.text
        let lastNameText = lastName.text
        let phoneText = phone.text
        let passwordText = password.text
        let confirmPasswordText = confirmPassword.text
        
        if emailText != nil && firstNameText != nil && lastNameText != nil && phoneText != nil && passwordText != nil && confirmPasswordText != nil && passwordText!.elementsEqual(confirmPasswordText!) {
            //TODO: register w/ firebase
            performSegue(withIdentifier: "register_to_home", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
