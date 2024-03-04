import UIKit

//https://leetcode.com/problems/find-peak-element/description/
//O(log2(n))

func findPeakElement(_ nums: [Int]) -> Int {
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    if nums.count == 1 {
        return nums[0]
    }
    while leftIndex < rightIndex {
        var middleIndex = leftIndex + (rightIndex - leftIndex)/2
        nums[middleIndex] < nums[middleIndex + 1] ? (leftIndex = middleIndex + 1) : (rightIndex = middleIndex)
    }
    return leftIndex
}

print(findPeakElement([1,2,3,1]))
