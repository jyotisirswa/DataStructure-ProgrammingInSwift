//https://leetcode.com/problems/add-two-numbers/description/
//$$O(max(m,n))$$ Assume that m and n represents the length of l1 and l2 respectively, the algorithm above iterates at most max⁡(m,n) times.
//Space complexity: $$O(1)$$. The length of the new list is at most $$max⁡(m,n)+1$$ However, we don't count the answer as part of the space complexity.
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

var digit = 0
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil && digit == 0 {
        return nil
    }
    let sum = (l1?.value ?? 0) + (l2?.value ?? 0) + digit
    digit = sum/10
    return ListNode(value: sum % 10, next: addTwoNumbers(l1?.next, l2?.next))
}

func addTwoNumbersApproachTwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var dummyNode = ListNode(value: 0)
    var curr = dummyNode
    var carry = 0
    var l1 = l1
    var l2 = l2
    while l1 != nil || l2 != nil || carry != 0 {
        var sum = (l1?.value ?? 0) + (l2?.value ?? 0) + carry
        carry = sum/10
        let newNode = ListNode(value: sum%10)
        curr.next = newNode
        curr = newNode
        l1 = l1?.next
        l2 = l2?.next
    }
    return dummyNode.next
}

let ll = ListNode(value:2, next: ListNode(value:4, next: ListNode(value:3, next: nil)))
let l2 = ListNode(value:5, next: ListNode(value:6, next: ListNode(value:4, next: nil)))
print(addTwoNumbers(ll, l2))
print(addTwoNumbersApproachTwo(ll, l2))

