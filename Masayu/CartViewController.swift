//
//  CartViewController.swift
//  Masayu
//
//  Created by prk on 05/12/23.
//

import UIKit

struct cart{
    var name: String
    var price: Int
    var image: String
}
class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var arrCart = [cart]()
    
    func initCart(){
        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
    }

    @IBOutlet weak var tvCart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCart()
        tvCart.dataSource = self
        tvCart.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 191
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartTableViewCell
        
        cell.nameCartLabel.text = arrCart[indexPath.row].name
        cell.priceCartLabel.text = "Rp. \(arrCart[indexPath.row].price)"
        cell.cartImage.image = UIImage(named: arrCart[indexPath.row].image)
        
        return cell
    }

}
