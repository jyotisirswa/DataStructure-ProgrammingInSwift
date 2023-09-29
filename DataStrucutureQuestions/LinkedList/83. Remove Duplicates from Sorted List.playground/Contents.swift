import UIKit

var greeting = "Hello, playground"

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


func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var current = head

    while current != nil && current?.next != nil {
        if current?.val == current?.next?.val {
            current?.next = current?.next?.next
        }
        else {
            current = current?.next

        }
    }
    print(head)
    return head
}

let ll = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(4, ListNode(4, nil)))))))
deleteDuplicates(ll)



