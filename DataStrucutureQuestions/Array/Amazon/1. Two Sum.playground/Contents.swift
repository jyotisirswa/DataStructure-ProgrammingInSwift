import UIKit

//https://leetcode.com/problems/two-sum/description/

//Approach 1 : Using hash map
//time complexity : O(n), space complexity : O(n)
func twoSums(nums : [Int], target : Int) -> [Int] {
    var hashMap = [Int : Int]()
    
    for (index, value) in nums.enumerated() {
        if hashMap[value] != nil {
            return [hashMap[value]!, index]
        } else {
            hashMap[target - value] = index
        }
    }
    return []
}

//Approach 2 : Using two pointer approach
//time complexity : O(n), space complexity : O(n)
func twoSumsSecondApproach(nums : [Int], target : Int) -> [Int] {
    var newArray = nums.sorted()
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        if newArray[left] + newArray[right] == target {
            return [left, right]
        } else if newArray[left] + newArray[right] > target {
            right -= 1
        } else {
            left += 1
        }
    }
    
    return []
}

print(twoSums(nums: [2,7,11,15], target: 9))
print(twoSumsSecondApproach(nums: [2,7,11,15], target: 9))
print(twoSums(nums: [3, 3], target: 6))
print(twoSumsSecondApproach(nums: [3, 3], target: 6))
