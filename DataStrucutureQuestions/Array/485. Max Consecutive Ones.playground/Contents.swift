import UIKit

//https://leetcode.com/problems/max-consecutive-ones/description/

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
     guard nums.count > 0 else {
         return 0
     }
     var countOfOne = 0
     var maxCount = 0
     for index in 0..<nums.count {
         if nums[index] != 1 {
             countOfOne = 0
         } else {
             countOfOne += 1
             maxCount = max(countOfOne, maxCount)
         }
     }
     return maxCount
}

print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
print(findMaxConsecutiveOnes([1,0,1,1,0,1]))
