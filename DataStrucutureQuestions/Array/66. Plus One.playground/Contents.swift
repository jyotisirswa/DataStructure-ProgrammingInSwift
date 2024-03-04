import UIKit

//https://leetcode.com/problems/plus-one/solutions/4651628/solution-in-swift

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    for i in (0..<digits.count).reversed() {
        guard digits[i] == 9 else {
            digits[i] += 1
            return digits
        }
        digits[i] = 0
    }
    digits.insert(1, at : 0)
    return digits
}

print(plusOne([1,2,3]))
print(plusOne([4,3,2,1]))
print(plusOne([9]))
