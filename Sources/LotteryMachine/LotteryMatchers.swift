///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2021/8/14.
///

public class LotteryMatchers {
    private static let machine = LotteryMachine()

    public static func match539Results(term: String? = nil, myNumbers: String) {
        print("")
        let result = machine.get539Answers()

        if let inputTerm = term, "第 \(inputTerm) 期" != result.0 {
            print("非本期號碼 (第 \(inputTerm) 期 != \(result.0))")
            return
        }

        let fiveThreeNine = FiveThreeNine(answer: result.1, mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(fiveThreeNine.results) ////////////////////")
    }

    public static func matchLotteryResults(term: String? = nil, myNumbers: String) {
        print("")
        let result = machine.getLotteryAnswers()

        if let inputTerm = term, "第 \(inputTerm) 期" != result.0 {
            print("非本期號碼 (第 \(inputTerm) 期 != \(result.0))")
            return
        }

        let lottery = BigLottery(answer: result.1, spAnswer: Int(result.2)!, mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(lottery.result) ////////////////////")
    }

    public static func matchPowerResults(term: String? = nil, myNumbers: String, myArea: String) {
        print("")
        let result = machine.getPowerAnswers()

        if let inputTerm = term, "第 \(inputTerm) 期" != result.0 {
            print("非本期號碼 (第 \(inputTerm) 期 != \(result.0))")
            return
        }

        let power = PowerLottery(answer: result.1, spAnswer: Int(result.2)!, mine: myNumbers, spMine: Int(myArea)!)
        print("你的第一區：\(myNumbers.toIntArray())")
        print("你的第二區：\(myArea)")
        print("//////////////////// \(power.result) ///////////////////")
    }

    public static func manual539Results(answers: String, myNumbers: String) {
        print("")
        print("手動539對獎結果")
        let fiveThreeNine = FiveThreeNine(answer: answers, mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(fiveThreeNine.results) ////////////////////")
    }

    public static func manualLotteryResults(answers: String, special: String, myNumbers: String) {
        print("")
        print("手動大樂透對獎結果")
        let lottery = BigLottery(answer: answers, spAnswer: Int(special)!, mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(lottery.result) ////////////////////")
    }

    public static func manualPowerResults(answers: String, area: String, myNumbers: String, myArea: String) {
        print("")
        print("手動威力彩對獎結果")
        let power = PowerLottery(answer: answers, spAnswer: Int(area)!, mine: myNumbers, spMine: Int(myArea)!)
        print("你的第一區：\(myNumbers.toIntArray())")
        print("你的第二區：\(myArea)")
        print("//////////////////// \(power.result) ///////////////////")
    }

}
