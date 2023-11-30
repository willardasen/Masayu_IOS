//
//  LoginViewController.swift
//  Masayu
//
//  Created by prk on 11/23/23.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var loginTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        
    }
    
}
