import UIKit

//https://leetcode.com/problems/fraction-to-recurring-decimal/

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    var result = ""
    var remainderMap : [Int : Int] = [:]
    if numerator == 0 {
        return "0"
    }
    
    if numerator < 0 || denominator < 0 {
        result.append("-")
    }
    
    var quotient = abs(numerator/denominator)
    result += "\(quotient)"
    var remainder = (numerator % denominator) * 10
    if remainder == 0 {
        return result
    } else {
        result += "."
    }
    
    while remainder != 0 {
        if remainderMap[remainder] != nil {
            let beginning = remainderMap[remainder]
            let left = result[result.index(result.startIndex, offsetBy: 0)..<result.index(result.startIndex, offsetBy: beginning ?? 0)]
            let right = result[result.index(result.startIndex, offsetBy: beginning ?? 0)..<result.index(result.startIndex, offsetBy: result.count)]
            result = left + "(" + right + ")"
            return result
        } else {
            remainderMap[remainder] = result.count
            quotient = remainder/denominator
            result += "\(quotient)"
            remainder = (remainder % denominator) * 10
        }
    }
    return result
}

print(fractionToDecimal(4, 333))
print(fractionToDecimal(1, 2))
