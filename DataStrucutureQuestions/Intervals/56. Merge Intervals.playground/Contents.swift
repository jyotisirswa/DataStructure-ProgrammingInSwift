import UIKit

//https://leetcode.com/problems/merge-intervals/
// - Complexity:
 //   - time: O(n log(n)), where n is the number of intervals.
 //   - space: O(n), where n is the number of intervals.
func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.isEmpty {
        return []
    }
    var result = [[Int]]()
    result.append(intervals[0])
    for index in 1..<intervals.count {
        var curStart = intervals[index][0]
        var curEnd = intervals[index][1]
        var lastAddedInterval = result.last
        if curStart <= lastAddedInterval![1] {
            result[result.count - 1][1] = max(curEnd, lastAddedInterval![1])
        } else {
            result.append([curStart, curEnd])
        }
    }
    return result
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[1,4],[0,4]]))


