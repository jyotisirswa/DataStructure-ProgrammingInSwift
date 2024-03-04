import UIKit

//https://leetcode.com/problems/path-sum/description/

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

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else {
                return false
    }
    var stack = [(root, targetSum - root.val)]
    while !stack.isEmpty {
        let (nodeObj, currSum) = stack.removeLast()
        if nodeObj.left == nil && nodeObj.right == nil && currSum == 0 {
            return true
        }
        if let nodeLeft = nodeObj.left {
            stack.append((nodeLeft, (currSum - nodeLeft.val )))
        }
        if let nodeRight = nodeObj.right{
            stack.append((nodeRight, (currSum - nodeRight.val)))
        }
    }
    return false
}

var treeObj = TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2)), nil), TreeNode(8, TreeNode(13), TreeNode(4, nil, TreeNode(1))))
print(hasPathSum(treeObj, 22))
