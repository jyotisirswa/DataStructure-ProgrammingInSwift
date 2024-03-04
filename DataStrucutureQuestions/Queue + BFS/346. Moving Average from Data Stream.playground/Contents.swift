import UIKit

//https://leetcode.com/problems/moving-average-from-data-stream/description/

/*
 Complexity
 Time Complexity: O(N) where N is the size of the moving window, since we need to retrieve N elements from the queue at each invocation of next(val) function.
 Space Complexity: O(M), where M is the length of the queue which would grow at each invocation of the next(val) function.
 */

class MovingAverage {
    var array : [Int] = []
    var prevSum = 0
    var writeIndex = 0
    init(_ size: Int) {
        array = Array(repeating : 0, count : size)
    }
    
    func next(_ val: Int) -> Double {
        prevSum += (writeIndex >= 0 && writeIndex < array.count) ? val :  (val - array[writeIndex % array.count])
        array[writeIndex % array.count] = val
        writeIndex += 1
        let divider = (writeIndex > 0 && writeIndex <= array.count) ? writeIndex : array.count
        return Double(prevSum)/Double(divider)
    }
}

var obj = MovingAverage(3)
print("Moving avg = \(obj.next(1))")
print("Moving avg = \(obj.next(10))")
print("Moving avg = \(obj.next(3))")
print("Moving avg = \(obj.next(5))")


