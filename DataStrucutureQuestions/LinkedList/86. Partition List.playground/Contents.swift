import UIKit

//TIME COMPLEXITY : O(N) SPACE COMPLEXITY : O(1)
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

extension ListNode : CustomStringConvertible {

    public var description: String {
        guard let next = next else {
            return  "\(String(describing: val))"
        }
        return  "\(String(describing: val)) -> " + String(describing : next) + " "
    }
}

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let left = ListNode(), right = ListNode()
    var lTail = left, rTail = right
    var current = head
    while current != nil {
        if current!.val! < x {
            lTail.next = current
            lTail = current!
        }
        else {
            rTail.next = current
            rTail = current!
        }
        current = current!.next
    }
    lTail.next = right.next
    rTail.next = nil
    return left.next //because left is pointing to empty node
}

let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(2, ListNode(7, nil)))))))
partition(ll, 3)
print("Linked list after partition:- \(ll)")
