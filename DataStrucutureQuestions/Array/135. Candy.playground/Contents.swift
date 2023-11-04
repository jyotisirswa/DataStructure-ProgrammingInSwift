import UIKit

//https://leetcode.com/problems/candy/description/?envType=study-plan-v2&envId=top-interview-150

func candy(_ ratings: [Int]) -> Int {
    var candiesArray = Array(repeating : 1, count : ratings.count)
    for i in 1..<ratings.count where  ratings[i] > ratings[i - 1] {
        candiesArray[i] = candiesArray[i - 1] + 1
    }
    for i in (0..<ratings.count - 1).reversed() where ratings[i] > ratings[i + 1] {
        candiesArray[i] = max(candiesArray[i], candiesArray[i + 1] + 1)
    }
    return candiesArray.reduce(0, +)
}

print("minimum candies needed for array :- [1,0,2] is \(candy([1,0,2]))")
print("minimum candies needed for array :- [5,4,3,5,6,2] is \(candy([5,4,3,5,6,2]))")
