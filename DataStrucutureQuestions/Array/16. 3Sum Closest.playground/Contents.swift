import UIKit

//Two pointer approach https://leetcode.com/problems/3sum-closest/description/
/* In the solution above, sorting the array takes O(nlog(n))  and the nested loop takes O(n2)  to find the triplet. Here, n
 is the number of elements in the input array. Therefore, the total time complexity of this solution is O(nlog(n)+n2 ) , which simplifies to O(n
 2). */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
     let sortedArray = nums.sorted()
     let length = sortedArray.count

     var difference : Int = .max
     var result = 0

     for index in 0..<length - 1 {
         var low = index + 1
         var high = length - 1

         while low < high {
             let sum = sortedArray[index] + sortedArray[low] + sortedArray[high]
             sum > target ? (high -= 1) : (low += 1)

             let closeDifference =  abs(sum - target)

             if closeDifference < difference {
                 difference =  closeDifference
                 result = sum
             }

         }
     }
     return result
}
let nums = [-1,2,1,-4]
print(threeSumClosest(nums, 1))


