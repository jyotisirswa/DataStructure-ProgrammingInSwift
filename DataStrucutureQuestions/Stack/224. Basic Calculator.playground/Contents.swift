import UIKit

//https://leetcode.com/problems/basic-calculator/

func calculate(_ s: String) -> Int {
    var number = 0
    var signValue = 1
    var result = 0
    var operationStack = [Int]()
    for character in s {
        if character.isNumber {
            number = number * 10 + Int(String(character))!
        } else if character == "+" || character == "-" {
            result += number * signValue
            signValue = character == "-" ? -1 : 1
            number = 0
        } else if character == "(" {
            operationStack.append(result)
            operationStack.append(signValue)
            result = 0
            signValue = 1
        } else if character == ")" {
            result += signValue * number
            let popSignValue = operationStack.popLast()!
            result *= popSignValue
            let secondValue = operationStack.popLast()!
            result += secondValue
            number = 0
        }
    }
    return result + number * signValue
}

print(calculate("(1+(4+5+2)-3)+(6+8)"))
