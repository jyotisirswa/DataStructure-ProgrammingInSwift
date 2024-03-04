import UIKit

//https://leetcode.com/problems/maximum-depth-of-binary-tree/description/

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

func maxDepthBottomUp(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
     var leftDepth = maxDepthBottomUp(root.left)
     var rightDepth = maxDepthBottomUp(root.right)
     return max(leftDepth, rightDepth) + 1
}

var ans = 0
func maxDepthTopDown(_ root: TreeNode?) -> Int {
   func maxDepth(_ root: TreeNode?, depth : Int) {
       guard let root = root else {
        return
        }
        if root.left == nil && root.right == nil {
            ans = max(ans, depth)
        }
        maxDepth(root.left, depth: depth + 1)
        maxDepth(root.right, depth: depth + 1)
   }
   maxDepth(root, depth: 1)
   return ans
}

var treeObj = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(maxDepthTopDown(treeObj))
print(maxDepthBottomUp(treeObj))
