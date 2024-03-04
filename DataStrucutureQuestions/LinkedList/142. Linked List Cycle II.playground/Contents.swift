import UIKit

//https://leetcode.com/problems/linked-list-cycle-ii/description/
// - Complexity:
// - time: O(n), where n is the number of nodes in the linked list.
// - space: O(1), only constant space is used.

//MARK: - Approach :- slow moves 1 step at a time, fast moves 2 steps at a time. when slow and fast meet each other, they must be on the cycle & then start fast from head again until they both doesn't meet when they meet for first time thats where cycle starts
func detectCycle(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head
    while (fast != nil && fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast  {
            fast = head
            while slow !== fast {
                fast = fast?.next
                slow = slow?.next
            }
            return slow
        }
    }
    return nil
}

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

extension ListNode : CustomStringConvertible {
    public var description: String {
        guard let node = next else {
            return "\(val)"
        }
        return "\(val)" + "->" + String(describing: next) + " "
    }
}

//var node = ListNode(2, ListNode(0, ListNode(-4, ListNode(5, nil))))
//node.next = node
//let ll = ListNode(3, node)
//let l2   = ListNode(1, nil)
//let isCycle = detectCycle(ll)
//print(isCycle)

var hA = ListNode(1)
let nodeOne = ListNode(2)
let nodeTwo = ListNode(3)
let nodeThree = ListNode(4)
hA.next? = nodeOne
nodeOne.next = nodeTwo
nodeTwo.next = nodeThree
nodeThree.next = nodeTwo
detectCycle(hA)
if let hasCycleNode = detectCycle(hA) {
    print("abc")
    print(hasCycleNode)
}
