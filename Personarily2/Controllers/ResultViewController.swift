//
//  ResultViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/29.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    var q: QuestionSeries!
    var qTotal: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        for i in 0...q.question.count-1{
            
            if let answer = q.question[i].answer {
            qTotal += answer
            print(qTotal)
            } else {
                print("number is wrong")
            }
        }
        QuizBrain.CalculateCharacters(q)
        print(answer1)
        valueLabel.text = String(qTotal)
        //↓tagを使ったやつ
        //valueLabel.text = String(Answers.aArray.reduce(0,+))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
