//
//  NewsTableViewCell.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/25/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsLikes: UIButton!
    @IBOutlet weak var newsComments: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
