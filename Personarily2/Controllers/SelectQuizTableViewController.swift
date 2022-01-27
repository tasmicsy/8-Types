//
//  SelectQuizTableViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import UIKit

class SelectQuizTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.Cells.SelectQuizCellNibname, bundle: nil), forCellReuseIdentifier: K.Cells.SelectQuizCellNibname)
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.Cells.SelectQuizCellNibname, for: indexPath) as! SelectQuizTableViewCell
        let title = questions[indexPath.row].title
        cell.seriesLabel.text = title
        
        // Configure the cell...
        if title == "統合レポート" {
            cell.seriesView.backgroundColor = .white
            cell.seriesLabel.textColor = K.teruColors[0]
            cell.seriesView.layer.borderWidth = 1.0
            cell.seriesView.layer.borderColor = K.teruColors[0].cgColor
            cell.explanationLabel.isHidden = true
            cell.descriptionLabel.isHidden = true
        } else {cell.explanationLabel.isHidden = false
            cell.descriptionLabel.isHidden = false
            cell.explanationLabel.text = questions[indexPath.row].description
    //        cell.seriesLabel.fon
            cell.seriesView.backgroundColor = K.teruColors[0]
            cell.descriptionLabel.text = questions[indexPath.row].detailDescription
            //cell.seriesView.backgroundColor = K.colors[indexPath.row]
            cell.seriesLabel.textColor = .white
        }


        


        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segue.ThemeToAnswerQuiz, sender: Any?.self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == K.Segue.ThemeToAnswerQuiz {
            let answerQuizViewController = segue.destination as! AnswerQuizViewController
            let index = tableView.indexPathForSelectedRow!.row
            answerQuizViewController.q = questions[index]
           // print(answerQuizViewController.q)
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
