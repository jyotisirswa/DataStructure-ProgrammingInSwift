import UIKit

//https://leetcode.com/problems/reverse-linked-list/description/

public class ListNode {
    public var val : Int
    public var next : ListNode?
    
    public init() {
        self.val = 0; self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val; self.next = nil;
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val; self.next = next;
    }
}

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
//extension Node: CustomStringConvertible {
//    public var description: String {
//        guard let next = next else {
//            return "\(value)"
//        }
//        return "\(value) -> " + String(describing: next) + " "
//    }
//}

extension ListNode : CustomStringConvertible {
    public var description: String {
        guard let node = next else {
            return "\(val)"
        }
        return "\(val)" + "->" + String(describing: next) + " "
    }
}

func reverseList<Value>(_ head: Node<Value>?) -> Node<Value>? {
    if head == nil || head?.next == nil {
        return head
    }
    let p = reverseList(head?.next)
    head?.next?.next = head
    head?.next = nil
    return p
}

var nodeOne = Node(value: 1)
let nodeTwo = Node(value: 2)
let nodeThree = Node(value: 3)
let nodeFour = Node(value: 4)
let nodeFive = Node(value: 5)
nodeOne.next = nodeOne
nodeOne.next = nodeTwo
nodeTwo.next = nodeThree
nodeThree.next = nodeFour
nodeFour.next = nodeFive
print(reverseList(nodeOne))
