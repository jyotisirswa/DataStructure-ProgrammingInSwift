import UIKit

//https://leetcode.com/problems/implement-queue-using-stacks/description/

class MyQueue {
    var stack1 : [Int] = []
    init() {
    
    }
    
    func push(_ x: Int) {
        if !stack1.isEmpty {
            var stack2 : [Int] = []
            while !stack1.isEmpty {
                stack2.append(pop())
            }
            stack1.append(x)
            while !stack2.isEmpty {
                stack1.append(stack2.removeLast())
            }
        }
    }
    
    func pop() -> Int {
        return stack1.removeLast()
    }
    
    func peek() -> Int {
        return stack1.last ?? 0
    }
    
    func empty() -> Bool {
        return stack1.isEmpty
    }
}
