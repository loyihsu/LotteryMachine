import Foundation
import Crawler

public class LimitedSpecialLottery {
    var tmpResults = [String]()
    public init() {
        if let url = URL(string: "https://www.taiwanlottery.com.tw/lotto/AnnualGreatEvent/MoonFestival2021/MoonFestival_index_result110.aspx"),
           let response = Crawler.getResponse(from: url),
           let elements = Crawler.extract(from: response, selector: "td") {
            for element in elements {
                if let text = try? element.text() {
                    tmpResults.append(text)
                }
            }
        }

        // for (idx, val) in tmpResults.enumerated() {
        //     print("\(idx) : \(val)")
        // }
    }

    public func check(myNumbers: String) {
        let index = tmpResults.firstIndex(of: "大小順序")!
        let values = tmpResults[index+1...index+9].map({ Int($0)! })
        let numbers = myNumbers.toIntArray()

        print("大樂透加碼號碼：\(values)")

        let count = values.filter({ numbers.contains($0) }).count
        if count == 6 {
            print("//////////////////// 中獎了 ////////////////////")
        } else {
            print("/////// 一共中了 \(count) 個號碼，再接再厲！ ///////")
        }
    }
}
