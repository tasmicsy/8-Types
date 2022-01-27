//
//  AnswerQuizViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import UIKit
import FirebaseFirestore
import CoreData
import GoogleMobileAds

class AnswerQuizViewController: UIViewController, UITableViewDelegate, GADFullScreenContentDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var q: QuestionSeries!
    
    @IBOutlet weak var quizTableView: UITableView!
    
    private var interstitial: GADInterstitialAd?

    
    override func viewDidLoad() {
        //Answers.aArray = Array(repeating: 0, count: q.question.count)
        super.viewDidLoad()

       quizTableView.dataSource = self
        quizTableView.delegate = self
        
        // Google ads
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                    request: request,
                          completionHandler: { [self] ad, error in
                            if let error = error {
                              print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                              return
                            }
                            interstitial = ad
                            interstitial?.fullScreenContentDelegate = self
                          }
        )
        
        // cell xibファイルを使うときは書く必要があるやつ。
//        quizTableView.register(UINib(nibName: K.Cells.QuizCellNibName, bundle: nil), forCellReuseIdentifier: K.Cells.QuizCellIdentifier)
        quizTableView.register(UINib(nibName: "QuizCell", bundle: nil), forCellReuseIdentifier: "QuizCellIdentifier")
    
        // Do any additional setup after loading the view.
        navigationItem.title = q.title
        
        let leftButton = UIBarButtonItem(title: "トップに戻る", style: UIBarButtonItem.Style.plain, target: self, action: #selector(barButtonTapped(_:)))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem){
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func checkResultButtonTapped(_ sender: UIButton) {
        var questionNumber = 0

        // 全部回答したか確認
        for i in q.question {
            questionNumber += 1
            //print(i.answer)
            if i.answer == nil {
                let alert: UIAlertController = UIAlertController(title: "未回答あり", message: "Q\(questionNumber)が未回答です。", preferredStyle: UIAlertController.Style.alert)
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                    // ボタンが押された時の処理を書く（クロージャ実装）
                    (action: UIAlertAction!) -> Void in
                    //print("OK")
                 
                })
                alert.addAction(defaultAction)
                present(alert, animated: true, completion: nil)
                return
                
            }
        }
        //Google ads
        if interstitial != nil {
            interstitial!.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }
        // answer全部回答されていればページ遷移
        if q.title == "統合レポート" {
            performSegue(withIdentifier: "CheckResultSegueIntegrated", sender: sender)
        } else{
            performSegue(withIdentifier: "CheckResultSegue", sender: sender)
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
      
        if segue.identifier == K.Segue.checkResult {
            let resultViewController = segue.destination as! ResultMainViewController
            
            QuizBrain.CalculateScoresOfOneQuestionSeries(q)
            resultViewController.maintitle = q.title
            resultViewController.nextTitle = q.nextTitle
            // Firebaseに保存
            
            let collection = Firestore.firestore().collection("answers")
            
            let answersToFirebase = ["title": q.title, "q01": q.question[0].answer!, "q02": q.question[1].answer!, "q03": q.question[2].answer!, "q04": q.question[3].answer!, "q05": q.question[4].answer!, "q06": q.question[5].answer!, "q07": q.question[6].answer!, "q08": q.question[7].answer!, "q09": q.question[8].answer!, "q10": q.question[9].answer!, "q11": q.question[10].answer!, "q12": q.question[11].answer!] as [String : Any]
            
            collection.addDocument(data: answersToFirebase)
            
            //coredataに保存
            let history = History(context: context)
            history.title = q.title
            history.date = Date()
            history.percentage = Int64(parcentageInt+50)
            saveHistory()
            

    }
    

}
    func saveHistory(){
        do {
           try context.save()
        }catch{
            print("Error saving context\(error)")
        }
}
    
    // Google Ads
    /// Tells the delegate that the ad failed to present full screen content.
      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
      }

      /// Tells the delegate that the ad presented full screen content.
      func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
}

// MARK: - quizTableViewのアレンジ

extension AnswerQuizViewController: UITableViewDataSource, QuizCellDelegate {
    func quizCellDidChangeCurrentButtonIndex(_ cell: QuizCell, index: Int) {
        
        if let indexPath = self.quizTableView.indexPath(for: cell){

            self.q.question[indexPath.row].answer = index
           
            //print(self.q.question)
        }else{
            //print("ここきてます")
        }
    }


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return q.question.count
    //print(q.question.count)
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let question = q.question[indexPath.row]
    let cell = quizTableView.dequeueReusableCell(withIdentifier: K.Cells.QuizCellIdentifier, for: indexPath) as! QuizCell
//    cell.selectionStyle = .none
    cell.questionNumberLabel.text = "Q\(indexPath.row + 1)"
    cell.questionLabel.text = question.text
   // print(question.text)
    cell.delegate = self
    if let k = q.question[indexPath.row].answer  {
        for t in 0...4{
            if k == t{
                cell.answerButtons[k].setTitle("●", for: .normal)
              // print(cell.answerButtons[k].titleLabel?.text) //UIFont.systemFont(ofSize: 50)
            }else{
                cell.answerButtons[t].setTitle("○", for: .normal)
            }
            }
    }else{
        for t in 0...4{
        cell.answerButtons[t].setTitle("○", for: .normal)
        }
    }
    // ↑必要
//    for i in 0...4 {
//    cell.answerButtons[i].tag = indexPath.row
//    }

    return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

