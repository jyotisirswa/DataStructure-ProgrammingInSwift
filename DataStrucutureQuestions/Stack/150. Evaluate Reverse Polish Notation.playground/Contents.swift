import UIKit

//https://leetcode.com/problems/evaluate-reverse-polish-notation/description/
/* You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
 //https://en.wikipedia.org/wiki/Reverse_Polish_notation
 Evaluate the expression. Return an integer that represents the value of the expression. */

func evalRPN(_ tokens: [String]) -> Int {
     var stack = [Int]()
     for tokenObj in tokens {
         print(stack)
         if let number = Int(tokenObj) {
             stack.append(number)
             continue
         }
         guard stack.count >= 2 else {
             fatalError("RPN expression is not valid")
         }

         var secondItem = stack.removeLast()
         var firstItem = stack.removeLast()

         switch tokenObj {
             case "+" : stack.append(firstItem + secondItem)
             case "-" : stack.append(firstItem - secondItem)
             case "*" : stack.append(firstItem * secondItem)
             case "/" : stack.append(firstItem / secondItem)
            default :
                    fatalError("RPN expression is not valid")
         }
     }
     guard stack.count == 1 else {
             fatalError("RPN expression is not valid")
     }
     return stack[0]
}

var tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
let validRPNResult = evalRPN(tokens)
print("RPN result is = \(validRPNResult)")



