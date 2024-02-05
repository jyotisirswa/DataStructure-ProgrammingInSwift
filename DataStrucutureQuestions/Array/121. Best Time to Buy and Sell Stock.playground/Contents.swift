import UIKit

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/?envType=study-plan-v2&envId=top-interview-150
//Time Complexity :- O(n), space complexity is O(1)
public func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = Int.max
    print(minPrice)
    var maxProfit = 0
    for price in prices {
        minPrice = min(price, minPrice)
        maxProfit = max(price - minPrice, maxProfit)
    }
    return maxProfit
}

print("Max profit of [7,1,5,3,6,4] is :- \(maxProfit([7,1,5,3,6,4]))") //Buy on second day & sell on 5th day
print("Max profit of [7,6,4,3,1] is :- \(maxProfit([7,6,4,3,1]))") //in every sell it gonna be loss

