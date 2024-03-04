import UIKit

//https://leetcode.com/problems/candy/description/?envType=study-plan-v2&envId=top-interview-150
/*
 Candies will be one by default
 will loop to check if rating of right element is > prev will update candies by 1 for that indez
 will loop to check if left rating is greater than right , then will increase candies for that element by max of left or right + 1
 */

func candy(_ ratings: [Int]) -> Int {
    var candiesArray = Array(repeating : 1, count : ratings.count)
    for i in 1..<ratings.count where  ratings[i] > ratings[i - 1] {
        candiesArray[i] = candiesArray[i - 1] + 1
    }
    for i in stride(from: ratings.count - 2, through: 0, by: -1) where ratings[i] > ratings[i + 1] {
        candiesArray[i] = max(candiesArray[i], candiesArray[i + 1] + 1)
    }
    return candiesArray.reduce(0, +)
}

print("minimum candies needed for array :- [1,0,2] is \(candy([1,0,2]))")
print("minimum candies needed for array :- [5,4,3,5,6,2] is \(candy([5,4,3,5,6,2]))")
