import UIKit

//Given an array, find the average of each subarray of ‘K’ contiguous elements in it.
//Time Complexity :- O(N∗K)
func findAvgOf(array  arrayObj : [Int], size : Int) -> [Double] {
    var resultArray : [Double] = []
    for i in 0...(arrayObj.count - size) {
        var sum = 0.0
        for j in i..<(i + size) {
            sum += Double(arrayObj[j])
        }
        resultArray.append(sum/Double(size))
    }
    return resultArray
}

//Time Complexity :- O(N)
func findAvgOfMethodTwo(array  arrayObj : [Int], size : Int) -> [Double] {
    var resultArray : [Double] = []
    var windowSum = 0.0
    var windowStart = 0
    for windowEnd in 0..<arrayObj.count {
        windowSum += Double(arrayObj[windowEnd])
        if windowEnd >= size - 1 {
            resultArray.append(windowSum/Double(size))
            windowSum -= Double(arrayObj[windowStart])
            windowStart += 1
        }
    }
    return resultArray
}
print(findAvgOf(array: [1, 3, 2, 6, -1, 4, 1, 8, 2], size: 5))
print(findAvgOfMethodTwo(array: [1, 2, 3, 4, 5], size: 4))

