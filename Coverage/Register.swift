//
//  Register.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit
import FirebaseAuth

class Register: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle? = nil
    
    @IBAction func register(_ sender: Any) {
        let emailText = email.text
        let firstNameText = firstName.text
        let lastNameText = lastName.text
        let phoneText = phone.text
        let passwordText = password.text
        let confirmPasswordText = confirmPassword.text
        
        if emailText != nil && firstNameText != nil && lastNameText != nil && phoneText != nil && passwordText != nil && confirmPasswordText != nil && passwordText!.elementsEqual(confirmPasswordText!) {
            Auth.auth().createUser(withEmail: emailText!, password: passwordText!) { authResult, error in
                //nothin, gets logged in below
                
            }

            performSegue(withIdentifier: "register_to_home", sender: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let emailText = self.email.text!
                let firstNameText = self.firstName.text!
                let lastNameText = self.lastName.text!
                let phoneText = self.phone.text!
                let passwordText = self.password.text!
                let confirmPasswordText = self.confirmPassword.text!
                let newUser = User(id: uid, first: firstNameText, last: lastNameText, emailAddress: emailText, phoneNumber: phoneText)
                Model.model.updateUser(user: newUser)
                Model.model.login(uid: uid)
                
                // ...
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
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
