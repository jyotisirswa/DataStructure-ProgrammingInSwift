import UIKit

//https://leetcode.com/problems/next-greater-element-i/description/

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var stacks : [Int] = []
    var mapping = [Int : Int]()
    
    for (_, value) in nums2.enumerated() {
        while !stacks.isEmpty && value > stacks.last ?? 0 {
            mapping[stacks.removeLast()] = value
        }
        stacks.append(value)
    }
    
    while !stacks.isEmpty {
        mapping[stacks.removeLast()] = -1
    }
    
    var answer = [Int]()
    
    for num in nums1 {
        answer.append(mapping[num]!)
    }
    return answer
}

print(nextGreaterElement([4,1,2], [1,3,4,2]))
