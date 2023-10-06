import UIKit

//MARK: - Key points :- Binary Search Tree, Insert item in binary tree, learn about balance factor & balance tree, doing left, right , rightLeft, leftRight rotation to balance a tree
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
    
    public var height = 0
    public var balanceFactor : Int {
        return leftHeight - rightHeight
    }
    
    public var leftHeight : Int {
        return leftChild?.height ?? -1
    }
    
    public var rightHeight : Int {
        return rightChild?.height ?? -1
    }
    
//    func height<T>(of node: BinaryNode<T>?) -> Int {
//        guard let node = node else {
//            return -1
//        }
//        var lefth = height(of: node.leftChild)
//        var righth = height(of: node.rightChild)
//        if (lefth > righth) {
//            return lefth + 1;
//        } else {
//            return righth + 1;
//        }
//        // return 1 + max(height(of: node.leftChild), height(of: node.rightChild))
//    }
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
    
    private func insert(from node: BinaryNode<Element>?, value: Element) ->
    BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight,
                                  balancedNode.rightHeight) + 1
        return balancedNode
    }
    
    private func balanced(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
            return node
        }
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element)
    -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            // 1
            if node.leftChild == nil && node.rightChild == nil {
             return nil
            }
            // 2
            if node.leftChild == nil {
             return node.rightChild
            }
            // 3
            if node.rightChild == nil {
             return node.leftChild
            }
            // 4
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight)
        return balancedNode
    }
    
    //When children of right tree causes imbalance
    private func leftRotate(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
     //print("---Doing left Rotation---")
     // 1
     let pivot = node.rightChild!
     // 2
     node.rightChild = pivot.leftChild
     // 3
     pivot.leftChild = node
     // 4
     node.height = max(node.leftHeight, node.rightHeight) + 1
     pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
     // 5
     return pivot
    }
    
    //When children of left tree causes imbalance
    private func rightRotate(_ node: BinaryNode<Element>) -> BinaryNode<Element> {
     //print("---Doing right Rotation---")
     let pivot = node.leftChild!
     node.leftChild = pivot.rightChild
     pivot.rightChild = node
     node.height = max(node.leftHeight, node.rightHeight) + 1
     pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
     return pivot
    }
    
    //When balance factor is -2 and node.rightChild.balanceFactor = 1
    private func rightLeftRotate(_ node: BinaryNode<Element>) ->
    BinaryNode<Element> {
        //print("---Doing right left Rotation---")
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    //When balance factor is 2 and node..balanceFactor = -1
    private func leftRightRotate(_ node: BinaryNode<Element>) ->
    BinaryNode<Element> {
        //print("---Doing left right Rotation---")
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
}

var tree = BinarySearchTree<Int>()
for i in 0..<18 {
    tree.insert(i)
}
print("---Balanced Tree---\n\(tree)")
var treeTwo = BinarySearchTree<Int>()
treeTwo.insert(15)
treeTwo.insert(10)
treeTwo.insert(16)
treeTwo.insert(18)
print("---Tree two before removing value---\n\(treeTwo)")
print(treeTwo)
treeTwo.remove(10)
print("---Tree two after removing 10---\n\(treeTwo)")

