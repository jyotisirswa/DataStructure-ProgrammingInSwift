import UIKit

//https://leetcode.com/problems/product-of-array-except-self/description/?envType=study-plan-v2&envId=top-interview-150
//APPROACH 1 :- Complexity This approach has a time complexity of O(n)O(n)O(n) and a space complexity of O(n)O(n)O(n), where nnn is the length of the input array nums.
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var prefix = Array(repeating: 1, count: nums.count)
    var suffix = Array(repeating: 1, count: nums.count)
    var result = Array(repeating: 0, count: nums.count)
    for i in 1 ..< nums.count {
        prefix[i] = prefix[i - 1] * nums[i - 1]
    }
    
    for i in (0 ..< nums.count - 1).reversed() {
        suffix[i] = suffix[i + 1] * nums[i + 1]
    }
    for i in 0 ..< result.count {
        result[i] = prefix[i] * suffix[i]
    }
    
    return result
}
print("Product of array elements except self using first approach is :- \(productExceptSelf([1,2,3,4]))")
//APPROACH 2 :- Complexity This approach also has a time complexity of O(n)O(n)O(n) and a space complexity of O(1)O(1)O(1), where nnn is the length of the input array nums. (The output array does not count as extra space for space complexiy analysis)
func productExceptSelfTwo(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 1, count: nums.count)
    
    for i in 1 ..< nums.count {
        result[i] = result[i - 1] * nums[i - 1]
    }
    
    var suffix = 1
    for i in (0 ..< nums.count).reversed() {
        result[i] *= suffix
        suffix *= nums[i]
    }
    
    return result
}
print("Product of array elements except self using second approach is :- \(productExceptSelfTwo([1,2,3,4]))")

