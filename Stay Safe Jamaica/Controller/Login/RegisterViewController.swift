//
//  RegisterViewController.swift
//  Stay Safe Jamaica
//
//  Created by Jase-Omeileo West on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController
{
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let showReportMapViewSegue = "showReportMapViewController"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(_ sender: UIButton)
    {
        if let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text
        {
            Auth.auth().createUser(withEmail: email, password: password) {(user, error) in
                if error != nil
                {
                    //try testing for specific errors
                    self.showAlert(title: "Error", message: "Sorry, but the information provided won't work. Try again.")
                }
                else
                {
                    // TODO: set user first and last name
                    
                    
                    self.performSegue(withIdentifier: self.showReportMapViewSegue, sender: self)
                }
            }
        }
    }

    @IBAction func loginUser(_ sender: UIButton)
    {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
