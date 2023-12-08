//
//  TabViewController.swift
//  Masayu
//
//  Created by prk on 11/27/23.
//

import UIKit

class TabViewController: UITabBarController {
    
    var emailCurrent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print("Current email msk hahahaha: " + emailCurrent)
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
