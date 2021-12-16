//
//  SelectHistoryTableViewCell.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/12/16.
//

import UIKit

class SelectHistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var characterLabel: UILabel!
    
    @IBOutlet weak var parcentageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
