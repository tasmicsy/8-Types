//
//  SelectQuizTableViewCell.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/29.
//

import UIKit

class SelectQuizTableViewCell: UITableViewCell {

    @IBOutlet weak var seriesLabel: UILabel!
    
    @IBOutlet weak var seriesView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seriesView.layer.cornerRadius = seriesView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
