import Foundation

public struct LinkedList<Value> {
    public var head : Node<Value>?
    public var tail : Node<Value>?
    
    public init() {}
    
    public var isEmpty : Bool {
        return head == nil
    }
    
    //PUSH
    public mutating func push(_ value : Value) {
        head = Node(value : value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //APPEND
    public mutating func append(_ value : Value) {
        guard  !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    //Get Node at index
    public func node(at index : Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    //Insert at particualar index
    @discardableResult
    public mutating func insert(_ value : Value, after node : Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    //POP
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
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
