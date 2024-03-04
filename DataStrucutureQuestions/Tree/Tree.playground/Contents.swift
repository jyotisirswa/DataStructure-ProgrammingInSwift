import UIKit

//public class TreeNode<T> {
//    public var value : T
//    public var children : [TreeNode] = []
//    
//    public init(_ value : T) {
//        self.value = value
//    }
//    
//    public func add(_ child : TreeNode) {
//        children.append(child)
//    }
//}


public class TreeNode<T> {
    public var value : T
    public var children : [TreeNode] = []
    
    init(_ value: T, child: [TreeNode] = []) {
        self.value = value
        self.children = child
    }
    
    public func add(_ child : TreeNode) {
        self.children.append(child)
    }
}

extension TreeNode where T : Equatable {
    public func forEachDepthFirst(visit : (TreeNode) -> Void) {
        //print("visit self = \(self.value)")
        visit(self)
        children.forEach {
            //            for child in children {
            //                print("child = \(child.value)")
            //            }
           // print("visit children = \($0.value)")
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = [TreeNode]()
        children.forEach{
            queue.append($0)
        }
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visit(node)
            node.children.forEach {
                queue.append($0)
            }
        }
    }
    
    func printEachLevel(for tree: TreeNode) {
        var queue = [TreeNode?]()
        var nodeLeftIncurrentLevel = 0
        queue.append(tree)
        while !queue.isEmpty {
            nodeLeftIncurrentLevel = queue.count
            while nodeLeftIncurrentLevel > 0 {
                guard let node = queue.removeFirst() else {
                    return
                }
                print("\(node.value)", terminator: " ")
                node.children.forEach {
                    queue.append($0)
                }
                nodeLeftIncurrentLevel -= 1
            }
            print()
        }
    }
    
    public func search(_ value: T) -> TreeNode? {
        var resultNode : TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                resultNode = node
            }
        }
        return resultNode
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
print("Level order traversal:")
tree.forEachLevelOrder {
    print("\($0.value)")
}
if let searchedResult = (tree.search("ginger ale")) {
    print("searchedResult = \(searchedResult.value)")
}

print("Print Each Level Values")
tree.printEachLevel(for: tree)











