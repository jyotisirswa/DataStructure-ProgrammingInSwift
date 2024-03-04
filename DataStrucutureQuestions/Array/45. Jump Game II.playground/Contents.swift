import UIKit

//https://leetcode.com/problems/jump-game-ii/description/?envType=study-plan-v2&envId=top-interview-150

func jump(_ nums: [Int]) -> Int {
    var answer = 0, size = nums.count
    var curEnd = 0, curFar = 0
    for index in 0..<size - 1 {
        curFar = max(curFar, index + nums[index])

        if index == curEnd {
            answer += 1
            curEnd = curFar
        }
    }
    return answer
}
print("Minimum jumps required for array [2,3,1,1,4] is :- \(jump([2,3,1,1,4]))")
