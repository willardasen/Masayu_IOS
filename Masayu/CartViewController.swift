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
        
        tvCart.dataSource = self
        tvCart.delegate = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        fetchUserCart()
        
        for data in arrCart {
            print(data.name)
            print(data.price)
        }
        
        print("didload called")
    }

    func fetchUserCart(){
        arrCart.removeAll()
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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let oldNameCart = arrCart[indexPath.row].name

            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")

            request.predicate = NSPredicate(format: "email==%@ && foodName==%@", email, oldNameCart)

            do{
                let results = try context.fetch(request) as! [NSManagedObject]

                for data in results{
                    context.delete(data)
                }

                try context.save()

                fetchUserCart()

                for data in arrCart {
                    print(data.name)
                    print(data.price)
                }
            }catch{
                print("Error deleting")
            }
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
