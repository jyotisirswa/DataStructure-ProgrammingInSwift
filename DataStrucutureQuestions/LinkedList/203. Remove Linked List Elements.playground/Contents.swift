import Foundation

//https://leetcode.com/problems/remove-linked-list-elements/description/

public class ListNode {
    public var value : Int
    public var next : ListNode?
    
    public init() {
        self.value = 0; self.next = nil;
    }
    public init(value: Int) {
        self.value = value; self.next = nil;
    }
    public init(value: Int, _ next: ListNode?) {
        self.value = value; self.next = next;
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var sentinel = ListNode(value: 0)
    sentinel.next = head
    var prev = sentinel, curHead = head
    while curHead != nil {
        if curHead?.value == val {
            prev.next = curHead?.next
        } else {
            prev = curHead ?? ListNode(value: 0)
        }
        curHead = curHead?.next
    }
    return sentinel.next
}

var nodeOne = ListNode(value: 1)
let nodeTwo = ListNode(value: 2)
let nodeThree = ListNode(value: 3)
let nodeFour = ListNode(value: 4)
let nodeFive = ListNode(value: 5)
nodeOne.next = nodeTwo
nodeTwo.next = nodeThree
nodeThree.next = nodeFour
nodeFour.next = nodeFive
nodeFive.next = nodeThree
nodeFive.next?.next = nodeThree
print(nodeOne)
print(removeElements(nodeOne, 3))
