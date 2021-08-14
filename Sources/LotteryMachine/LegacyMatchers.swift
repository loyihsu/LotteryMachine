///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2021/8/14.
///

import Foundation

struct BigLottery {
    var spAnswer: Int
    var answer: [Int]
    var mine: [Int]

    init (answer: String, spAnswer: Int, mine: String) {
        self.answer = answer.toIntArray()
        self.mine = mine.toIntArray()
        self.spAnswer = spAnswer
    }

    var result: String {
        var output = "對獎失敗"
        if answer.count == mine.count {
            let filtered = mine.filter { answer.contains($0) }
            if mine.contains(spAnswer) {
                switch filtered.count {
                case 5: output = "貳獎"
                case 4: output = "肆獎"
                case 3: output = "陸獎 NT$1,000"
                case 2: output = "柒獎 NT$400"
                default: output = "未中獎"
                }
            } else {
                switch filtered.count {
                case 6: output = "頭獎"
                case 5: output = "參獎"
                case 4: output = "伍獎 NT2,000"
                case 3: output = "普獎 NT$400"
                default: output = "未中獎"
                }
            }
        }

        return output
    }
}

struct PowerLottery {
    var _answer: String
    var spAnswer: Int
    var _mine: String
    var spMine: Int

    init (answer: String, spAnswer: Int, mine: String, spMine: Int) {
        self._answer = answer
        self.spAnswer = spAnswer
        self._mine = mine
        self.spMine = spMine
    }

    var answer: [Int] { self._answer.toIntArray() }
    var mine: [Int] { self._mine.toIntArray() }

    var result: String {
        var output = "對獎失敗"
        if mine.count == answer.count {
            let filtered = mine.filter { answer.contains($0) }
            if spAnswer == spMine {
                switch filtered.count {
                case 6: output = "頭獎"
                case 5: output = "參獎 NT$150,000"
                case 4: output = "伍獎 NT$4,000"
                case 3: output = "柒獎 NT$400"
                case 2: output = "捌獎 NT$200"
                case 1: output = "普獎 NT$100"
                default: output = "未中獎"
                }
            } else {
                switch filtered.count {
                case 6: output = "貳獎"
                case 5: output = "肆獎 NT20,000"
                case 4: output = "陸獎 NT$800"
                case 3: output = "玖獎 NT$100"
                default: output = "未中獎"
                }
            }
        }
        return output
    }
}

struct FiveThreeNine {
    var answer: [Int]
    var mine: [Int]

    init (answer: String, mine: String) {
        self.answer = answer.toIntArray()
        self.mine = mine.toIntArray()
    }

    var results: String {
        var output = "對獎失敗"
        if answer.count == mine.count {
            let filtered = mine.filter { answer.contains($0) }
            switch filtered.count {
                case 5: output = "頭獎 NT$8,000,000"
                case 4: output = "貳獎 NT$20,000"
                case 3: output = "參獎 NT$300"
                case 2: output = "肆獎 NT$50"
                default: output = "未中獎"
            }
        }
        return output
    }
}
