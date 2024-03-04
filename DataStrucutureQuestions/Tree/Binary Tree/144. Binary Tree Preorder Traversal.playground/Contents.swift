import UIKit

//https://leetcode.com/problems/binary-tree-preorder-traversal/description/

//Definition for a binary tree node.
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
 
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var array = [Int]()
    var stack = [TreeNode]()
    if let root = root {
        stack.append(root)
    }
    while !stack.isEmpty {
        let node = stack.popLast()
        array.append(node?.val ?? 0)
        if let right = node?.right  {
            stack.append(right)
        }
        if let left =  node?.left {
            stack.append(left)
        }
    }
    return array
}

func preorderTraversalRecusrion(_ root: TreeNode?) -> [Int] {
    var array = [Int]()
    func preOrder(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        array.append(node.val)
        preOrder(root?.left)
        preOrder(root?.right)
    }
    preOrder(root)
    return array
}

var treeObj = TreeNode(1, TreeNode(), TreeNode(2, TreeNode(3, nil, nil), TreeNode()))
print(preorderTraversal(treeObj))
print(preorderTraversalRecusrion(treeObj))

