//
//  HomeTableViewCell.swift
//  Masayu
//
//  Created by prk on 11/24/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDistance: UILabel!
    
    @IBOutlet weak var labelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
