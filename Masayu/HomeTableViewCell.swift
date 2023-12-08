//
//  HomeTableViewCell.swift
//  Masayu
//
//  Created by prk on 11/24/23.
//

import UIKit
import CoreData

class HomeTableViewCell: UITableViewCell {
    
    // masi salah
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDistance: UILabel!
    
    @IBOutlet weak var labelPrice: UILabel!
    
    var handleInsert = {
        
    }
    
    @IBAction func addToCartBtn(_ sender: Any) {
        self.handleInsert()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {   
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
