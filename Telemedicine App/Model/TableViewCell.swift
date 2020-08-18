//
//  TableViewCell.swift
//  sideMenuBar
//
//  Created by Rukhsar on 17/08/2020.
//  Copyright © 2020 Rukhsar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

 
    @IBOutlet weak var sideBarImageView: UIImageView!
    @IBOutlet weak var sideBarLabelName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //        tableView.separatorStyle = .none
        //        tableView.rowHeight = 80.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
