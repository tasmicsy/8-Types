//
//  QuizCell.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import UIKit
import Foundation

protocol QuizCellDelegate {
    func quizCellDidChangeCurrentButtonIndex(_ cell: QuizCell, index: Int)
}

class QuizCell: UITableViewCell {
    var currentQuizButtonIndex: Int = 0 {
        didSet {
            let value = self.currentQuizButtonIndex
            self.updateCurrentQuizButton(value)
            if let delegate = self.delegate {
                delegate.quizCellDidChangeCurrentButtonIndex(self, index: value)
            }
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    var delegate: QuizCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ここまできてるか確認")
        // Initialization code
    }
    
    @IBAction func didTapQuizButton(_ sender: UIButton) {
        if let index = self.answerButtons.firstIndex(of: sender){
            self.currentQuizButtonIndex = index
        }
    }
    
    private func updateCurrentQuizButton(_ currentIndex: Int){
        for (index, answerButton) in self.answerButtons.enumerated(){
            if index == currentIndex {
                answerButton.setTitle("●", for: .normal)
            } else {
                answerButton.setTitle("○", for: .normal)
                
            }
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
