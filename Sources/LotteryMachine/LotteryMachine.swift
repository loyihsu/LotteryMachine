///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2021/8/14.
///

import Foundation
import Crawler

class LotteryMachine {
    var tmpResults = [String]()

    init() {
        if let url = URL(string: "https://www.taiwanlottery.com.tw/result_all.htm"),
           let response = Crawler.getResponse(from: url),
           let elements = Crawler.extract(from: response, selector: "td") {
            for element in elements {
                if let text = try? element.text() {
                    tmpResults.append(text)
                }
            }
        }

        //for (idx, val) in tmpResults.enumerated() {
        //    print("\(idx) : \(val)")
        //}
    }

    func getPowerAnswers() -> (String, String) {
        let name = tmpResults[1], date = tmpResults[5], term = tmpResults[3]
        var tempAnswer = [tmpResults[9]]
        tempAnswer = tempAnswer[0]
            .components(separatedBy: "第1區 依大小順序排列：").joined()
            .components(separatedBy: " 第1區 依開出順序排列").first!
            .components(separatedBy: "第2區： ")
        print("\(name) (\(term): \(date))")
        print("第一區：\(tempAnswer[0].toIntArray())")
        print("第二區：\(tempAnswer[1])")
        return (tempAnswer[0], tempAnswer[1])
    }

    func getLotteryAnswers() -> (String, String) {
        let name = tmpResults[86], term = tmpResults[88], date = tmpResults[90]
        var tempAnswer = [tmpResults[94]]
        tempAnswer = tempAnswer[0]
            .components(separatedBy: "依大小順序排列：").joined()
            .components(separatedBy: " 依開出順序排列：").first!
            .components(separatedBy: "特別號： ")
        print("\(name) (\(term): \(date))")
        print("獎號：\(tempAnswer[0].toIntArray())")
        print("特別號：\(tempAnswer[1])")
        return (tempAnswer[0], tempAnswer[1])
    }

    func get539Answers() -> String {
        let name = tmpResults[159], term = tmpResults[161], date = tmpResults[163]
        var tempAnswer = [tmpResults[167]]
        tempAnswer = [tempAnswer[0].components(separatedBy: "依大小順序排列： ").joined()
            .components(separatedBy: "   依開出順序排列： ").first!]
        print("\(name) (\(term): \(date))")
        print("獎號：\(tempAnswer[0].toIntArray())")
        return tempAnswer[0]
    }
}
