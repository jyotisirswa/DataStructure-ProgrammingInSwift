import UIKit

var greeting = "Hello, playground"


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
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
            return  "\(val)"
        }
        return  "\(val) -> " + String(describing : next) + " "
    }
}

class Solution {
    
    //Method one :-
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummy = ListNode(0, head) // set up a dummy node to avoid edge cases (left = 0)
        var leftPrev = dummy
        var cur = head


        // 1. iterative until reaching the left
        for _ in 0..<left - 1 {
            leftPrev = cur!
            cur = cur?.next
        }
        

        // 2. reverse part: from left -> right similarly like problem 206
        var prev: ListNode? = nil // set up a prev node
        for _ in 0..<right - left + 1 {
            let tmpNext = cur?.next
            cur?.next = prev
            prev = cur
            cur = tmpNext
        }
        
        // 3. connect linked list
        // e.g. original linked list 1->2->3->4->5, after part 1 and part 2,
        // leftPrev = 1, cur = 5, prev = 4, so leftPrev.next(2).next should be 5, that is cur
        // leftPrev(1).next should be 4, that is prev
        leftPrev.next?.next = cur
        leftPrev.next = prev
        return dummy.next
    }
    
    //Method Two :-
    func reverseBetweenTwo(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left == right {
            return head
        }
        var dummy = ListNode(0, head)
        var prev : ListNode? = dummy
        
        for _ in 0..<left - 1 {
            prev = prev?.next
        }
        var tail = prev?.next
        
        for _ in 0..<(right - left) {
            let temp = prev?.next
            prev?.next = tail?.next
            tail?.next = tail?.next?.next
            prev?.next?.next = temp
        }
        
        print("Prev after for loop")
        return dummy.next
    }

}


let sol = Solution()
let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
let reversedListOne = sol.reverseBetweenTwo(ll, 2, 4) // reverseBetween(ll, 2, 4)!
let reversedListTwo = sol.reverseBetweenTwo(ll, 2, 4)
print("Node:- \(String(describing: reversedListOne ?? nil))")
print("Node:- \(String(describing: reversedListTwo ?? nil))")



