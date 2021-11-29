//
//  Question.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import Foundation

struct QuestionSeries {
    var title: String
    var question: [Question]
}

struct Question{
    var text: String
    var answer: Int?
    init(t: String){
        text = t
    }
}

let q1 = [Question(t: "自分一人の時間が大切だと思う。"),
          Question(t: "きついことにも立ち向かって諦めない。"),
          Question(t: "習慣に従って安定を維持することを好む。"),
          Question(t: "宿題や課題はまとめて一気にやるタイプである。"),
          Question(t: "意見をはっきり述べ、グループを先導することに満足を覚える。")
]

let questions = [QuestionSeries(title: "この前やったやつ", question: q1),
                 QuestionSeries(title: "質問シリーズ②", question: q1),
                 QuestionSeries(title: "質問シリーズ③", question: q1),
                 QuestionSeries(title: "質問シリーズ④", question: q1)]
