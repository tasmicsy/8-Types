//
//  PrivacyPolicyViewController.swift
//  Personarily2
//
//  Created by Sae Obata on 2022/02/03.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    @IBOutlet weak var privacyPolicyText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        privacyPolicyText.text = """
本アプリが提供するプライバシーポリシーについて

・個人情報の収集
本アプリは、広告配信のためにGoogle AdMob、利用状況解析のためにGoogle Firebaseを使用しています。
・広告について
本アプリでは、広告配信を目的として以下の広告配信事業者がご利用者の情報を自動取得する場合がございます。取得する情報、利用目的、第三者への提供等につきましては、以下の広告配信事業者のアプリケーション・プライバシーポリシーのリンクよりご確認ください。

AdMob（Google Inc.）
http://www.google.com/intl/ja/policies/technologies/ads/

・利用状況解析ついて
本アプリでは、今後の開発の参考とするため、アプリの利用状況データを収集するツールとしてFirebase(Google Inc.)を使用しており、Firebaseがご利用者の情報を自動取得する場合がございます。取得する情報、利用目的、第三者への提供等につきましては、以下のGoogleプライバシーポリシーのリンクよりご確認ください。

Google プライバシーポリシー
https://policies.google.com/privacy?hl=ja
"""
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
