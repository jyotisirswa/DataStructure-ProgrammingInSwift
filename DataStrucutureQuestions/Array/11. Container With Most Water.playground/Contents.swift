import UIKit

func maxArea(_ height: [Int]) -> Int {
    var left = 0, right = height.count - 1, maxLeft = height[left], maxRight = height[right], waterFilled = 0, maxDifference = 0
    while left < right {
         maxLeft = height[left]
         maxRight = height[right]
        if maxLeft < maxRight {
           if (maxLeft * maxRight) - (right - left) >  waterFilled , right - left > maxDifference  {
            maxDifference = right - left
            waterFilled = (maxLeft * maxRight) - (right - left)
               print("left = \(left), right = \(right)")
               print("left waterFilled = \(waterFilled)")
           }
           left += 1
        }
        else {
           if (maxLeft * maxRight) - (right - left) >  waterFilled, right - left > maxDifference {
               maxDifference = right - left
               waterFilled = (maxLeft * maxRight) - (right - left)
               print("right waterFilled = \(waterFilled)")

           }
           right -= 1
        }
    }
    return waterFilled
}

print("\(maxArea([1,8,6,2,5,4,8,3,7]))")
