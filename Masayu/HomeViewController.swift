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

    var nameTemp: String? = ""
    var priceTemp: String? = ""
    var imageTemp: String? = ""
    
    func initFood(){
        arrFood.append(food(name: "Soto Betawi", distance: "0.2km", price: 25000, image: "Soto"))
        arrFood.append(food(name: "Ayam Betutu", distance: "0.5km", price: 30000, image: "Ayam Betutu"))
        arrFood.append(food(name: "Bika Ambon", distance: "0.2km", price: 20000, image: "Medan"))
        arrFood.append(food(name: "Capcay", distance: "0.2km", price: 20000, image: "Capcay"))
        arrFood.append(food(name: "Sate Padang", distance: "1.2km", price: 10000, image: "Padang"))
        arrFood.append(food(name: "Nasi Lemak", distance: "1.5km", price: 15000, image: "Riau"))
        arrFood.append(food(name: "Mie Aceh", distance: "0.2km", price: 25000, image: "Mie Aceh"))
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameTemp = arrFood[indexPath.row].name
        priceTemp = String(arrFood[indexPath.row].price)
        imageTemp = arrFood[indexPath.row].image
        self.performSegue(withIdentifier: "detailView", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailView" {
            if let info = segue.destination as? FoodDetailViewController {
                info.foodNameTemp = nameTemp
                info.priceTemp = priceTemp
                info.foodImageTemp = imageTemp
            }
        }
        
        
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
