///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2022/1/10.
///

import Foundation

public func generateTerm(year: Int = 2022, number: Int) -> String {
    let year = year - 1911 > 0 ? "\(year - 1911)" : "\(year)"
    var number = "\(number)"
    number = "\(String(repeating: "0", count: 6 - number.count))\(number)"
    return "\(year)\(number)"
}
