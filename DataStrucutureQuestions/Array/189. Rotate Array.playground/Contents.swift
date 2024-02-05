import UIKit

//https://leetcode.com/problems/rotate-array/description/

func rotateArray(_ nums: inout [Int], _ k: Int) {
    var rotationLimit = k % nums.count
    print(rotationLimit)
    for _ in 0..<nums.count - rotationLimit {
        let element = nums.removeFirst()
        nums.append(element)
    }
}

func rotateArrayApproachTwo(_ nums: inout [Int], _ k: Int) {
    var rotationLimit = k % nums.count
    if rotationLimit > 0 {
        reverseArray(&nums, 0, nums.count - 1)
        reverseArray(&nums, 0, rotationLimit - 1)
        reverseArray(&nums, rotationLimit , nums.count - 1)
    }
}

func reverseArray(_ nums : inout [Int], _ leftPointer : Int, _ rightPointer : Int) {
    var left = leftPointer
    var right = rightPointer
    while left < right {
        (nums[left], nums[right]) = (nums[right], nums[left])
        left += 1
        right -= 1
    }
}

var nums = [-1,-100,3,99] // [1,2,3,4,5,6,7]
rotateArrayApproachTwo(&nums, 2)  //[3,99,-1,-100]
print(nums)
