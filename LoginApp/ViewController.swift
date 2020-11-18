//
//  ViewController.swift
//  LoginApp
//
//  Created by Maheshwara Reddy on 11/17/20.
//

import UIKit
import SwiftSpinner
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        SwiftSpinner.show("Logging in...")
        Auth.auth().signIn(withEmail: email!, password: password!) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            self?.txtPassword.text = ""
            
            // I have successfully logged in  go to Dashboard
            self!.performSegue(withIdentifier: "loginSegue", sender: strongSelf)
        }
    }

    @IBAction func performForgotPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPasswordSegue", sender: self)
    }
    
    @IBAction func performSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: self)
    }
}

