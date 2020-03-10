//
//  DrinksListCell.swift
//  Geloou
//
//  Created by Luiz Antonio Bolsoni Riboli on 10/03/20.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class DrinksListCell: UITableViewCell {

    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
