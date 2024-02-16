import UIKit

//https://leetcode.com/problems/search-in-rotated-sorted-array/description/
//O(logn)
func search(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    var left = 0, right = n - 1
    while left <= right {
        let mid = left + (right - left) / 2 // (left + right)/2
        print("left = \(left)")
        print("right = \(right)")
        print("mid = \(mid)")
        if nums[mid] == target {
            return mid
        } else if nums[mid] >= nums[left] {
            if target >= nums[left] && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if target <= nums[right] && target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return -1
}

print(search([4,5,6,7,0,1,2], 0))
