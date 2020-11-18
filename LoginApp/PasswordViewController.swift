//
//  PasswordViewController.swift
//  LoginApp
//
//  Created by Maheshwara Reddy on 11/18/20.
//
import UIKit
import Firebase
import SwiftSpinner

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        let email = txtEmail.text
        if email == "" {
            lblStatus.text = "Please enter your email"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter a valid email"
            return
        }
        SwiftSpinner.show("Sending link to reset your password...")
        Auth.auth().sendPasswordReset(withEmail: email!) { error in SwiftSpinner.hide()
        let strongSelf = self
        if error != nil {
            strongSelf.lblStatus.text = error?.localizedDescription
            return
        }
        strongSelf.lblStatus.text = "Sent"
        self.navigationController?.popViewController(animated: true)
        }
    }
}
