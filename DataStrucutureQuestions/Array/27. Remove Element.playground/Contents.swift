import UIKit

//MARK: - https://leetcode.com/problems/remove-element/description/?envType=study-plan-v2&envId=top-interview-150
// - Complexity:
   //   - time: O(n), where m is the number of elements in nums1, and n is the number of elements in nums2.
   //   - space: O(1), only constant space is used.

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var i = nums.count - 1
    while i >= 0 {
        if nums[i] == val {
            nums.remove(at : i)
        }
        i -= 1
    }
    return nums.count
}
var nums = [3,2,2,3]
print(removeElement(&nums, 3))
print(nums)
