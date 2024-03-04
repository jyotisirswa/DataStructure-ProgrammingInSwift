import UIKit

//https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/description/

class TreeNode {
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

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    var idxMap = [Int: Int]()
    var inorder = inorder
    var postorder = postorder
    for (idx, val) in inorder.enumerated() {
        idxMap[val] = idx
    }
    func helper(_ inLeft: Int, _ inRight: Int) -> TreeNode? {
        if inLeft > inRight {
            return nil
        }
        let val = postorder.removeLast()
        let root = TreeNode(val)
        
        if let index = idxMap[val] {
            root.right = helper(index + 1, inRight)
            root.left = helper(inLeft, index - 1)
        }
        return root
    }
    return helper(0, inorder.count - 1)
}
