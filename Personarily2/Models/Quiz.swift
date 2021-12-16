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
        parcentageInt = parcentageInt/24*50
        
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
