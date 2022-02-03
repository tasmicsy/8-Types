//
//  InfoViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2022/02/03.
//

import UIKit
import MessageUI

class InfoViewController: UIViewController, MFMailComposeViewControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func psyHPTapped(_ sender: Any) {
        let url = URL(string: "https://tell-personality.com/")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        
    }
    
    @IBAction func iosHPTapped(_ sender: Any) {
        let url = URL(string: "https://www.mechengjp.com/")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    
    @IBAction func mailTapped(_ sender: Any) {
        composeMail()
    }
    
    func composeMail(){
        //メール送信が可能なら
        if MFMailComposeViewController.canSendMail() {
            //MFMailComposeVCのインスタンス
            let mail = MFMailComposeViewController()
            //MFMailComposeのデリゲート
            mail.mailComposeDelegate = self
            //送り先
            mail.setToRecipients(["teru.lerc@gmail.com"])
            //Cc
            //mail.setCcRecipients(["mike@gmail.com"])
            //Bcc
            //mail.setBccRecipients(["amy@gmail.com"])
            //件名
            mail.setSubject("")
            //メッセージ本文
            mail.setMessageBody("", isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
        //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "メールアプリ起動不可", message: "有効なメールアプリでteru.lerc@gmail.comにご連絡ください。", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

               controller.dismiss(animated: true, completion: nil)
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
