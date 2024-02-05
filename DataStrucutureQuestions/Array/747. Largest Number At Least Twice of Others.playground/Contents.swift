import UIKit

//https://leetcode.com/problems/largest-number-at-least-twice-of-others/

func dominantIndex(_ nums: [Int]) -> Int {
    var maxNumber = 0, secondMaxNumber = 0, maxIndex = 0
    for (index, value) in nums.enumerated() {
        if value > maxNumber {
            secondMaxNumber = maxNumber
            maxNumber = value
            maxIndex = index
        } else if value < maxNumber && value > secondMaxNumber {
            secondMaxNumber = value
        }
    }
    if maxNumber >= (secondMaxNumber * 2) {
        return maxIndex
    }
    return -1
}

print(dominantIndex([3,6,1,0]))
print(dominantIndex([1,2,3,4]))
