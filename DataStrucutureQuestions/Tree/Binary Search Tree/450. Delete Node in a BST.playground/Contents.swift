import UIKit

//https://leetcode.com/problems/delete-node-in-a-bst/description/

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

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val > key {
        root.left = deleteNode(root.left, key)
    } else if root.val < key {
        root.right = deleteNode(root.right, key)
    } else {
        if root.right == nil {
            return root.left
        } else if root.left == nil {
            return root.right
        } else {
            var newRight = root.left
            while let right = newRight?.right {
                newRight = right
            }
            newRight?.right = root.right
            return root.left
        }
    }
    return root
}
