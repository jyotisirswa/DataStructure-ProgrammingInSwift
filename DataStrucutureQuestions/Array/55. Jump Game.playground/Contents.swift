import UIKit

//https://leetcode.com/problems/jump-game/?envType=study-plan-v2&envId=top-interview-150


func canJump(_ nums: [Int]) -> Bool {
    var valueMax = nums[0]
    for (index, num) in nums.enumerated() {
        if index > valueMax {
            return false
        }
        valueMax = max(valueMax, index + num)
    }
    return true
}
var nums = [2,3,1,1,4]
print(canJump(nums))
