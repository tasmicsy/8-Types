//
//  Quiz.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import Foundation
import UIKit

struct QuizBrain {
    static func CalculateScoresOfOneQuestionSeries(_ q: QuestionSeries){
  
        for oneQuestion in q.question{
            if let answer = oneQuestion.answer {
            if oneQuestion.order{
                parcentageInt +=  Float(answer - 2)
            }else{
                parcentageInt += Float(2 - answer)
            }
            }

        }
        parcentageInt = parcentageInt/24*50+50
        //print("\(parcentageInt)だよ")
        // 表示する文を書いてます
        switch parcentageInt {
        case 0..<20:
            labelForResult1 = """
あなたは非常に\(q.title)が低いです。
ここまでスコアが低い人は珍しく、\(q.title)があなたの性格に強く影響を与えていると言えます。
"""
            labelForResult2 = q.resultDescription[4]
        case 20..<40:
            labelForResult1 = """
あなたは\(q.title)が低いです。
\(q.title)は、あなたの性格を形作る大きな要素となっていると言えます。

"""
            labelForResult2 = q.resultDescription[3]
        case 40..<60:
            labelForResult1 = """
あなたは\(q.title)が平均レベルです。
\(q.title)はあなたにとって重要ではない項目であり、あなた自身意識していないことでしょう。

"""
            labelForResult2 = q.resultDescription[2]
        case 60..<80:
            labelForResult1 = """
あなたは\(q.title)が高いです。
\(q.title)は、あなたの性格を形作る大きな要素となっていると言えます。
"""
            labelForResult2 = q.resultDescription[1]
        case 80..<100:
            labelForResult1 = """
あなたは非常に\(q.title)が高いです。
ここまでスコアが高い人は珍しく、\(q.title)があなたの性格に強く影響を与えていると言えます。
"""
            labelForResult2 = q.resultDescription[0]
        default:
            //print(parcentageInt)
            break
            
        }
        
    }
    

    

    static func CalculateCharacters(_ q:QuestionSeries) {
        
        for oneQuestion in q.question {
            for k in 1 ..< 9 {
                if k == oneQuestion.character{
                    if let answer = oneQuestion.answer {
                    if oneQuestion.order{
                    answer1[k-1] += answer - 2
                    }else{
                        answer1[k-1] += 2 - answer
                    }
                    }
                }
                
            }
            
        }
    }
    
}
