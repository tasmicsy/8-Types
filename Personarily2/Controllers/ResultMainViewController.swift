//
//  ResultMainViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/12/13.
//

import UIKit
import FirebaseFirestore

class ResultMainViewController: UIViewController {
    
    
    @IBOutlet weak var yourCharLabel: UILabel!
    @IBOutlet weak var charParcentageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionSecondLabel: UILabel!
    
    @IBOutlet weak var proceedToNextSeriesLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var q: QuestionSeries!
    var parcentageIntInt = 0

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        QuizBrain.CalculateScoresOfOneQuestionSeries(q)
        
        let collection = Firestore.firestore().collection("answers")
        
        let answersToFirebase = ["title": q.title, "q01": q.question[0].answer!, "q02": q.question[1].answer!, "q03": q.question[2].answer!, "q04": q.question[3].answer!, "q05": q.question[4].answer!, "q06": q.question[5].answer!, "q07": q.question[6].answer!, "q08": q.question[7].answer!, "q09": q.question[8].answer!, "q10": q.question[9].answer!, "q11": q.question[10].answer!, "q12": q.question[11].answer!] as [String : Any]
        
        collection.addDocument(data: answersToFirebase)
        
        yourCharLabel.text = "あなたの\(q.title)は..."
        parcentageIntInt = Int(parcentageInt+50)
        charParcentageLabel.text = "\(q.title)　\(parcentageIntInt)%"
        
        //ボタンタイトル変更、次のシリーズない場合はボタンを隠す。
        if let buttonTitle = q.nextTitle{
            nextButton.isHidden = false
            nextButton.setTitle("\(buttonTitle)を診断する", for: .normal)
        }else{
            
            nextButton.isHidden = true
            proceedToNextSeriesLabel.textColor = .white
        }
        
        // 前に戻るボタン隠す
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "nextQuestionSegue" {
            let quizViewController = segue.destination as! AnswerQuizViewController
            for qSeries in questions{
                if qSeries.title == q.nextTitle{
            quizViewController.q = qSeries
                    return
                }
    }
    }
    
    }
}
