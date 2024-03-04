import UIKit

//https://leetcode.com/problems/exclusive-time-of-functions/description/
struct Log {
    var id : Int
    var time : Int
    var  is_start : Bool
}
func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
    var logsStacks : [Log] = []
    var result = Array(repeating: 0, count: n)
    for logObj in logs {
        let log = parseLog(string: logObj)
        if log.is_start {
            logsStacks.append(log)
        } else {
            let top = logsStacks.popLast()!
            result[top.id] += (log.time - top.time) + 1
            if let lastLog = logsStacks.last {
                result[lastLog.id] -= (log.time - top.time) + 1
            }
        }
    }
    return result
}
func parseLog(string : String) -> Log {
    let parts = string.split(separator: ":")
    let id = Int(parts.first!)!
    let time = Int(parts.last!)!
    let is_start = parts[1] == "start"
    return Log(id: id, time: time, is_start: is_start)
}
print(exclusiveTime(2, ["0:start:0","1:start:2","1:end:5","0:end:6"]))
