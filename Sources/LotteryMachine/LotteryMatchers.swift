///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2021/8/14.
///

public class LotteryMatchers {
    private static let machine = LotteryMachine()

    public static func match539Results(myNumbers: String) {
        print("")
        let fiveThreeNine = FiveThreeNine(answer: machine.get539Answers(), mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(fiveThreeNine.results) ////////////////////")
    }

    public static func matchLotteryResults(myNumbers: String) {
        print("")
        let lotteryAnswer = machine.getLotteryAnswers()
        let lottery = BigLottery(answer: lotteryAnswer.0, spAnswer: Int(lotteryAnswer.1)!, mine: myNumbers)
        print("你的號碼：\(myNumbers.toIntArray())")
        print("//////////////////// \(lottery.result) ////////////////////")
    }

    public static func matchPowerResults(myNumbers: String, myArea: String) {
        print("")
        let powerAnswer = machine.getPowerAnswers()
        let power = PowerLottery(answer: powerAnswer.0, spAnswer: Int(powerAnswer.1)!, mine: myNumbers, spMine: Int(myArea)!)
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
