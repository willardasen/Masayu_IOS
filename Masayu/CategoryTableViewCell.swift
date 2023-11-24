//
//  CategoryTableViewCell.swift
//  Masayu
//
//  Created by prk on 11/24/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: CategoryCollectionViewCell!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
