import UIKit

struct StackTwo<Element> {
    fileprivate var array : [Element] = []
    
    init() {
        self.array = []
    }
    
    init(_ elements: [Element]) {
        self.array = elements
    }
    
    //stack is empty or not
    var isEmpty: Bool {
        return peekElement() == nil
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func pushElementInStack(element : Element) {
        self.array.append(element)
    }
    
    @discardableResult
    mutating func popElementFromStack() -> Element? {
        return self.array.popLast()
    }
    
    func peekElement() -> Element? {
        return self.array.last
    }
}
extension StackTwo : CustomDebugStringConvertible {
    var debugDescription: String {
        var topLine = "--Stack--\n"
        var bottom = "\n--------\n"
        var stringStack = self.array.map{"\($0)"}.reversed().joined(separator: "\n")
        return topLine + stringStack + bottom

    }
}
var stackObj = StackTwo<String>()
stackObj.popElementFromStack()
stackObj.pushElementInStack(element: "Apple")
stackObj.pushElementInStack(element: "Banana")
stackObj.pushElementInStack(element: "Cat")
print(stackObj)
