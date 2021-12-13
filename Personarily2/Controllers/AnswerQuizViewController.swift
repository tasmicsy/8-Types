//
//  AnswerQuizViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import UIKit

class AnswerQuizViewController: UIViewController, UITableViewDelegate {

    
    var q: QuestionSeries!
    
    @IBOutlet weak var quizTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        //Answers.aArray = Array(repeating: 0, count: q.question.count)
        super.viewDidLoad()
       quizTableView.dataSource = self
        quizTableView.delegate = self
        
        // cell xibファイルを使うときは書く必要があるやつ。
//        quizTableView.register(UINib(nibName: K.Cells.QuizCellNibName, bundle: nil), forCellReuseIdentifier: K.Cells.QuizCellIdentifier)
        quizTableView.register(UINib(nibName: "QuizCell", bundle: nil), forCellReuseIdentifier: "QuizCellIdentifier")
    
        // Do any additional setup after loading the view.
    }
    

    @IBAction func checkResultButtonTapped(_ sender: UIButton) {
        var questionNumber = 0

        
        // 全部回答したか確認
        for i in q.question {
            questionNumber += 1
            if i.answer == nil {
                let alert: UIAlertController = UIAlertController(title: "未回答あり", message: "Q\(questionNumber)が未回答です。", preferredStyle: UIAlertController.Style.alert)
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                    // ボタンが押された時の処理を書く（クロージャ実装）
                    (action: UIAlertAction!) -> Void in
                    print("OK")
                    return
                })
                alert.addAction(defaultAction)
                present(alert, animated: true, completion: nil)

                
            }
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
            resultViewController.q = q
    }
    

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
