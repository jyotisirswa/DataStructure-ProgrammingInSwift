import UIKit

// - Complexity:
//   - time: O(n), where n is the number of nodes in the tree.
//   - space: O(1)

//generic node to be used with binary search trees (BST’s)
public class BinaryNode<Element>{
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
    public init(value : Element) {
        self.value = value
    }
    
    func height<T>(of node: BinaryNode<T>?) -> Int {
        guard let node = node else {
            return -1
        }
        var lefth = height(of: node.leftChild)
        var righth = height(of: node.rightChild)
        if (lefth > righth) {
            return lefth + 1;
        } else {
            return righth + 1;
        }
        // return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
    }
}


extension BinaryNode : CustomStringConvertible {
    public var description : String {
       return diagram(for: self)
    }
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil  {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.leftChild,
                  bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

/*
 A binary search tree, or BST, is a data structure that facilitates fast lookup, addition
 and removal operations. Each operation has an average time complexity of O(log n),
 which is considerably faster than linear data structures such as arrays and linked lists. A
 binary search tree achieves this performance by imposing two rules on the binary tree:
 • The value of a left child must be less than the value of its parent.
 • The value of a right child must be greater than or equal to the value of its parent.
*/

public struct BinarySearchTree<Element : Comparable> {
    public private(set) var root : BinaryNode<Element>?
    public init() {}
}

extension BinarySearchTree : CustomStringConvertible {
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}

extension BinaryNode where Element: Comparable {
    var isBinarySearchTree: Bool {
        return isBST(self, min: nil, max: nil)
    }
    private func isBST(_ tree: BinaryNode<Element>?,
                       min: Element?,
                       max: Element?) -> Bool {
        guard let tree = tree else {
            return true
        }
        if let min = min, tree.value <= min {
            return false
        } else if let max = max, tree.value > max {
            return false
        }
        return isBST(tree.leftChild, min: min, max: tree.value) &&
        isBST(tree.rightChild, min: tree.value, max: max)
    }
}

var treeObj : BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    let ten = BinaryNode(value: 10)
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    five.leftChild = ten
    seven.rightChild = nine
    nine.leftChild = eight
    return seven
}()

var treeObjTwo : BinaryNode<Int> = {
    let three = BinaryNode(value: 3)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let four = BinaryNode(value: 4)
    let two = BinaryNode(value: 2)
    let nine = BinaryNode(value: 9)
    let ten = BinaryNode(value: 10)
    three.leftChild = one
    three.rightChild = four
    four.rightChild = five
    one.rightChild = two
    return three
}()

print("Tree one = \n\(treeObj)")
print("Tree one is binary search tree = \(treeObj.isBinarySearchTree)")
print("Tree Two = \n\(treeObjTwo)")
print("Tree two is binary seach tree = \(treeObjTwo.isBinarySearchTree)")


