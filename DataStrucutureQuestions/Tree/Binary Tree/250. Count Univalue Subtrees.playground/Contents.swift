import UIKit

//https://leetcode.com/problems/count-univalue-subtrees/description/

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

func countUnivalSubtrees(_ root: TreeNode?) -> Int {
    
    func countUnivalSubtrees(_ root: TreeNode?, count : Int) -> Int {
        var count = count
        guard let root = root else {
            return 0
        }
        if root.left == nil && root.right == nil {
            return count
        }
        print("assas")
        if let nodeLeft =  root.left, root.right == nil  {
            count += nodeLeft.val == root.val ? 2 : 0
        }
        else if let nodeRight =  root.right, root.left == nil  {
            count += nodeRight.val == root.val ? 2 : 0
        } else {
            if root.left?.val == root.right?.val {
                count += 1
            }
            else if root.left?.val == root.right?.val && root.left?.val  == root.val {
                count += 3
            }
        }
        return countUnivalSubtrees(root.left, count: count) +  countUnivalSubtrees(root.right, count: count)
    }
    return countUnivalSubtrees(root, count: 0)
}

func countUnivalSubtreesApproachTwo(_ root: TreeNode?) -> Int {
    func dfs(_ node: TreeNode?) -> (Bool, Int) {
        guard let node = node else {
            return (true, 0)
        }
        let left = dfs(node.left)
        let right = dfs(node.right)
        let isLeftUniValue = left.0
        let isRightUniValue = right.0
        var count = left.1 + right.1
        
        if isLeftUniValue && isRightUniValue {
            if let leftNode = node.left, node.val != leftNode.val {
                return (false, count)
            }
            if let rightNode = node.right, node.val != rightNode.val {
                return (false, count)
            }
            return (true, count + 1)
        }
        
        return (false, count)
    }
    return dfs(root).1
}

var treeObj = TreeNode(5, TreeNode(1, TreeNode(5), TreeNode(5)), TreeNode(5, nil, TreeNode(5)))
print(countUnivalSubtreesApproachTwo(treeObj))
