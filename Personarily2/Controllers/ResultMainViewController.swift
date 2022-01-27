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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var maintitle: String!
    var nextTitle: String?
    var parcentageIntInt = 0

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        yourCharLabel.text = "あなたの\( maintitle!)は..."
        parcentageIntInt = Int(parcentageInt+50)
        charParcentageLabel.text = "\( maintitle!)　\(parcentageIntInt)%"
        
        //ボタンタイトル変更、次のシリーズない場合はボタンを隠す。
        if let buttonTitle = nextTitle{
            nextButton.isHidden = false
            nextButton.setTitle("\(buttonTitle)を診断する", for: .normal)
        }else{
            
            nextButton.isHidden = true
            proceedToNextSeriesLabel.textColor = .white
        }
        
        // 前に戻るボタン隠す
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    
        //CoreDataに保存する

        
        
    
    

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "nextQuestionSegue" {
            let quizViewController = segue.destination as! AnswerQuizViewController
            for qSeries in questions{
                if qSeries.title == nextTitle{
            quizViewController.q = qSeries
                    return
                }
    }
    }
    
    }
}
