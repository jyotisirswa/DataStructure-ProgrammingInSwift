import UIKit

//https://leetcode.com/problems/symmetric-tree/description/

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

func isSymmetric(_ root: TreeNode?) -> Bool {
    func isSymmetricRecursive(left : TreeNode?, right : TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        else if left == nil || right == nil {
            return false
        }
        return (left?.val == right?.val) && isSymmetricRecursive(left: left?.left, right: right?.right) && isSymmetricRecursive(left: left?.right, right: right?.left)
    }
    return isSymmetricRecursive(left: root?.left, right: root?.right)
}

var treeObj = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
print(isSymmetric(treeObj))
