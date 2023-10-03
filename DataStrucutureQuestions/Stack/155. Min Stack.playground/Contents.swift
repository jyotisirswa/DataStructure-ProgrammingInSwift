import UIKit

//Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//https://leetcode.com/problems/min-stack/description/
class MinStack {
    var array : [Int] = []
    var minArray : [Int] = []
    
    
    //stack is empty or not
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var minValue = 0
    
    init() {
        
    }
    
    func push(_ val: Int) {
        minValue = array.last == nil ? val :  min(val, minArray.last!)
        array.append(val)
        minArray.append(minValue)
    }
    
    func pop() {
        array.popLast()
        minArray.popLast()
    }
    
    func top() -> Int {
        return array.last!
    }
    
    func getMin() -> Int {
        return minArray.last!
    }
}

var minStack = MinStack()
minStack.push(2)
minStack.push(1)
minStack.push(-3)
minStack.push(-20)
minStack.push(-7)
minStack.pop()
minStack.push(-10)
minStack.pop()
minStack.push(-9)

let minValue = minStack.getMin()
print("Minimum value of stack = \(minValue)")

