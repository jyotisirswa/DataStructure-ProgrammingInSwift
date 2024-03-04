import UIKit

//https://leetcode.com/problems/find-k-closest-elements/
//Time complexity: O(log⁡(N−k)+k) although loop is taking O(n - k) but creating return array is taking O(k) .
//Space Complexity : O(1)
//If the element at arr[mid] is closer to x, then move the right pointer. If the element at arr[mid + k] is closer to x, then move the left pointer.
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0
    var right = arr.count - k
    while left < right {
        let middle = (left + right)/2
        
        if x - arr[middle] > arr[k + middle] - x {
            left = middle + 1 //if middle value minus x is greater than right minus operation that means we need to increase left pointer
        } else {
            right = middle //else our right pointer need to come close
        }
    }
    return Array(arr[left..<left + k])
}
print(findClosestElements([1, 2, 3, 4, 5], 3, 3))
print(findClosestElements([1,2,3,4,5], 4, 3))
