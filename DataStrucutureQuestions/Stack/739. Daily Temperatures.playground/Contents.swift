import UIKit

//https://leetcode.com/problems/daily-temperatures/description/
func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var answers = Array(repeating : 0, count : temperatures.count)
    var stackData = [(Int, Int)]()

    for prevDayIndex in 0..<temperatures.count {
        while !stackData.isEmpty && stackData.last?.1 ?? 0 < temperatures[prevDayIndex] {
            let lastDayData = stackData.popLast()
            answers[lastDayData?.0 ?? 0] = prevDayIndex - (lastDayData?.0  ?? 0)
        }
        stackData.append((prevDayIndex, temperatures[prevDayIndex]))
    }

    return answers
}

print(dailyTemperatures([73,74,75,71,69,72,76,73]))
