import UIKit

//https://leetcode.com/problems/binary-tree-level-order-traversal/description/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue = [TreeNode?]()
    var answer = [[Int]]()
    if root?.val == nil {
        return answer
    }
    queue.append(root)
    while !queue.isEmpty {
        print(queue)
        var arrayTemp = [Int]()
        var countObj =  queue.count
        for _ in 0..<countObj {
            let node = queue.removeFirst()
            arrayTemp.append(node?.val ?? 0)
            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
        }
        answer.append(arrayTemp)
    }
    return answer
}

var treeObj = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
var treeObj2 = TreeNode()
print(levelOrder(treeObj2))

