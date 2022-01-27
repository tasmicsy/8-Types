//
//  ResultViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/29.
//
//　未使用
import UIKit
//import Charts

class ResultViewController: UIViewController, UITableViewDelegate {
    

    var q: QuestionSeries!
    var qTotal: Int = 0
    
    @IBOutlet weak var characterTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.dataSource = self
      
        navigationItem.hidesBackButton = true
        
        characterTableView.register(UINib(nibName: K.Cells.characterCellNibname, bundle: nil),  forCellReuseIdentifier: K.Cells.characterCellIdentifier)
        for i in 0...q.question.count-1{
            
            if let answer = q.question[i].answer {
            qTotal += answer
            print(qTotal)
            } else {
                print("number is wrong")
            }
        }
       QuizBrain.CalculateCharacters(q)
       // writeData()
        print(answer1)
        
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
//    func writeData(){
//        let entries = answer1.enumerated().map {
//            BarChartDataEntry(x: Double($0.offset), y: Double($0.element))
//        }
//        let dataSet = BarChartDataSet(entries: entries)
//        let data = BarChartData(dataSet: dataSet)
//        barChartView.data = data
//    }

}

extension ResultViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: K.Cells.characterCellIdentifier, for: indexPath) as! ResultTableViewCell
        cell.characterLabel.text = answerLabel1[indexPath.row]
        let floatTotal = (Float(answer1[indexPath.row]) + 50) / 100
        cell.progressBar.progress = floatTotal

        print("\(floatTotal)")
        return cell
    }

    
    
}
