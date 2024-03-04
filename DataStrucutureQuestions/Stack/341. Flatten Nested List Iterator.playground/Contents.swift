import UIKit

//https://leetcode.com/problems/flatten-nested-list-iterator/description/

class NestedInteger {
     // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool

     // Return the single integer that this NestedInteger holds, if it holds a single integer
     // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int
     // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int)

     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger)

     // Return the nested list that this NestedInteger holds, if it holds a nested list
     // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger]
    
 }

class NestedIterator {
    var operationStack :  [NestedInteger] = []
    init(_ nestedList: [NestedInteger]) {
        for i in stride(from: nestedList.count - 1, through: 0, by: -1) {
            operationStack.append(nestedList[i])
        }
    }
    
    func next() -> Int {
        return operationStack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
         while !operationStack.isEmpty {
             let current = operationStack.last!
             if current.isInteger() {
                return true
            }
            operationStack.removeLast()
            for i in stride(from: current.getList().count - 1, through: 0, by: -1) {
                operationStack.append(current.getList()[i])
            }
         }
         return false
    }
}
