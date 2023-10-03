import UIKit

/* 1. Print a linked list in reverse without using recursion
Given a linked list, print the nodes in reverse order. You should not use recursion to
solve this problem. */

//Creating a node
public class Node<Value> {
    public var value : Value
    public var next : Node?
    
    public init(value : Value, next : Node? = nil) {
        self.value = value
        self.next = next
        
    }
}

extension Node : CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return  "\(value)"
        }
        return  "\(value) -> " + String(describing : next) + " "
    }
}

public struct LinkedList<Value> {
    public var head : Node<Value>?
    public var tail : Node<Value>?
    
    public init() {}
    
    public var isEmpty : Bool {
        head == nil
    }
    
    public mutating func push(_ value : Value) {
        head = Node(value: value, next : head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value : Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
}

extension LinkedList : CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

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


/* One of the prime use cases for stacks is to facilitate backtracking. If you push a
 sequence of values into the stack, sequentially popping the stack will give you the
 values in reverse order: */
func printInReverse<T>(_ list: LinkedList<T>) -> LinkedList<T>? {
    var current = list.head
    var stack = Stack<T>()
    var reversedList = LinkedList<T>()
    while let node = current {
        stack.push(node.value)
        current = current?.next
    }
    
    while let value = stack.pop() {
        reversedList.append(value)
    }
    return  reversedList
}

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
list.append(4)
list.append(5)
print("Linked list before reverse - \(list)")
let reversedList = printInReverse(list)
if let list = reversedList {
    print("Linked list after reverse - \(list)")
}


