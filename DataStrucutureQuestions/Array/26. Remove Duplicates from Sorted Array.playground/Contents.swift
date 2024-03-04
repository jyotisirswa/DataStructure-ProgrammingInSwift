import UIKit

//MARK: - https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150

// - Complexity:
   //   - time: O(n), where m is the number of elements in nums1, and n is the number of elements in nums2.
   //   - space: O(1), only constant space is used.

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var i = 0
    for j in 1..<nums.count {
        guard nums[i] != nums[j] else { continue }
        i += 1
        nums[i] = nums[j]
    }
//    let count = nums.count
//    nums.removeSubrange(i+1..<count)
    return i + 1
}



var num1 = [1,1,1,2,2,3,3,4,4,5,5,5] // [0,0,1,1,1,2,2,3,3,4]
print("Number of unique elements in array is \(removeDuplicates(&num1))")
print(num1)
