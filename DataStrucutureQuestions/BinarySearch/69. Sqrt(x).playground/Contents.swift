import UIKit

//https://leetcode.com/problems/sqrtx/description/

//Approach 1 :
func mySqrt(_ x: Int) -> Int {
    if x < 2 {
        return x
    } else  {
        return mySqrt(x, left: 2, right: x/2)
    }
}

func mySqrt(_ x: Int, left : Int, right : Int) -> Int {
    guard left <= right else {
       return right
    }
    let middle = (left + right)/2
    let sqr = middle * middle
    if sqr == x {
        return middle
    } else if sqr > x {
        return mySqrt(x, left: left, right: middle - 1)
    } else {
        return mySqrt(x, left: middle + 1, right: right)
    }
}

//Approach 2 :
func mySqrtApproachTwo(_ x: Int) -> Int {
    if x < 2 {
        return x
    } else  {
        var left = 2
        var right = x/2
        while left <= right {
            let middle = (left + right)/2
            let sqrValue = middle * middle
            if sqrValue == x {
                return middle
            } else if sqrValue > x {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        return right
    }
}

print(mySqrtApproachTwo(6))
print(mySqrt(6))
