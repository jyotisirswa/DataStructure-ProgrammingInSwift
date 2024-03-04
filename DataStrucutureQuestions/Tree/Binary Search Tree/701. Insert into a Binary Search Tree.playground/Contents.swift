
//https://leetcode.com/problems/insert-into-a-binary-search-tree/description/

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

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
     guard let root = root else {
         return TreeNode(val)
     }
     if val < root.val {
         root.left = insertIntoBST(root.left,  val)
     } else {
         root.right = insertIntoBST(root.right,  val)
     }
     return root
}
//[4,2,7,1,3]
var treeObj = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7))
print(insertIntoBST(treeObj, 5)?.val)
