///
/// # LotteryMachine
///
/// Created by Loyi Hsu on 2021/8/14.
///

import Foundation

extension String {
    public func toIntArray() -> [Int] {
        var cur = "", output = [String]()
        var temp = self.contains(" ") ? self.components(separatedBy: .whitespaces).joined() : self
        temp = temp.contains("\n") ? temp.components(separatedBy: .newlines).joined() : temp
        while temp.isEmpty == false {
            cur.append(temp.removeFirst())
            if cur.count == 2 {
                output.append(cur)
                cur = ""
            }
        }
        return output.map { Int($0)! }
    }
}
