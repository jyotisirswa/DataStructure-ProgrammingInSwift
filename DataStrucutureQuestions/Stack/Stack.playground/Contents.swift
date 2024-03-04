import UIKit

var greeting = "Hello, playground"

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
    
   //Pushing an object onto the stack is relatively straightforward. Add the following method inside the stack:
    mutating func push(_ element : Element) {
        array.append(element)
    }
   //The pop method returns an optional String. The return type is optional to handle the case where the stack is empty in the first place. If we try to pop an empty stack, then we get a nil.
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

// 1
var rwBookStack = Stack<String>()
// 2
rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("4D Games by Tutorials")
print(rwBookStack)
// 3
rwBookStack.peek() // will return ("4D Games by Tutorials")
// 4
rwBookStack.pop() // will return ("4D Games by Tutorials")
// 5
rwBookStack.pop() // will return ("3D Games by Tutorials")
//6
rwBookStack.pop() // will return nil
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")
print(rwBookStack)
