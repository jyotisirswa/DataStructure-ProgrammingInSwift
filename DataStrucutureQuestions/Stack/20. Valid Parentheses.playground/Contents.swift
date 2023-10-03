import UIKit

/*
 https://leetcode.com/problems/valid-parentheses/description/
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 */

func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 && !s.isEmpty else {
        return false
    }
    var stack: [Character] = []
    for  character in s {
        switch character {
        case "(" : stack.append(")")
        case "{" : stack.append("}")
        case "[" : stack.append("]")
        default :
            if stack.isEmpty || stack.removeLast() != character {
                return false
            }
        }
    }
    return stack.isEmpty
}
let parantheses = "()[]{}"
let isValidObj = isValid(parantheses)
print("parantheses are valid = \(isValidObj)")
