//
//  HomeViewController.swift
//  Masayu
//
//  Created by prk on 11/23/23.
//

import UIKit


struct food {
    var name: String?
    var distance: String?
    var price: Int
    var image: String?
    
}

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tvFood: UITableView!
    
    var arrFood = [food]()
    
    func initFood(){
        arrFood.append(food(name: "Soto betawi", distance: "0.2km", price: 25000, image: "Soto"))
        arrFood.append(food(name: "Soto betawi", distance: "0.2km", price: 25000, image: "Soto"))
        arrFood.append(food(name: "Soto betawi", distance: "0.2km", price: 25000, image: "Soto"))
        arrFood.append(food(name: "Soto betawi", distance: "0.2km", price: 25000, image: "Soto"))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFood()
        tvFood.dataSource = self
        tvFood.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        cell.labelName.text = arrFood[indexPath.row].name
        cell.labelDistance.text = arrFood[indexPath.row].distance
        cell.labelPrice.text = "Rp. \(arrFood[indexPath.row].price)"
        cell.imgFood.image = UIImage(named: arrFood[indexPath.row].image!)
        
        return cell
    }

    

}
