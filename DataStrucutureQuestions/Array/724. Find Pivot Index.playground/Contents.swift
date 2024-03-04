import UIKit

//https://leetcode.com/problems/find-pivot-index/
func pivotIndex(_ nums: [Int]) -> Int {
     let totalSum = nums.reduce(0, +)
     var leftSum = 0
     for (index, value) in nums.enumerated() {
         if leftSum == totalSum - value - leftSum {
             return index
         }
         leftSum += value
     }
     return -1
}
print(pivotIndex([1,7,3,6,5,6]))
print(pivotIndex([1, 2, 3]))
