import UIKit


func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            profit +=  prices[i] - prices[i - 1]
        }
    }
    return profit
}

print(maxProfit([7,1,5,3,6,4]))
