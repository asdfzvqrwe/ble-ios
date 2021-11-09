//
//  SideMenuTableViewCell.swift
//  bluetoothtest2
//
//  Created by 세진시스템 on 2021/08/31.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var column1TextLabel: UILabel! {
        didSet {
            column1TextLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
