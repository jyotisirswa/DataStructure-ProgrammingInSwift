import UIKit

//https://leetcode.com/problems/longest-consecutive-sequence/

func longestConsecutive(_ nums: [Int]) -> Int {
    var numSet = Set(nums)
    var longest = 0
    
    for num in nums {
        if !numSet.contains(num - 1) {
            var length = 0
            while numSet.contains(num + length) {
                length += 1
                longest = max(longest, length)
            }
        }
    }
    
    return longest
}

print(longestConsecutive([100,4,200,1,3,2]))
