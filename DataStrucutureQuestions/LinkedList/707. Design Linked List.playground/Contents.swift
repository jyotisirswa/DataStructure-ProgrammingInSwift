import UIKit

//https://leetcode.com/problems/design-linked-list/description/
class Node {
    var value : Int
    var next : Node?
    
    init(value : Int, next : Node? = nil) {
        self.value = value
        self.next = next
    }
}

class MyLinkedListTwo {
    var head : Node?
    var tail : Node?
    var size = 0
    var isEmpty : Bool {
        return head == nil
    }
    
    init() {
       // self.head = Node(value: 0)
        self.size = 0
    }
    
    //Push function :- to add new node at head (Head end insertion)
    func addAtHead(_ val: Int) {
        head = Node(value: val, next: head)
        if tail == nil {
            tail = head
        }
        self.size += 1
        print("size after add at head= \(size)")

    }
    
    func addAtTail(_ val: Int) {
        var node = Node(value: val)
        if isEmpty {
            addAtHead(val)
        } else {
            self.size += 1
            tail?.next = node
            tail = tail?.next
            print("size after add at tail= \(size)")
        }
        
    }
    
    func get(_ index: Int) -> Int {
        guard index < self.size else  {
            return -1
        }
        var currentNode = head
        for i in 0..<index {
            print("index = \(i)")
            print("current Head = \(currentNode?.value)")
            currentNode = currentNode?.next
        }
        return currentNode?.value ?? 0
    }
    
    func getNodeAtIndex(_ index: Int) -> Node? {
        guard index < self.size else  {
            return nil
        }
        var currentNode = head
        for i in 0..<index {
            currentNode = currentNode?.next
            print("index = \(i)")
            print("current Head = \(currentNode?.value)")
        }
        return currentNode
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            addAtHead(val)
        } else if index == size {
            addAtTail(val)
        } else if let node = getNodeAtIndex(index - 1) {
            self.size += 1
            print("size after add = \(size)")
            var nodeToAdd = Node(value: val, next: node.next)
            node.next = nodeToAdd
        }
    }
    
    func deleteAtHead() -> Int? {
        defer {
            head = head?.next
            self.size = (size > 0) ? (size - 1) : 0
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    func deleteAtTail() -> Int? {
        guard head != nil else {
            return -1
        }
        guard head?.next != nil else {
            return deleteAtHead()
        }
        var prev = head
        var current = head
        while let next = current?.next {
            prev = current
            current = next
        }
        self.size -= 1
        prev?.next = nil
        tail = prev
        return current?.value
    }
    
    func deleteAtIndex(_ index: Int) {
        if index == 0 {
            deleteAtHead()
        } else if index == size - 1 {
            deleteAtTail()
        } else if index >= size {

        } else if let node = getNodeAtIndex(index - 1) {
            self.size -= 1
            print("size after add = \(size)")
            node.next = node.next?.next
        }
    }
}

//var linkListObj = LinkedList()
//linkListObj.addAtHead(val: 2)
//linkListObj.addAtHead(val: 3)
//linkListObj.addAtHead(val: 4)
//linkListObj.addAtHead(val: 5)
//linkListObj.addAtHead(val: 6)
//print(linkListObj.getNodeAtIndex(4)?.value)
//print(linkListObj.get(4))
//print(linkListObj.head?.value)
//["MyLinkedList","addAtHead","deleteAtIndex","addAtHead","addAtHead","addAtHead","addAtHead","addAtHead","addAtTail","get","deleteAtIndex","deleteAtIndex"]


var newObj = MyLinkedListTwo()
newObj.addAtHead(1)
newObj.addAtTail(3)
newObj.addAtIndex(1, 2)
newObj.get(1)
newObj.deleteAtIndex(1)
newObj.get(1)


class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ x: Int) {
        self.val = x
        self.next = nil
    }
}

class MyLinkedList {
    private var size: Int
    private var head: ListNode
    
    init() {
        self.size = 0
        self.head = ListNode(0)
    }
    
    func get(_ index: Int) -> Int {
        if index < 0 || index >= self.size {
            return -1
        }
        var curr = self.head
        for i in 0...(index) {
            print("index = \(i)")
            print("current Head = \(curr.val)")
            curr = curr.next!
        }
        return curr.val
    }
    
    func addAtHead(_ val: Int) {
        self.addAtIndex(0, val)
    }
    
    func addAtTail(_ val: Int) {
        self.addAtIndex(self.size, val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        print(index)
        print(size)
        if index > self.size {
            return
        }
        var index = index
        if index < 0 {
            index = 0
        }
        self.size += 1
        var pred = self.head
        for _ in 0..<index {
            pred = pred.next!
        }
        let toAdd = ListNode(val)
        toAdd.next = pred.next
        pred.next = toAdd
    }
        
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index >= self.size {
            return
        }
        self.size -= 1
        var pred = self.head
        for _ in 0..<index {
            pred = pred.next!
        }
        pred.next = pred.next?.next
    }
}

