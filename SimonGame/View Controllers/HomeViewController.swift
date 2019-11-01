//
//  HomeViewController.swift
//  SimonGame
//
//  Created by Jiwoo Lee on 2019-11-01.
//  Copyright © 2019 Jiwoo Lee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
}
