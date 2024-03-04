import UIKit

//https://leetcode.com/problems/summary-ranges/

func summaryRanges(_ nums: [Int]) -> [String] {
var start = 0
var end = 0
var outPutAray = [String]()
if nums.count == 1 {
    return ["\(nums[start])"]
}
while end < nums.count - 1 {
    if  nums[end + 1] - nums[end] == 1 {
        end += 1
    } else {
        outPutAray.append(start != end ? "\(nums[start])->\(nums[end])" : "\(nums[end])")
        end += 1
        start = end
    }
    if nums[end] == nums.last {
        outPutAray.append(start != end ? "\(nums[start])->\(nums[end])" : "\(nums[end])")
    }
}
return outPutAray
}

print(summaryRanges([0,2,3,4,6,8,9]))

