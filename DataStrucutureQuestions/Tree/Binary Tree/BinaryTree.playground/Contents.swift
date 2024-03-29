
//generic node to be used with binary search trees (BST’s)
class BinaryNode<Element>{
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
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
            print("left = \(lefth)")
            return lefth + 1;
        } else {
            print("righth = \(righth)")
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

print(treeObj)
var testTRaversal : [Int] = []
treeObj.traverseInOrder{
    testTRaversal.append($0)
}
print("Tree traverse In Order= \(testTRaversal)")
testTRaversal.removeAll()
treeObj.traversePreOrder{
    testTRaversal.append($0)
}
print("Tree traverse Pre Order= \(testTRaversal)")
testTRaversal.removeAll()
treeObj.traversePostOrder{
    testTRaversal.append($0)
}
print("Tree traverse Post Order= \(testTRaversal)")
print(treeObj.height(of: treeObj))

extension BinaryNode {
    public func traversePreOrder(visit: (Element?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
        if let rightChild = rightChild {
            rightChild.traversePreOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
}
func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    node.traversePreOrder { array.append($0) }
    return array
}
func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
    var reversed = Array(array.reversed())
    return deserialize(&reversed)
}
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard let value = array.removeLast() else {
        return nil
    }
    let node = BinaryNode(value: value)
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    return node
}

let array = serialize(treeObj)
let arrayUpdated = array.compactMap{$0}
print(arrayUpdated)
let node = deserialize(array)
print(node)
