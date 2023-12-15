import UIKit

//https://leetcode.com/problems/contains-duplicate-ii/

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var dict = [Int : Int]()
    for (index, value) in nums.enumerated() {
        if let duplicateIndex = dict[value], index - duplicateIndex <= k {
            return true
        }
        dict[value] = index
    }
    return false
}

print(containsNearbyDuplicate([1,2,3,1], 3))
print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
