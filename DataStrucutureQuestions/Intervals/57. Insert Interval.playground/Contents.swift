import UIKit

//https://leetcode.com/problems/insert-interval/

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    let newStart = newInterval[0]
    let newEnd = newInterval[1]
    var i = 0
    
    while i < intervals.count && intervals[i][0] < newStart {
        result.append(intervals[i])
        i += 1
    }
    
    if result.isEmpty || result.last![1] < newStart {
        result.append(newInterval)
    } else {
        result[result.count - 1][1] = max(result[result.count - 1][1], newEnd)
    }
    
    while i < intervals.count {
        let interval = intervals[i]
        let start = interval[0]
        let end = interval[1]
        
        if result.last![1] < start {
            result.append(interval)
        } else {
            result[result.count - 1][1] = max(end, result[result.count - 1][1])
        }
        i += 1
    }
    
    return result
}

print(insert([[1,3],[6,9]], [2,5]))
