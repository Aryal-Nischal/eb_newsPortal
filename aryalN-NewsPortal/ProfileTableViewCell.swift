//
//  ProfileTableViewCell.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/5/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

//MARK: - Outlets
    
    @IBOutlet weak var profileCellLabel: UILabel!
    @IBOutlet weak var profileCellTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
