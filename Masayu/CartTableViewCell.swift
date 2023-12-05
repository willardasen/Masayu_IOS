//
//  CartTableViewCell.swift
//  Masayu
//
//  Created by prk on 05/12/23.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartImage: UIImageView!
    
    @IBOutlet weak var nameCartLabel: UILabel!
    
    @IBOutlet weak var priceCartLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
