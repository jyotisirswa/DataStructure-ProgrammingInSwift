import UIKit

//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/

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

var ans: TreeNode?

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    func recurseTree(_ currentNode: TreeNode?) -> Bool {
        //If reached the end of a branch, return False.
        guard let currentNode = currentNode else {
            return false
        }
        //Left Recursion
        let left = recurseTree(currentNode.left)
        //Right Recursion
        let right = recurseTree(currentNode.right)
        
        //If the current node is one of p or q
        let mid = currentNode === p || currentNode === q
        
        //If any two of the three flags left, right or mid become True.
        if (mid ? 1 : 0) + (left ? 1 : 0) + (right ? 1 : 0) >= 2 {
            ans = currentNode
        }
        //Return True if either of the three bool values is True.
        return mid || left || right
    }
    //Traverse the tree
    recurseTree(root)
    return ans
}
