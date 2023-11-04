import UIKit

//https://leetcode.com/problems/jump-game-ii/description/?envType=study-plan-v2&envId=top-interview-150

func jump(_ nums: [Int]) -> Int {
    if nums.count <= 1 {
        return 0
    }
    if nums[0] == 0 {
        return -1
    }
    var valueMax = nums[0]
    var steps = nums[0]
    var jumps = 1
    var i = 1
    for i in 1..<nums.count {
        if i == nums.count - 1 { return jumps }
        valueMax = max(valueMax , i + nums[i])
        steps -= 1
        if (steps == 0) {
            jumps +=  1
            if i >= valueMax {
            return -1
        }
         steps = valueMax - i
        }
    }
    return -1
}
print("Minimum jumps required for array [2,3,1,1,4] is :- \(jump([2,3,1,1,4]))")
