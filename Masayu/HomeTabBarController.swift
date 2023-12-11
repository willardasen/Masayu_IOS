//
//  HomeTabBarController.swift
//  Masayu
//
//  Created by prk on 12/7/23.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var emailCurrent: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        print("Current email msk hahahaha: " + emailCurrent)
        print("ini load di controller ")
        // Do any additional setup after loading the view.
    }
    

}
