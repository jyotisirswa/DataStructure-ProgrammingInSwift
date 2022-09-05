import UIKit
import Foundation

var greeting = "Hello, playground"

let node1 = Node(value: 1)
let node2 = Node(value : 2)
let node3 = Node(value : 3)

node1.next = node2
node2.next = node3

print(node1)

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

list.append(1)
list.append(2)
list.append(3)

print("Before insterting : \(list)")
var middleNode = list.node(at: 1)!

for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
}
print("After instering : \(list)")

print(list)



