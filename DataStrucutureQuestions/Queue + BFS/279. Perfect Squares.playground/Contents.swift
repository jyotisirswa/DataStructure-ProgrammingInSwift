import UIKit

//https://leetcode.com/problems/perfect-squares/description/

func numSquares(_ n: Int) -> Int {
    let squareNums = (1...Int(Double(n).squareRoot())).map { $0 * $0 }
    print(squareNums)
    var level = 0
    var queue: Set<Int> = [n]
    
    while !queue.isEmpty {
        level += 1
        var nextQueue = Set<Int>()
        print(queue)
        for remainder in queue {
            for squareNum in squareNums {
                print(remainder)
                print(squareNum)
                if remainder == squareNum {
                    return level
                } else if remainder < squareNum {
                    break
                } else {
                    nextQueue.insert(remainder - squareNum)
                }
            }
        }
        queue = nextQueue
    }
    return level
}
print(numSquares(15))




