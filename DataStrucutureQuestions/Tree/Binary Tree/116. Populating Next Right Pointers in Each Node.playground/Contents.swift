import UIKit

//https://leetcode.com/problems/populating-next-right-pointers-in-each-node/description/
//https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/description/

//Definition for a Node.
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
          self.next = nil
      }
 }

//Input: root = [1,2,3,4,5,6,7] Output: [1,#,2,3,#,4,5,6,7,#]
func connect(_ root: Node?) -> Node? {
    guard let root = root else {
        return nil
    }
    var queue = [root]
    while !queue.isEmpty {
        let count =  queue.count
        print(queue)
        for index in 0..<queue.count {
            let node = queue.removeFirst()
            if index < count - 1 {
                node.next = queue.first
            }
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    print("root = \(root)")
    return root
}

func connectApproachTwo(_ root: Node?) -> Node? {
    guard let root = root else {
        return root
    }
    
    var leftmost = root
    
    while let left = leftmost.left {
        var head: Node? = leftmost
        
        while let currentHead = head {
            currentHead.left?.next = currentHead.right
            
            if let nextHead = currentHead.next {
                currentHead.right?.next = nextHead.left
            }
            
            head = currentHead.next
        }
        
        leftmost = left
    }
    return root
}

func processChild(_ childNode: Node?, _ prev: Node?, _ leftmost: Node?) -> (Node?, Node?) {
    var prev = prev
    var leftmost = leftmost
    
    if let childNode = childNode {
        if let prev = prev {
            prev.next = childNode
        } else {
            leftmost = childNode
        }
        prev = childNode
    }
    
    return (prev, leftmost)
}

func connectNextNode(_ root: Node?) -> Node? {
    guard let root = root else {
        return root
    }
    
    var leftmost : Node? = root
    
    while let currentLeftmost = leftmost {
        var prev: Node? = nil
        var curr: Node? = currentLeftmost
        leftmost = nil
        
        while let current = curr {
            let result1 = processChild(current.left, prev, leftmost)
            prev = result1.0
            leftmost = result1.1
            
            let result2 = processChild(current.right, prev, leftmost)
            prev = result2.0
            leftmost = result2.1
            
            curr = current.next
        }
    }
    return root
}

var root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.left = Node(6)
root.right?.right = Node(7)
print(connect(root))
