//https://leetcode.com/problems/open-the-lock/description/

/*Input: deadends = ["0201","0101","0102","1212","2002"], target = "0202"
Output: 6
Explanation:
A sequence of valid moves would be "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
Note that a sequence like "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
because the wheels of the lock become stuck after the display becomes the dead end "0102".
*/

func openLock(_ deadends: [String], _ target: String) -> Int {
    if deadends.contains("0000") {
        return -1
    }
    
    let nextNum = (0...9).map { i -> [String] in
        let value1 = String((i + 1) % 10)
        let value2 = String((i - 1 + 10) % 10)
        return [value1, value2]
    }
    
    for d in stride(from: -1, through: 10, by: 2) {
        print("d = \(d)")
    }
    
    print(nextNum)
    
    return 0
}

func openLockApproachTwo(_ deadends: [String], _ target: String) -> Int {
    let deadEndIntValue = deadends.map{$0.compactMap { Int("\($0)") }}
    print(deadEndIntValue)
    let ddends = deadends.map { $0.compactMap { Int("\($0)") }}
    print(ddends)
    let trgInt = target.compactMap { Int("\($0)") }
    print(trgInt)
    var queue = [[0,0,0,0]], vzitd = Set(queue)
    var turns = 0
    
    while !queue.isEmpty {
        print("Entering for loop")
        //var count = queue.count
        for index in 0..<queue.count {
            print("queue = \(queue) for index \(index)")
            let cur = queue.removeFirst()
            if ddends.contains(cur) { continue }
            if cur == trgInt { return turns }
            for i in 0...3 {
                for d in stride(from: -1, through: 1, by: 2) {
                    var nbr: [Int] = cur
                    nbr[i] = ((nbr[i] + d) + 10) % 10
                    if !vzitd.contains(nbr) && !ddends.contains(nbr) {
                        queue.append(nbr)
                        vzitd.insert(nbr)
                    }
                }
            }
        }
        turns += 1
    }
    return -1
}

print(openLockApproachTwo(["0201","0101","0102","1212","2002"], "0202"))


import Foundation

class SolutionTwo {

}


class Solution {
    
    
    
    
    func openLock(_ deadends: [String], _ target: String) -> Int {
        if deadends.contains("0000") { return -1 }
        
        let nextNum = (0...9).map { i -> [String] in
            let value1 = String((i + 1) % 10)
            let value2 = String((i - 1 + 10) % 10)
            return [value1, value2]
        }
        
        var queue = Deque<(String, Int)>()
        queue.enqueue(("0000", 0))
        
        var seen: Set<String> = ["0000"]
        seen.formUnion(deadends)
        
        while let (curNode, depth) = queue.dequeue() {
            if curNode == target {
                return depth
            }
            
            for i in curNode.indices {
                let num = Int(String(curNode[i]))!
                
                for n in nextNum[num] {
                    var newChars = curNode
                    newChars[i] = Character(n)
                    let newNode = String(newChars)
                    
                    if !seen.contains(newNode) {
                        seen.insert(newNode)
                        queue.enqueue((newNode, depth + 1))
                    }
                }
            }
        }
        return -1
    }
}

// Helper Deque class
struct Deque<T> {
    private var array: [T?] = []
    private var head: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

