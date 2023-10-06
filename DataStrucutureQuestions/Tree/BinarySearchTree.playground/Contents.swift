import UIKit

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

extension BinarySearchTree {
    
    public mutating func insert(_ value : Element) {
      print("root = \(root?.value)")
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
    
    /* Here’s how this works:
     1. Start off by setting current to the root node.
     2. While current is not nil, check the current node’s value.
     3. If the value is equal to what you’re trying to find, return true.
     4. Otherwise, decide whether you’re going to check the left or the right child.
     In a balanced binary search tree, this implementation of contains is an O(log n)
     operation.
     */
    public func contains(_ value: Element) -> Bool {
        //1
        var current = root
        //2
        while let node = current {
            //3
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            }
            else {
                current = node.rightChild
            }
        }
        return false
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
            print("min = \(node.rightChild?.min.value)")
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

var bst = BinarySearchTree<Int>()
for i in 0..<5 {
    bst.insert(i)
}
print(bst)

var bstTwo = BinarySearchTree<Int>()
bstTwo.insert(3)
bstTwo.insert(1)
bstTwo.insert(4)
bstTwo.insert(0)
bstTwo.insert(2)
bstTwo.insert(5)
print(bstTwo)
print("Check for Bst Two contains 5 = \(bstTwo.contains(5))")
print("Check for Bst Two contains 10 = \(bstTwo.contains(10))")
bstTwo.remove(3)
print("Tree before removal:")
print(bstTwo)
bstTwo.remove(3)
print("Tree after removing root:")
print(bstTwo)


