//
//  SettingsViewController.swift
//  Masayu
//
//  Created by prk on 12/12/23.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBAction func onLogOutClick(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("Successfully logged out")
        }
        catch {
            print("Error while signing out")
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
