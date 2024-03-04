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

func removeDuplicatesApproachTwo(_ nums: inout [Int]) -> Int {
    var j = 1
    var count = 1
    
    for i in 1..<nums.count {
        print("i in loop = \(i)")
        if nums[i] == nums[i - 1] {
            count += 1
        } else {
            count = 1
        }
        if count <= 2 {
            print("j = \(j)")
            print("i = \(i)")
            nums[j] = nums[i]
            print("nums[j]  = \(nums[j] )")
            print("nums = \(nums)")
            j += 1
        }
    }
    
    return j
}

var num1 = [1,1,1,2,2,3]
print("Number of elements in array after removing third common element is \(removeDuplicatesApproachTwo(&num1))")
