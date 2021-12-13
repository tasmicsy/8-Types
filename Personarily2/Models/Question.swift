//
//  Question.swift
//  Personarily2
//
//  Created by Sae Obata on 2021/11/26.
//

import Foundation

struct QuestionSeries {
    var title: String
    var description: String
    var question: [Question]
}

struct Question{
    var text: String
    var character: Int //外向性: 1, 現実性: 2, 論理性: 3, 計画性: 4, 開放性: 5, 誠実性: 6, 協調性: 7
    var order: Bool //順: true, 逆: false
    var answer: Int?

    //static var answer: Int?
    init(t: String, c: Int, o:Bool){
        text = t
        character = c
        order = o
    }
}

var answer1 = [2,4,5,-2,1,2,3,4] //zerosに戻してね
var parcentageInt: Float =  0.0
var answerLabel1 = ["外向性", "現実性", "論理性", "計画性", "解放性", "誠実性", "協調性", "神経性"]
// MARK: - 使わなかった
//struct Answers{
//    static var aArray: [Int] = []
//}
// MARK: - questions
let q1 = [
    //Question(t: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890", c: 1, o: false),
    Question(t: "自分一人の時間が大切だと思う。", c: 1, o: false),
          Question(t: "きついことにも立ち向かって諦めない。", c: 6, o: true),
          Question(t: "習慣に従って安定を維持することを好む。", c: 5, o: false),
          Question(t: "宿題や課題はまとめて一気にやるタイプである。", c: 4, o: false),
          Question(t: "意見をはっきり述べ、グループを先導することに満足を覚える。", c: 1, o: false),
          //6~10
          Question(t: "今の自分には比較的満足している。", c: 7, o: false),
                    Question(t: "自分の所持品をどこに置いたのかわからなくなることがある", c: 4, o: false),
                    Question(t: "夢を追いかけるよりも日々の生活の方が大事だ。", c: 2, o: true),
                    Question(t: "注目されると落ち着かない。", c: 7, o: true),
                    Question(t: "興味深くても非現実的なアイデアは受け入れられない。", c: 2, o: true),
          //11~15
          Question(t: "人を助けることで充実感を味わうことができる。", c: 7, o: true),
                    Question(t: "長期間、難しいと感じることを続けられない。", c: 6, o: false),
                    Question(t: "好奇心旺盛で様々なことに興味を持つ方だ。", c: 2, o: false),
                    Question(t: "毎日のルーチンを大切にしている。", c: 5, o: false),
                    Question(t: "特にグループの中では、話すより聞くほうが好き。", c: 1, o: false),
          //16~20
          Question(t: "人の悪意を警戒し、簡単には信用しない。", c: 7, o: false),
                    Question(t: "学校では勉強よりも友達作りが大事だ。", c: 3, o: false),
                    Question(t: "1つのことに集中できず、つい他の事もやってしまう。", c: 4, o: false),
                    Question(t: "自分の達成したレベルに満足しており、野心的な目標を設定する必要を感じない。", c: 6, o: false),
                    Question(t: "想像よりも事実を優先する。", c: 5, o: false),
          //21~25
          Question(t: "人が自分をどう思うかに敏感である。", c: 8, o: true),
                    Question(t: "学校や仕事の準備は当日にしてしまう。", c: 4, o: false),
                    Question(t: "やりたいことをやるために規則や義務は無視することがある。", c: 6, o: false),
                    Question(t: "悩んでいる人には寄り添うよりも解決策を提案する方だ。", c: 3, o: true),
                    Question(t: "想像力は豊かなほうだ。", c: 5, o: true),
          //26~30
          Question(t: "自分の感情を自覚していて、感情の表し方を知っている。", c: 5, o: true),
                    Question(t: "その場で決断するのが苦手である。", c: 4, o: true),
                    Question(t: "株、宝くじ、競馬など元金が保証されないものは絶対にしない。", c: 2, o: true),
                    Question(t: "決断する前に注意深く考え抜く。", c: 6, o: true),
                    Question(t: "旅行に行くときは、しっかりと計画を立てる方である。", c: 4, o: true),
          //31~35
          Question(t: "空気を読まず自分の意見を言ってしまうことがある。", c: 3, o: true),
                    Question(t: "所属する組織のために多くの時間を費やそうと思わない。", c: 6, o: false),
                    Question(t: "新しい考えに対してオープンであり、興味を持ってもっと知りたいと思う。", c: 5, o: true),
                    Question(t: "穏やかで自信があるタイプだと思う。", c: 8, o: false),
                    Question(t: "ストレスの多い状況では非常に疲れる。", c: 8, o: true),
          // 36~40
          Question(t: "何かを始めるとき、行動する前に色々と考えてしまう。", c: 4, o: true),
                    Question(t: "おもしろくないことを頻繁に考え、悲観的になる。", c: 8, o: true),
                    Question(t: "直感より経験で判断することが多いと思う。", c: 2, o: true),
                    Question(t: "やると決めたことは成功できると感じる。", c: 6, o: true),
                    Question(t: "困惑することはほとんどなく、大抵の場合は自信にあふれている。", c: 8, o: false),
          // 41~45
          Question(t: "自分の考えを押し通すより妥協する方が多い。", c: 3, o: false),
                    Question(t: "何事も他人に頼らず自分自身で実行するべきだと考える。", c: 7, o: false),
                    Question(t: "必ずしもみんなの意見を尊重する必要はない。", c: 3, o:true ),
                    Question(t: "可能な限り対立を避けようとする。", c: 7, o: true),
                    Question(t: "話し合いは意見をぶつけ合うより平穏に進めたいと思う。", c: 3, o: false),
          // 46~50
          Question(t: "決断に慎重で時間を費やすより、すぐに実行することに価値を感じる。", c: 6, o: false),
                    Question(t: "生活の中で組織の必要性を強く感じる。", c: 6, o: true),
                    Question(t: "自分に高い目標を設定し、その達成のために真剣に取り組むことができる。", c: 6, o: true),
                    Question(t: "欲望に誘惑されやすい。", c: 8, o: true),
                    Question(t: "いつも真面目で、冗談をあまり言わない。", c: 1, o: false),
        
          // 51~55
          Question(t: "ゆったりしたペースの生活が好き。", c: 1, o: false),
                    Question(t: "人と一緒にいることを楽しむことができる。", c: 1, o: true),
                    Question(t: "周囲と同じ状況であると安心する。", c: 2, o: true),
                    Question(t: "LINEやメールを返信せずにため込んでしまう。", c: 4, o: true),
                    Question(t: "他人の感情が分からないことがよくある。", c: 3, o: false),
          // 56~60
          Question(t: "自分の目標達成能力を疑うことが多い。", c: 6, o: false),
                    Question(t: "世界をそのまま捉えることを好み、抽象的な考えをすることはめったにない。", c: 5, o: false),
                    Question(t: "根拠のない自信が持っていることがある。", c: 2, o: false),
                    Question(t: "出世のために人を利用するのは正しくないと考える。", c: 7, o: true),
                    Question(t: "人の気持ちを考え、思いやりのある行動が出来る。", c: 7, o: true),
          // 61~65
          Question(t: "目的のためにはあらゆる手段を使う。", c: 7, o: false),
                    Question(t: "説明書を読む前にとりあえず触ってみる。", c: 4, o: false),
                    Question(t: "嫌いな人の言うことは内容に関係なく聞きたくない。", c: 3, o: false),
                    Question(t: "何の目的もなく外出することはない。", c: 4, o: true),
                    Question(t: "静かで、穏やかで、安全なことを好む。", c: 1, o: false),
          // 66~70
          Question(t: "優秀な人より仲の良い人と一緒に仕事がしたい", c: 3, o: false),
                    Question(t: "時間を忘れて何かについて考えこむことがよくある", c: 2, o: false),
                    Question(t: "芸術的活動や創作活動はあまり好きではない。", c: 5, o: false),
                    Question(t: "規則や義務が不都合であってもまじめに守る。", c: 6, o: true),
                    Question(t: "特に物事が思ったように進まないときに、激しく感情が高ぶる。", c: 8, o: true),
          // 71~75
          Question(t: "欲望は強くないし、欲望を制御できる性格である。", c: 8, o: false),
                    Question(t: "人の善意を信じ、信用することが出来る。", c: 7, o: true),
                    Question(t: "美しいものが好きで、創造的な体験を求める。", c: 5, o: true),
                    Question(t: "楽しさを人と分かち合うことが出来る。", c: 1, o: true),
                    Question(t: "自分の感情について考えたり、感情を表に出すことがほとんどない。", c: 5, o: false),
          // 76~80
          Question(t: "予期しないことにも落ち着いて対処できる。", c: 8, o: false),
                    Question(t: "自分が決めた通りに行動できないとイライラする", c: 4, o: true),
                    Question(t: "新しい経験を熱望している。", c: 5, o: true),
                    Question(t: "人のために時間を使うより、自分のために時間を使いたい。", c: 7, o: false),
                    Question(t: "あまり怒ることはない。", c: 8, o: false),
          // 81~85
          Question(t: "自分より能力が低い人を見るとイライラする。", c: 3, o: true),
                    Question(t: "服装は機能性より独創性を重視する。", c: 2, o: false),
                    Question(t: "根拠がなくても占いや噂話を信じる方だ。", c: 3, o: false),
                    Question(t: "面白い仕事より給料のいい仕事をしたいと思う。", c: 2, o: true),
                    Question(t: "自分に大体満足している。", c: 8, o: false),
          // 86~90
          Question(t: "伝統的な価値観に変化をもたらしたいと思っている。", c: 5, o: true),
                    Question(t: "人の発言に反論を唱えることに抵抗がない。", c: 7, o: false),
                    Question(t: "人と打ち解けるのが上手く、友達ができやすい。", c: 1, o: true),
                    Question(t: "同じことを続けるよりリスクがあっても新しいことに挑戦したいと思う。", c: 2, o: false),
                    Question(t: "リスクを負うことに興奮し、色々起こらないと退屈に感じる。", c: 1, o: true),
          // 91~96
          Question(t: "人と打ち解けることは難しいと思う。", c: 1, o: false),
                    Question(t: "起こるかもしれないことをいろいろ心配しがちである。", c: 8, o: true),
                    Question(t: "例え相手を傷つけることになったとしても真実を追求したい", c: 3, o: true),
                    Question(t: "哲学や芸術といった曖昧なものに興味がある。", c: 2, o: false),
                    Question(t: "スケジュールに予定が多く埋まっていて忙しい状態が好き。", c: 1, o: true),
          Question(t: "自分の部屋や職場の机は整理整頓されている。", c: 4, o: true),

          
]

