//https://leetcode.com/problems/merge-two-sorted-lists/description/

class ListNode  {
    var value : Int
    var next : ListNode?
    var prev : ListNode?
    
    init(value: Int, next: ListNode? = nil, prev: ListNode? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension ListNode : CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return  "\(value)"
        }
        return  "\(value) ->" + String(describing : next) + " "
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil {
        print("loop exit")
        return l1 == nil ? l2 : l1
    }
    print("loop entry")
    if l1!.value <= l2!.value {
        l1?.next = mergeTwoLists(l1?.next, l2)
        print("l1 = \(l1)")
        return l1
    } else {
        l2?.next = mergeTwoLists(l1, l2?.next)
        print("l2 = \(l2)")
        return l2
    }
}

//Approach 2
func mergeTwoListsApproachTwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let prehead = ListNode(value: -1)
    var prev = prehead
    var l1 = l1
    var l2 = l2
    while l1 != nil && l2 != nil {
        if l1!.value <= l2!.value {
            prev.next = l1
            l1 = l1?.next
        } else {
            prev.next = l2
            l2 = l2?.next
        }
        prev = prev.next!
    }
    prev.next = l1 == nil ? l2 : l1
    return prehead.next
}

var list1 = ListNode(value: 1, next: ListNode(value: 2, next: ListNode(value: 4)))
var list2 = ListNode(value: 1, next: ListNode(value: 3, next: ListNode(value: 4)))
print("approach 1 = \(mergeTwoLists(list1, list2))")
print("approach 2 = \(mergeTwoListsApproachTwo(list1, list2))")



