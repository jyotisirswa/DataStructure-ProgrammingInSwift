import UIKit

//https://leetcode.com/problems/binary-tree-postorder-traversal/description/

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

func postorderTraversal(_ root: TreeNode?) -> [Int] {
     var array = [Int]()
        func postorder(_ root: TreeNode?) {
             guard let root = root else {
                 return
             }
             postorder(root.left)
             postorder(root.right)
             array.append(root.val)
        }
    postorder(root)
    return array
}

/// Iterative
/// Try to use a stack to simulate the call stacks of the recursive solution above.
func postorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
  if root == nil {
    return []
  }

  var stack: [TreeNode] = []
  // Keep traversed result nodes, not just values.
  var result: [TreeNode] = []

  var current = root
  stack.append(current!)
  while !stack.isEmpty {
    // since the left branch is called firstly in the recursive way, push them all
    // Ignore the left node, if the node is already traversed.
    while let left = current?.left, !result.contains { $0 === left } {
      stack.append(left)
      current = left
    }
    // needs to push the right branch
    // if there's a right node and the right node is not the last one just added into the result
    // why check the right node with the last result node, this is because if the last node in the
    // result is just pushed, the right node is just traversed, no need to traverse again.
    if let right = current?.right, right !== result.last {
      stack.append(right)
      current = right
    } else {
      // both left and right (either is nil or just traversed) are traversed, now it's good to add
      // the root to the result
      let last = stack.popLast()
      result.append(last!)
      // then move the current pointer to the last node
      current = stack.last
    }
  }
  return result.map { $0.val }
}

var treeObj = TreeNode(1, TreeNode(), TreeNode(2, TreeNode(3, nil, nil), TreeNode()))
print(postorderTraversal(treeObj))
print(postorderTraversal_iterative(treeObj))
