//
//  CustomTableViewCell.swift
//  MVVMAgeOfEmpires2
//
//  Created by Jordi Milla on 04/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var armyTypeLabel: UILabel!
    
    var data: Civilizations?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(civilizations: Civilizations?) {
        
        self.data = civilizations
        nameLabel.text = self.data?.name ?? ""
        armyTypeLabel.text = self.data?.army_type ?? ""
        
    }
    
}
