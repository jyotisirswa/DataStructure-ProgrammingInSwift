import UIKit

//https://leetcode.com/problems/trapping-rain-water/description/?envType=study-plan-v2&envId=top-interview-150
//APPROACH 1 :- TimeComplexity O(n), spaceComplexity O(n)
func trap(_ height: [Int]) -> Int {
    var maxLeftArray = Array(repeating:0, count : height.count)
    var maxRightArray = Array(repeating:0, count : height.count)
    var minLeftRightArray = Array(repeating:0, count : height.count)
    var waterTrappedArray = Array(repeating:0, count : height.count)
    
    for i in 1..<height.count {
        maxLeftArray[i] = max(height[i - 1], maxLeftArray[i - 1])
    }
    for i in (0..<height.count - 1).reversed() {
        maxRightArray[i] = max(height[i + 1], maxRightArray[i + 1])
    }
    for i in 0..<height.count {
        minLeftRightArray[i] = min(maxLeftArray[i], maxRightArray[i])
    }
    for i in 0..<height.count {
        waterTrappedArray[i] =  minLeftRightArray[i] - height[i] > 0 ?  minLeftRightArray[i] - height[i] : 0
    }
    return waterTrappedArray.reduce(0, +)
}
print("Total water filled using approch 1 for elevation of [0,1,0,2,1,0,1,3,2,1,2,1] is : \(trap([0,1,0,2,1,0,1,3,2,1,2,1])) ")

//APPROACH 2 :- TimeComplexity O(n), spaceComplexity O(1) using two pointer approach
func trapApproachTwo(_ height: [Int]) -> Int {
    var left = 0, right = height.count - 1, maxLeft = height[left], maxRight = height[right], waterFilled = 0
    while left < right {
        if maxLeft < maxRight {
            left += 1
            maxLeft = max(maxLeft, height[left])
            waterFilled += maxLeft - height[left]
        }
        else {
            right -= 1
            maxRight = max(maxRight, height[right])
            waterFilled += maxRight - height[right]
        }
    }
    return waterFilled
}
print("Total water filled using approch 2 for elevation of [0,1,0,2,1,0,1,3,2,1,2,1] is : \(trapApproachTwo([0,1,0,2,1,0,1,3,2,1,2,1])) ")
