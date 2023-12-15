import UIKit

//https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/description/

func minRemoveParentheses(_ s: String) -> String {
    var stack: [(Character, Int)] = []
    var response = ""
    
    for (i, val) in s.enumerated() {
        if !stack.isEmpty && stack.last!.0 == "(" && val == ")" {
            stack.popLast()
        } else if val == "(" || val == ")" {
            stack.append((val, i))
        }
    }
    for (i, val) in s.enumerated() where !stack.contains(where: { $0.1 == i && $0.0 == val}) {
        response.append(val)
    }
    return response
}

print(minRemoveParentheses("lee(t(c)o)de)"))
print(minRemoveParentheses("))(("))
