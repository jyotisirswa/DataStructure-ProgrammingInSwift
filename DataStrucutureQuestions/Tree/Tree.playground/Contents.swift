import UIKit

public class TreeNode<T> {
    public var value : T
    public var children : [TreeNode] = []
    
    public init(_ value : T) {
        self.value = value
    }
    
    public func add(_ child : TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    public func forEachDepthFirst(visit : (TreeNode) -> Void) {
        //print("visit self = \(self.value)")
        visit(self)
        children.forEach {
            //            for child in children {
            //                print("child = \(child.value)")
            //            }
            //print("visit children = \($0.value)")
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
//    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
//        visit(self)
//        var queue = Queue<TreeNode>()
//        children.forEach { queue.enqueue($0) }
//        while let node = queue.dequeue() {
//            visit(node)
//            node.children.forEach { queue.enqueue($0) }
//        }
//    }
}

func makeBeverageTree() -> TreeNode<String> {
    let tree = TreeNode("Beverages")
    let hot = TreeNode("hot")
    let cold = TreeNode("cold")
    let tea = TreeNode("tea")
    let coffee = TreeNode("coffee")
    let chocolate = TreeNode("cocoa")
    let blackTea = TreeNode("black")
    let greenTea = TreeNode("green")
    let chaiTea = TreeNode("chai")
    let soda = TreeNode("soda")
    let milk = TreeNode("milk")
    let gingerAle = TreeNode("ginger ale")
    let bitterLemon = TreeNode("bitter lemon")
    tree.add(hot)
    tree.add(cold)
    hot.add(tea)
    hot.add(coffee)
    hot.add(chocolate)
    cold.add(soda)
    cold.add(milk)
    tea.add(blackTea)
    tea.add(greenTea)
    tea.add(chaiTea)
    soda.add(gingerAle)
    soda.add(bitterLemon)
    return tree
}

let tree = makeBeverageTree()
print("Depth first traversal order:")
tree.forEachDepthFirst {
    print("\($0.value)")
}









