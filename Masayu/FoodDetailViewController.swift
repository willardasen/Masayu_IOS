//
//  FoodDetailViewController.swift
//  Masayu
//
//  Created by prk on 12/6/23.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodNameTxt: UILabel!
    
    @IBOutlet weak var priceTxt: UILabel!
    
    
    var foodNameTemp: String?
    var priceTemp: String?
    var foodImageTemp: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodNameTxt.text = foodNameTemp
        priceTxt.text = priceTemp
        foodImage.image = UIImage(named: foodImageTemp!)
        // Do any additional setup after loading the view.
    }

}
