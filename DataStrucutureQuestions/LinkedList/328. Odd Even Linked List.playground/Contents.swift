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

/*LOGIC : START WITH BASIC EVEN AND ODD POSITIONS, FOR NEXT ODD APPEND EVENS NEXT AND FOR NEXT EVEN APPEND ODDS NEXT */
func oddEvenList(_ head: ListNode?) -> ListNode? {
    var odd = head
    var even = head?.next
    var evenHead = even
    
    while even != nil && even?.next != nil {
        odd?.next = odd?.next?.next
        odd = odd?.next
        
        even?.next = even?.next?.next
        even = even?.next
    }
    
    odd?.next = evenHead
    
    return head
}

let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, nil)))))))
oddEvenList(ll)
print(ll)

