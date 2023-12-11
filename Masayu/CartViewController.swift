//
//  CartViewController.swift
//  Masayu
//
//  Created by prk on 05/12/23.
//

import UIKit
import CoreData

struct cart{
    var name: String
    var price: Int
    var image: String
}
class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var arrCart = [cart]()
    
    var context: NSManagedObjectContext!
    
    var email: String!
    
//    func initCart(){
//        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
//        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
//        arrCart.append(cart(name: "Mie Aceh", price: 25000, image: "Soto"))
//    }

    @IBOutlet weak var tvCart: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = tabBarController as! HomeTabBarController
        
        email = tabBar.emailCurrent
        
//        initCart()
//        fetchUserCart()
        tvCart.dataSource = self
        tvCart.delegate = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        if context == (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            // Gunakan context di sini
            print("fetched")
        } else {
            fatalError("Failed to obtain NSManagedObjectContext")
        }
        // Do any additional setup after loading the view.
    }

    func fetchUserCart(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")

        do{
            let results = try context.fetch(request) as! [NSManagedObject]

            for data in results{
                if((data.value(forKey: "email") as! String) == email){
                    arrCart.append(cart(name: data.value(forKey: "foodName") as! String,
                                        price: data.value(forKey: "price") as! Int,
                                        image: data.value(forKey: "image") as! String)
                    )
                }
            }
            tvCart.reloadData()
            print("Fetching Successful")
        } catch{
            print("Fetching Failed")
        }

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
