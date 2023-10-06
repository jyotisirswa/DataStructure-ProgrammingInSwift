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

extension BinaryNode {
    public func  traverseInOrder(visit : (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    public func  traversePreOrder(visit : (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    public func  traversePostOrder(visit : (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
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

extension BinarySearchTree {
    
    public mutating func insert(_ value : Element) {
        root =  insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        // 1
        guard let node = node else {
            return BinaryNode(value: value)
        }
        // 2
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        // 3
        return node
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

extension BinarySearchTree where Element : Hashable {
    public func contains(_ subtree: BinarySearchTree) -> Bool {
        var set : Set<Element> = []
        var isEqual = true
        root?.traverseInOrder(visit: { valueObj in
            set.insert(valueObj)
        })
        subtree.root?.traverseInOrder(visit: { valueObj in
            isEqual = isEqual && set.contains(valueObj)
        })
        return isEqual
    }
}

var bstOne = BinarySearchTree<Int>()
for i in 0..<5 {
    bstOne.insert(i)
}
print("Binary Tree 1 :\n\(bstOne)")
var bstTwo = BinarySearchTree<Int>()
bstTwo.insert(3)
bstTwo.insert(1)
bstTwo.insert(0)
bstTwo.insert(4)
bstTwo.insert(2)
bstTwo.insert(5)
print("Binary Tree 2 :\n\(bstTwo)")
print(bstTwo.contains(bstOne))
