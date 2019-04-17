//
//  Login.swift
//  Coverage
//
//  Created by Alexander Hammond on 4/13/19.
//  Copyright © 2019 teamhmq. All rights reserved.
//

import UIKit
import FirebaseAuth

class Login: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!

    @IBAction func login(_ sender: Any) {
        let emailText = email.text
        let passwordText = password.text
        
        if emailText != nil && passwordText != nil {
            //TODO: Login w/ firebase
            Auth.auth().signIn(withEmail: emailText!, password: passwordText!) {
                [weak self] user, error in
                guard self != nil else {
                    return
                }
                if let user = user {
                    Model.model.login(uid: user.user.uid)
                    self!.performSegue(withIdentifier: "login_to_home", sender: self)
                } else {
                    //TODO: Sign in failed
                }
            }
            
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
