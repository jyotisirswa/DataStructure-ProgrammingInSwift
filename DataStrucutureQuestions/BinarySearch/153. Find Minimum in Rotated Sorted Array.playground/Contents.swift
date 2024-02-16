import UIKit

//https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    if nums[right] > nums[left] {
        return nums[left]
    }

    while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }
            else if nums[mid - 1] > nums[mid] {
                return nums[mid]
            }
            else if nums[mid] > nums[0] {
                left = mid + 1
            } else {
                right = mid - 1
            }
    }

    return nums[left]
}

print(findMin([1]))
print(findMin([4,5,6,7,0,1,2]))
