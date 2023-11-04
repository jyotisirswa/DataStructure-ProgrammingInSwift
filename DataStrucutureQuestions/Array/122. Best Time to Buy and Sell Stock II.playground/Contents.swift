import UIKit

//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/?envType=study-plan-v2&envId=top-interview-150
//Time Complexity :- O(n), space complexity is O(1)

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            profit +=  prices[i] - prices[i - 1]
        }
    }
    return profit
}
print("Max profit of [7,1,5,3,6,4] is :- \(maxProfit([7,1,5,3,6,4]))") //Buy on second day & sell on 5th day
//[1,2,3,4,5]
print("Max profit of [1,2,3,4,5] is :- \(maxProfit([1,2,3,4,5]))") //Buy on second day & sell on 5th day

