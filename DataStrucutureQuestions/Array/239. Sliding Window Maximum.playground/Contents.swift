import UIKit

//https://leetcode.com/problems/sliding-window-maximum/

/*Example :-
 What should be the output if the following input is given?
 nums = [1, 2, 3, 1, 4, 5, 2, 3, 6]
 w = 3  
 
 Ans :-  The first window of size 3 is [1, 2, 3], and the maximum in this window is 3. The second window of size is [2, 3, 1], and the maximum in this window is also 3. The third window of size 3 is [3, 1, 4], and the maximum in this window is 4. The fourth window of size 3 is [1, 4, 5], and the maximum in this window is 5. The fifth window of size 3 is [4, 5, 2], and the maximum in this window is also 5. The sixth window of size 3 is [5, 2, 3], and the maximum in this window is also 5. The seventh and the last window of size 3 is [2, 3, 6], and the maximum in this window is 6.
  = [3, 3, 4, 5, 5, 5, 6]
 */

//func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//     var maxValue = 0
//     var windowArray : [Int] = []
//    var maxSlidingWindow : [Int] = []
//    var start = 0
//    while start < nums.count {
//        if start == 0 {
//            for wIndex in start..<k {
//                windowArray.append(nums[wIndex])
//                maxValue = max(maxValue, nums[wIndex])
//            }
//            maxSlidingWindow.append(maxValue)
//            start += k
//            print(start)
//        } else {
//            windowArray.removeFirst()
//            windowArray.append(nums[start])
//            maxValue = max(maxValue, nums[start])
//            maxSlidingWindow.append(maxValue)
//            start += 1
//        }
//    }
//    return maxSlidingWindow
//}

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.isEmpty == false else { return [] }
    
    var windowArray = [Int]()
    var outputArray = [Int]()
    
    for i in 0..<nums.count {
        while (windowArray.count > 0) && (nums[windowArray.last!] < nums[i]) {
            windowArray.removeLast()
        }
        windowArray.append(i)
        
        if i >= k - 1 {
            if windowArray.first! + k == i { windowArray.removeFirst() }
            outputArray.append(nums[windowArray.first!])
        }
    }
    return outputArray
}

print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3))
