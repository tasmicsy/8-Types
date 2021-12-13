//
//  ResultMainViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/12/13.
//

import UIKit

class ResultMainViewController: UIViewController {
    
    
    @IBOutlet weak var yourCharLabel: UILabel!
    @IBOutlet weak var charParcentageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionSecondLabel: UILabel!
    
    var q: QuestionSeries!
    var parcentageIntInt = 0

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        QuizBrain.CalculateScoresOfOneQuestionSeries(q)
        yourCharLabel.text = "あなたの\(q.title)は..."
        parcentageIntInt = Int(parcentageInt+50)
        charParcentageLabel.text = "\(q.title)　\(parcentageIntInt)%"
        
        
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
