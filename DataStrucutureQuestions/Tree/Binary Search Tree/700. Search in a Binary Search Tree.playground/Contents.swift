import UIKit

//https://leetcode.com/problems/search-in-a-binary-search-tree/description/

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

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
     var currentNode = root
     while currentNode != nil {
         let currentValue = currentNode?.val ?? Int.min
         if currentValue  == val {
             return currentNode
         }
         else if currentValue > val {
             currentNode = currentNode?.left
         } else {
             currentNode = currentNode?.right
         }
     }
    return nil
}

var treeObj = TreeNode(2, TreeNode(1), TreeNode(3))
print(searchBST(treeObj, 4)?.val)


