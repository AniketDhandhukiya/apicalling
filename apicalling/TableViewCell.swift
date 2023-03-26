//
//  TableViewCell.swift
//  apicalling
//
//  Created by R83 on 16/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var lb2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
