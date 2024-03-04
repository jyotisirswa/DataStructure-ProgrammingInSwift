import UIKit

//Maintain two pointers pointer 1 and pointer 2 initialized at the head of A and B, respectively. Then let them both traverse through the lists, one node at a time.
//When pointer 1 reaches the end of a list, then redirect it to the head of B (yes, B, that's right.); similarly when pointer 2 reaches the end of a list, redirect it the head of A.
//If at any point pointer 1 meets pointer 2, then pointer 1/pointer 2 is the intersection node.
//https://leetcode.com/problems/intersection-of-two-linked-lists/solution/
//Time complexity : O(m+n).
//Spointer 1ce: O(1)


// * Definition for singly-linked list.
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

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    
    var a: ListNode? = headA
    var b: ListNode? = headB
    
    while a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
    }
    return a;
}

var hA = ListNode(4)
hA.next = ListNode(1)
let node8 = ListNode(8)
let node4 = ListNode(4)
let node5 = ListNode(5)
hA.next?.next = node8
hA.next?.next?.next = node4
hA.next?.next?.next?.next = node5

var hB = ListNode(5)
hB.next = ListNode(6)
hB.next?.next = ListNode(1)
hB.next?.next?.next = node8
hB.next?.next?.next?.next = node4
hB.next?.next?.next?.next?.next = node5

let intersectPoint = getIntersectionNode(hA, hB)

if let node = intersectPoint  {
    print("Intersect point is \(node.val)")
}