// MARK: - Results



//let q2 = [Question(t: "2自分一人の時間が大切だと思う。", c: 1, o: false),
//          Question(t: "2きついことにも立ち向かって諦めない。", c: 1, o: false),
//          Question(t: "2習慣に従って安定を維持することを好む。", c: 1, o: false),
//          Question(t: "2宿題や課題はまとめて一気にやるタイプである。", c: 1, o: false),
//          Question(t: "2意見をはっきり述べ、グループを先導することに満足を覚える。", c: 1, o: false)
//]
// q1をtype別に分けた。
var quizWithTypes: [[Question]] {
    var q: [[Question]] = [[],[],[],[],[],[],[],[]]
    for i in 0...95{
        for k in 1...8{
            if q1[i].character == k{
                print("\(i)だよ")
                print("kは\(k)だよ")
                print("qは\(q)だよ")
                q[k-1].append(q1[i])
            }
        }
    }
    return q
  
}

let questions = [QuestionSeries(title: answerLabel1[0], description: "テスト1", question: quizWithTypes[0]),
                 QuestionSeries(title: answerLabel1[1], description: "テスト2",question: quizWithTypes[1]),
                 QuestionSeries(title: answerLabel1[2], description: "テスト3",question: quizWithTypes[2]),
                 QuestionSeries(title: answerLabel1[3], description: "テスト4",question: quizWithTypes[3]),
                 QuestionSeries(title: answerLabel1[4], description: "テスト5",question: quizWithTypes[4]),
                 QuestionSeries(title: answerLabel1[5], description: "テスト6",question: quizWithTypes[5]),
                 QuestionSeries(title: answerLabel1[6], description: "テスト7",question: quizWithTypes[6]),
                 QuestionSeries(title: answerLabel1[7], description: "テスト8",question: quizWithTypes[7]),
                QuestionSeries(title: "統合レポート", description: "", question: q1)]
