import UIKit

//MARK: - https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/description/?envType=study-plan-v2&envId=top-interview-150
// - Complexity:
   //   - time: O(n), where m is the number of elements in nums1, and n is the number of elements in nums2.
   //   - space: O(1), only constant space is used.

func removeDuplicates(_ nums: inout [Int]) -> Int {
    let length =  nums.count
    guard length > 2 else {
        return length
    }
    var currentIndex = 1
    for nextIndex in 2..<length where nums[currentIndex] != nums[currentIndex - 1] || nums[currentIndex] !=  nums[nextIndex]   {
        currentIndex += 1
        nums[currentIndex] = nums[nextIndex]
    }
    return currentIndex + 1
}

var num1 = [1,1,1,2,2,3]
print("Number of elements in array after removing third common element is \(removeDuplicates(&num1))")
