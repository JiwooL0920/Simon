//
//  LoginViewController.swift
//  SimonGame
//
//  Created by Jiwoo Lee on 2019-11-01.
//  Copyright © 2019 Jiwoo Lee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        //hide errorlabel
        errorLabel.alpha = 0
        //ui
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(backButton)
    }

    @IBAction func loginTapped(_ sender: Any) {
    }
    

}
