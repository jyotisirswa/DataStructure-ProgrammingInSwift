
//https://leetcode.com/problems/rotate-list/description/

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

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil {
        return nil
    }
    var lastElement = head
    var length = 1
    
    //get the length of the list and the last node in the list
    while lastElement?.next != nil {
        lastElement = lastElement?.next
        length = length + 1
    }
    
    /* If k is equal to the length of the list then k == 0
     ElIf k is greater than the length of the list then index = k % length */
    var index = k % length
    
    /* Set the last node to point to head node
     The list is now a circular linked list with last node pointing to first node */
    lastElement?.next = head
    var tempNode = head
    
    
    /* Traverse the list to get to the node just before the ( length - k )th node.
     Example: In 1->2->3->4->5, and k = 2
     we need to get to the Node(3) */
    for i in 0..<(length - index - 1) {
        tempNode = tempNode?.next
    }
    /* Get the next node from the tempNode and then set the tempNode.next as None
     Example: In 1->2->3->4->5, and k = 2
     tempNode = Node(3)
     answer = Node(3).next => Node(4)
     Node(3).next = None ( cut the linked list from here ) */
    var answer = tempNode?.next
    tempNode?.next = nil
    return answer
}


let ll = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, nil)))))))
let rotatedList =  rotateRight(ll, 2)
print("Rotated List = \(rotatedList)")
