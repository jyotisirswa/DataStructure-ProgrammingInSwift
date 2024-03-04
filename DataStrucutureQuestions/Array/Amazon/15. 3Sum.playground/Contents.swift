import UIKit

//https://leetcode.com/problems/3sum/
//Time Complexity: O(n^2)\. twoSumII is O(n), and we call it n times.
//Space Complexity = O(n)
func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var sortedArray = nums.sorted()
    var result = Set<[Int]>()
    for index in 0..<sortedArray.count {
        var lowIndex = index + 1
        var highIndex = nums.count - 1
        while lowIndex  < highIndex  {
            let sum = sortedArray[index] + sortedArray[lowIndex] + sortedArray[highIndex]
            if sum > 0 {
                highIndex -= 1
            } else if sum < 0  {
                lowIndex += 1
            } else {
                result.insert([sortedArray[index], sortedArray[lowIndex], sortedArray[highIndex] ])
                lowIndex += 1
                highIndex -= 1
            }
        }
    }
    return Array(result)
}
//print("all triplets combination of array [-1,0,1,2,-1,-4] is:  \(threeSum([-1,0,1,2,-1,-4]))")
print("all triplets combination of array [-1,0,1,2,-1,-4] is:  \(threeSumApproachTwo([-1,0,1,2,-1,-4]))")
