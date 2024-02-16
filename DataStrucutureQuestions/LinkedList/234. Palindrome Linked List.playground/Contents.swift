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

func isPalindrome(_ head: ListNode?) -> Bool {
    var reverseListObj = ListNode(0)
    reverseListObj.next = head
    let reverseListObjNew = reverseList(head: reverseListObj.next)
    print(reverseListObjNew)
    var currHead = head
    print(head)
    while currHead != nil {
        print("current head = \(currHead?.val)")
        currHead = currHead?.next
    }
//    while currHead != nil {
//        if currHead?.val != reverseList?.val {
//            print("condition exit")
//            return false
//        }
//        currHead = currHead?.next
//        reverseList = reverseList?.next
//    }
    return true
}

func reverseList(head : ListNode?) -> ListNode? {
    var prev : ListNode? = nil
    var currHead = head
    
    while currHead != nil {
        let nextNode = currHead?.next
        currHead?.next = prev
        prev = currHead
        currHead = nextNode
    }
    return prev
}
let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, nil)))))))
let l2 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil)))))))
let l3 = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
print(isPalindrome(l3))
