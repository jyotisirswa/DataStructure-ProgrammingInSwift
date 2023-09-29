import UIKit

//Time: O(1)
//Space: O(1)
// * Definition for singly-linked list.

public class ListNode {
    public var val : Int?
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

/*
 We delete the node by "replacing" the node with node.next.
 node.val change to node.next.val
 node.next change to node.next.next
 */
extension ListNode : CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return  "\(String(describing: val))"
        }
        return  "\(String(describing: val)) -> " + String(describing : next) + " "
    }
}

func deleteNode(_ node: ListNode?) {
    node?.val = node?.next?.val ?? nil
    node?.next = node?.next?.next
}

var hA = ListNode(4)
hA.next = ListNode(1)
let node8 = ListNode(8)
let node5 = ListNode(5)
hA.next?.next = node8
hA.next?.next?.next = node5
deleteNode(node5)
print(hA)
