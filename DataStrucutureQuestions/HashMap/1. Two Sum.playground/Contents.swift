import UIKit

//https://leetcode.com/problems/two-sum/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
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

print(twoSum([2,7,11,15], 9))
print(twoSum([3,2,4], 6))
