//
//  TableViewCell.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    //Mark:- Outlet
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
