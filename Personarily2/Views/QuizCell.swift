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
             //   print("didset内にいます")
            }
        }
    }
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    var delegate: QuizCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
//        for i in answerButtons{
//            answerButtons(i)?.foregroundColor = K.colors(i)
//        }
        
        //print("ここまできてるか確認")
        // Initialization code
    }
    
    @IBAction func didTapQuizButton(_ sender: UIButton) {
        if let index = self.answerButtons.firstIndex(of: sender){
            self.currentQuizButtonIndex = index
            delegate?.quizCellDidChangeCurrentButtonIndex(self, index: index)
           // print("didTapQuizButton")
            //Answers.aArray[sender.tag] = index
            //print(Answers.aArray)
        }
    }
    
    private func updateCurrentQuizButton(_ currentIndex: Int){
        for (index, answerButton) in self.answerButtons.enumerated(){
            if index == currentIndex {
               // answerButton.title = "●"
                answerButton.setTitle("●", for: .normal)
                answerButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
//                self.addSubview(answerButton)
                
//                answerButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(K.fontSizes[index]))
                //print(answerButton.titleLabel?.text)

            } else {
                answerButton.setTitle("○", for: .normal)
//                answerButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(K.fontSizes[index]))

            }
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
