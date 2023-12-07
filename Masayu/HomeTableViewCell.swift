//
//  HomeTableViewCell.swift
//  Masayu
//
//  Created by prk on 11/24/23.
//

import UIKit
import CoreData

class HomeTableViewCell: UITableViewCell {
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDistance: UILabel!
    
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBAction func addToCartBtn(_ sender: Any) {
        let nameText = labelName.text!
        let priceText = labelDistance.text!
        let imageString = "Ayam Betutu" // nanti diganti
        
        let entityTarget = NSEntityDescription.entity(forEntityName: "UserCart", in: context)
        
        let newCart = NSManagedObject(entity: entityTarget!, insertInto: context)
        
        newCart.setValue(nameText, forKey: "food")
        newCart.setValue(Int(priceText), forKey: "price")
        newCart.setValue(imageString, forKey: "image")
        newCart.setValue("wil@gmail.com", forKey: "email")
        
        do {
            try context.save()
            print("Added to cart")
        } catch {
            print("Error while adding to cart")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        context = appDelegate.persistentContainer.viewContext
    }

    override func setSelected(_ selected: Bool, animated: Bool) {   
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
