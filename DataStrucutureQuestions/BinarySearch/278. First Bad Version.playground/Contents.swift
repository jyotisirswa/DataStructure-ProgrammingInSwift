import UIKit

//https://leetcode.com/problems/first-bad-version/description/
//Time complexity :O(logn)
func firstBadVersion(_ n: Int) -> Int {
     var leftValue = 0
     var rightValue = n
     var lastBadVersion = true
    func isBadVersion(_ version: Int) -> Bool{
        if version >= 7 {
            return true
        } else {
            return false
        }
    }
    while leftValue <= rightValue {
        var mid = leftValue + (rightValue - leftValue)/2
        if leftValue == rightValue {
            return leftValue
        } else if isBadVersion(mid) != true {
            leftValue = mid + 1
        } else if isBadVersion(mid) == true {
            rightValue = mid
        }
    }
    return leftValue
}

print(firstBadVersion(15))
