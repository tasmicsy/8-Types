//
//  ResultTableViewCell.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/12/07.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lowCharacterLabel: UILabel!
    @IBOutlet weak var lowPercentage: UILabel!
    @IBOutlet weak var highCharacterLabel: UILabel!
    @IBOutlet weak var highPercentage: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
