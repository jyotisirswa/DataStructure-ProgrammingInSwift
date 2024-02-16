import UIKit

//https://leetcode.com/problems/string-to-integer-atoi/description/

func myAtoi(_ s: String) -> Int {
    guard !s.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
        return 0
    }
    let newString = s.trimmingCharacters(in: .whitespacesAndNewlines)
    var sign = 1
    var index = 0
    var result = 0
    let INT_MAX = Int32.max
    let INT_MIN = Int32.min
    let signObj = newString[newString.index(newString.startIndex, offsetBy: 0)]
    if signObj == "+" || signObj == "-" {
        index += 1
        sign = signObj == "+" ? 1 : -1
    }
    while index < newString.count {
        let value =  newString[newString.index(newString.startIndex, offsetBy: index)]
        if Int(String(value)) != nil {
            result = 10 * result + (Int(String(value)) ?? 0)
            index += 1
        } else {
            break
        }
    }
   // result = result >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), result)
    // if result > Int(INT_MAX) {
    //     return sign == 1 ? Int(INT_MAX) : Int(pow(-2.00,  31.00))
    // }
    return sign * result
}

//print(myAtoi("42"))
//print(myAtoi("   -42"))
//print(myAtoi("560000000 with words"))
print(myAtoi("20000000000000000000"))
//print(myAtoi("2147483646"))
