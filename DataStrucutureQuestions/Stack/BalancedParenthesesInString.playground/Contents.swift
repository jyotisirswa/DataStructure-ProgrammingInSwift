import UIKit

/* Given a string, check if there are ( and ) characters, and return true if the parentheses
 in the string are balanced. For example:
 // 1
 h((e))llo(world)() // balanced parentheses
 // 2
 (hello world // unbalanced parentheses*/

//a Stack with an array property.
struct Stack<Element> {
    fileprivate var array : [Element] = []
    
    //stack is empty or not
    var isEmpty: Bool {
      return array.isEmpty
    }

    //how many elements are currently in the stack
    var count: Int {
      return array.count
    }
    
//    Pushing an object onto the stack is relatively straightforward. Add the following method inside the stack:
    mutating func push(_ element : Element) {
        array.append(element)
    }
//    The pop method returns an optional String. The return type is optional to handle the case where the stack is empty in the first place. If we try to pop an empty stack, then we get a nil.
    @discardableResult
    mutating func pop() -> Element? {
        return array.popLast()
    }

    //Peeking into the stack is to check the top element of the stack.
    func peek() -> Element? {
        return array.last
    }
}

extension Stack : CustomStringConvertible {
    
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        let stackElements = array.map{"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}

func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        }
        else if character == ")" {
            if stack.isEmpty {
                return false
            }
            else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty
}

var  s = "(()))("
var isValid = checkParentheses(s)
print("valid parantheses = \(isValid)")





