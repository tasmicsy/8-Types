//
//  Constants.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//
import UIKit

struct K {
    struct Segue {
        static let selectTheme = "SelectThemeSegue"
        static let history = "HistorySegue"
        static let ThemeToAnswerQuiz = "QuizSegue"
        static let checkResult = "CheckResultSegue"
    }
    struct Cells {
        static let QuizCellNibName = "QuizCell"
        static let QuizCellIdentifier = "QuizCellIdentifier"
        static let HistoryCellIdentifier = "HistoryCell"
        static let SelectQuizCellIdentifier = "SelectQuizCell"
        static let SelectQuizCellNibname = "SelectQuizTableViewCell"
    }
    static let colors = [UIColor(red: 0.33, green: 0.94, blue: 0.77, alpha: 1.00),
                         UIColor(red: 0.51, green: 0.93, blue: 0.93, alpha: 1.00),
                         UIColor(red: 0.45, green: 0.73, blue: 1.00, alpha: 1.00),
                         UIColor(red: 0.64, green: 0.61, blue: 1.00, alpha: 1.00),
                         UIColor(red: 0.87, green: 0.90, blue: 0.91, alpha: 1.00)
]
    static let fontSizes = [14, 18, 22, 26, 30]
}
