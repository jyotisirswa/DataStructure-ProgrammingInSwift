import UIKit

//https://leetcode.com/problems/minimum-size-subarray-sum/description/?envType=study-plan-v2&envId=top-interview-150
//Time Complexity O(n)

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
     var left = 0, total = 0
     var result = Int.max
     for right in 0..<nums.count {
         total += nums[right]
         while total >= target {
             result = min(right - left + 1, result)
             total -= nums[left]
             left += 1
         }
     }
     return result == Int.max ? 0 : result
}

print("minimum window subarray of target 7 is \(minSubArrayLen(7, [2,3,1,2,4,3]))" )
print("minimum window subarray of target 11 is \(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))" )
