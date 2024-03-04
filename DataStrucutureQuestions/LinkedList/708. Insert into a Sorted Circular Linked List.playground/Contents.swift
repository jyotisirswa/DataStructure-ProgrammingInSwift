//https://leetcode.com/problems/insert-into-a-sorted-circular-linked-list/description/

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

func insert(_ head: ListNode?, _ insertVal: Int) -> ListNode? {
     if head == nil {
         let node = ListNode(value: insertVal)
         node.next = node
         return node
     }
     var prev = head
     var next = head?.next
     var isInsert = false
     while true {
         print("next = \(next?.value)")
         print("prev = \(prev?.value)")
         if insertVal <= (next?.value ?? 0) && insertVal >= (prev?.value ?? 0) {
            isInsert = true
         } else if (prev?.value ?? 0) > (next?.value ?? 0) {
             if insertVal >= (prev?.value ?? 0) || insertVal <= (next?.value ?? 0)  {
                 isInsert = true
             }
         }
         if isInsert == true {
             let nodeObj = ListNode(value: insertVal, next: next)
             prev?.next = nodeObj
             return head
         }
         prev = next
         next = next?.next
         if prev === head {
             break
         }
    }
    let nodeObj = ListNode(value: insertVal, next: next)
    prev?.next = nodeObj
    print(head)
    return head
}
let node = ListNode(value: 3)
node.next = ListNode(value: 4)
node.next?.next = ListNode(value: 1)
node.next?.next?.next = node
print(insert(node, 2))
