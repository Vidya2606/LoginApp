//
//  SignupViewController.swift
//  LoginApp
//
//  Created by Maheshwara Reddy on 11/18/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignupViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }    
    @IBAction func performSignUp(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        SwiftSpinner.show("Signing in...")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
            let strongSelf = self
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            self.txtPassword.text = ""
            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
}
