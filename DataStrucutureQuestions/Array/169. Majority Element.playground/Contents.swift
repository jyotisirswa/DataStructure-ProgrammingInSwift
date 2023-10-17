import UIKit

//MARK: - https://leetcode.com/problems/majority-element/description/?envType=study-plan-v2&envId=top-interview-150
/* Given an array nums of size n, return the majority element.
 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.*/

//Time: O(n) Space: O(1)

func majorityElement(_ nums: [Int]) -> Int {
    var majorityNumber = 0, count = 0
    nums.forEach { num in
        if count == 0 {
            majorityNumber = num
        }
        count += num == majorityNumber ? 1 : -1
    }
    return majorityNumber
}

var nums = [2,2,1,1,1,2,2]
print("Majority number is \(majorityElement(nums))")
