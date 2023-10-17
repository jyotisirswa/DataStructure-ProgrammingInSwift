import UIKit

//MARK: - https://leetcode.com/problems/merge-sorted-array/description/?envType=study-plan-v2&envId=top-interview-150
// - Complexity:
   //   - time: O(m + n), where m is the number of elements in nums1, and n is the number of elements in nums2.
   //   - space: O(1), only constant space is used.

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var m = m - 1
    var n = n - 1
    var last = m + n + 1
    // Compare elements from the end of both arrays and insert the larger one at the end of nums1
    while m >= 0 && n >= 0 {
        if nums1[m] > nums2[n] {
            nums1[last] = nums1[m]
            m -= 1
        } else {
            nums1[last] = nums2[n]
            n -= 1
        }
        last -= 1
    }
    
    // If there are remaining elements in nums2, insert them in nums1
    while n >= 0 {
        nums1[last] = nums2[n]
        last -= 1
        n -= 1
    }
}

var nums1 = [1,2,3,0,0,0]
var nums2 = [2,5,6]
print("nums1 before merging :- \(nums1)")
print("---MERGING ELEMENTs---")
merge(&nums1, 3, nums2, 3)
nums1.remove(at: <#T##Int#>)
print("nums1 after merging :- \(nums1)")


