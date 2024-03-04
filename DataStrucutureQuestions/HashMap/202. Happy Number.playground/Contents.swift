import UIKit

//https://leetcode.com/problems/happy-number/

func isHappy(_ n: Int) -> Bool {
    var slow = n
    var fast = n
    
    while true {
        slow = getNext(slow)
        fast = getNext(fast)
        fast = getNext(fast)
        if slow == fast {
            break
        }
    }
    return fast == 1
}

private func getNext(_ n: Int) -> Int {
    var sum = 0
    var input = n
        
    while input > 0 {
        let remainder = input % 10
        sum += remainder * remainder
        input /= 10
    }
    
    return sum
}
print(isHappy(19))
