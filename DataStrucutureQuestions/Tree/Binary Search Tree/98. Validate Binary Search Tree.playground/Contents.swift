
//https://leetcode.com/problems/validate-binary-search-tree/description/

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

func isValidBST(_ root: TreeNode?) -> Bool {
    return isValidBSTCheck(node : root, lowerBound: Int.min, upperBound: Int.max)
}

func isValidBSTCheck(node: TreeNode?, lowerBound : Int, upperBound : Int) -> Bool {
    guard let node = node else {
        return true
    }
    guard node.val < upperBound && node.val > lowerBound else {
        return false
    }
    return isValidBSTCheck(node: node.left, lowerBound: lowerBound, upperBound: node.val) && isValidBSTCheck(node: node.right, lowerBound: node.val, upperBound: upperBound)
}
var treeObj = TreeNode(2, TreeNode(1), TreeNode(3))
var treeObjTwo = TreeNode(5, TreeNode(4), TreeNode(6, TreeNode(3), TreeNode(7)))
print(isValidBST(treeObj))
print(isValidBST(treeObjTwo))



