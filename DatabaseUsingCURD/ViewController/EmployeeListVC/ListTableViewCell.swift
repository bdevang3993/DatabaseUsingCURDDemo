//
//  ListTableViewCell.swift
//  DatabaseUsingCURD
//
//  Created by devang bhavsar on 28/07/20.
//  Copyright © 2020 devang bhavsar. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var imgEmployee: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
