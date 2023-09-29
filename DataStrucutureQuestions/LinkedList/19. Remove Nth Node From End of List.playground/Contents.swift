import UIKit


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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var dummyNode = ListNode(0, head)
    var left = dummyNode
    var right = head
    var index = n
    // advance right to nth position
    while index > 0 {
        right = right?.next
        index -= 1
    }
    /* then advance both right and left now they are nth postions apart
    # when right gets to nil, left will be just before the item to be deleted */
    while right != nil {
        right = right?.next
        left = left.next!
    }
    // delete the node
    left.next = left.next?.next

    return dummyNode.next
}

let ll = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(6, ListNode(4, ListNode(5, nil)))))))
removeNthFromEnd(ll, 2)
print(ll)
