import UIKit

//https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
//Will run two binary search one to find lower bound & other one to find upper bound
//Main conditions :- nums[middle] == target (this involves if isFirst & will check if found lower bound then will return otherwise will set right to middle - 1 else  if its for upperBound then also will check if upper bound found or else will set left to middle + 1)
//if nums[middle] > target will set right pointer else will set leftPointer

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let firstIndex = findBound(nums, target, isFirst: true)
    if firstIndex == -1 {
        return [-1, -1]
    }
    let secondIndex = findBound(nums, target, isFirst: false)
    return [firstIndex, secondIndex]
}

func findBound(_ nums: [Int], _ target: Int, isFirst : Bool) -> Int {
    let length = nums.count
    var left = 0, right = length - 1
    
    while left <= right {
        let middle = left + (right - left)/2
        if nums[middle] == target {
            if isFirst {
                if middle == left || nums[middle - 1] < target {
                    return middle
                } else {
                    right = middle - 1
                }
            } else {
                if middle == right || nums[middle + 1] > target {
                    return middle
                } else {
                    left = middle + 1
                }
            }
        } else if nums[middle] > target {
            right = middle - 1
        } else {
            left = middle + 1
        }
    }
    return -1
}


print(searchRange([5,7,7,8,8,10], 6))
print(searchRange([1], 1))
