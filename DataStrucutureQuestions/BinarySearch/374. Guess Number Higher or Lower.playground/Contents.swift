import UIKit

//https://leetcode.com/problems/guess-number-higher-or-lower/description/

func guessNumber(_ n: Int) -> Int {
    func guess(_ num: Int) -> Int {
        if num == pick {
            return 0
        } else if num < pick {
            return 1
        } else {
            return -1
        }
    }
    var leftNumber = 1
    var rightNumber = n
    while leftNumber <= rightNumber {
        let middle = (leftNumber + rightNumber)/2
        if guess(middle) == 0 {
            return middle
        } else if  guess(middle) == -1 {
            rightNumber = middle - 1
        } else {
            leftNumber = middle + 1
        }
    }
    return rightNumber
}

var pick = Int.random(in: 0..<15)
print("Picked number = \(pick)")
print("Guessed number = \(guessNumber(15))")


