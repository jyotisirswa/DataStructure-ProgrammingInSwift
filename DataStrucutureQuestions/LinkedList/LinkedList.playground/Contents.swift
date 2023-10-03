import UIKit

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

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3

print("Node:- \(node1)")

//Adding values to the list
//1. :- Push Operation :-  Adds a value at the front of the list.
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
    
    public mutating func prepend(_ value : Value ) {
        head = Node(value: value, next: head)
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
    
    public func node(at index : Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
          currentNode = currentNode!.next
          currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
    -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        print(node.next)
        print(Node(value: value, next: node.next))
        node.next = Node(value: value, next: node.next)
        print(Node(value: value, next: node.next))
        print(node.next)
        return node.next!
    }
    
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    
    @discardableResult public mutating func removeLast() -> Value? {
        //1
        guard let head = head else {
            return nil
        }
        
        //2
        guard head.next != nil else {
            return pop()
        }
        
        //3
        var current = head
        var prev = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        //4
        prev.next = nil
        tail = prev
        
        return current.value
    }

    
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
        
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

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
list.append(4)
list.append(5)
var nodeAtIndex = list.node(at: 1)!
print("Node at index  :- \(nodeAtIndex)\n")

nodeAtIndex = list.insert(-1, after: nodeAtIndex)

print("After inserting: \(list)")
print("Before popping list: \(list)")
let poppedValue = list.pop()
print("After popping list: \(list)")
print("Popped value: " + String(describing: poppedValue))
print("Before removing last node: \(list)")
let removedValue = list.removeLast()

print("After removing last node: \(list)")
print("Removed value: " + String(describing: removedValue))

let index = 1
let node = list.node(at: index - 1)!
let removedValueTwo = list.remove(after: node)

print("After removing at index \(index): \(list)")
print("Removed value: " + String(describing: removedValueTwo))


//Challenge 1: Print in reverse
private func printInReverse<T>(_ node: Node<T>?) {

    // 1
    guard let node = node else {
        print("Exit")
        return
        
    }
    print("node passed :- \(node.value)")
    // 2
    printInReverse(node.next)
    print(node.value)
}

func printInReverse<T>(_ list: LinkedList<T>) {
  printInReverse(list.head)
}

printInReverse(list)

//Challenge 2: Find the middle node
func getMiddle<T>(list : LinkedList<T>) -> Node<T>? {
    var slow = list.head
    var fast = list.head
    
    while let nextFast = fast?.next {
        fast = nextFast.next
        slow = slow?.next
    }
    return slow
}

var listTwo = LinkedList<Int>()
listTwo.push(3)
listTwo.push(2)
listTwo.push(1)


if let middleNode = getMiddle(list: listTwo) {
    print("Middle Node = \(middleNode)")
}

////Challenge 3: Reverse a linked list
//func reverseLinkedList<T>(list : LinkedList<T>) ->  LinkedList<T> {
//    var slow = list.head
//    var fast = list.head
//
//    while let nextFast = fast?.next {
//        fast = nextFast.next
//        slow = slow?.next
//    }
//    return slow
//}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    print("Running total :- \(runningTotal)")
    print("amount  :- \(amount)")
    func incrementer() -> Int {
        runningTotal += amount
        print("Running total inside :- \(runningTotal)")
        print("amount  inside :- \(amount)")
        return runningTotal
    }
    print("Call function")
    return incrementer
}

var increamentbyTen = makeIncrementer(forIncrement: 10)
print(increamentbyTen())
print(increamentbyTen())
var increamentbySeven = makeIncrementer(forIncrement: 7)
print(increamentbySeven())
print(increamentbySeven())





