import UIKit

//https://leetcode.com/problems/binary-tree-inorder-traversal/description/

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

func inorderTraversalRecursion(_ root: TreeNode?) -> [Int] {
    var array = [Int]()
    func inOrder(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        inOrder(root.left)
        array.append(root.val)
        inOrder(root.right)
    }
    inOrder(root)
    return array
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var array = [Int]()
    var stack = [TreeNode?]()
    var curr = root
    
    while curr != nil || !stack.isEmpty {
        while curr != nil {
            stack.append(curr)
            curr = curr?.left
        }
        curr = stack.removeLast()
        if let val = curr?.val {
            array.append(val)
        }
        curr = curr?.right
    }
    return array
}
var treeObj = TreeNode(1, TreeNode(), TreeNode(2, TreeNode(3, nil, nil), TreeNode()))
print(inorderTraversal(treeObj))
print(inorderTraversalRecursion(treeObj))
