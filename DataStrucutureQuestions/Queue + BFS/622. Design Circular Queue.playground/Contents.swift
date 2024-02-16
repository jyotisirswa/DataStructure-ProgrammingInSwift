
//https://leetcode.com/problems/design-circular-queue/description/

/*
 # Intuition
 A ring buffer, also known as a circular buffer, is a fixed-size array. This data structure strategically wraps around to the beginning when there are no more items to remove at the end.

 1. The read pointer keeps track of the front of the queue.
 2. The write pointer keeps track of the next available slot so you can override existing
 elements that have already been read.

 # Complexity
 The ring buffer-based queue has the same time complexity for enqueue and dequeue as the linked list implementation. The only difference is the space complexity. The ring buffer has a fixed size.

 ![image.png](https://assets.leetcode.com/users/images/9184d2bb-43c5-4278-8029-a0a6ba50b303_1708019627.307626.png)
*/


class MyCircularQueue {
     var array : [Int] = []
     var readIndex = 0
     var writeIndex = 0



    init(_ k: Int) {
        array = Array(repeating: 0, count: k)
    }

    func writeElement(element : Int) -> Bool {
        if !isFull() {
            array[writeIndex % array.count] = element
            writeIndex += 1
            print("Queue after enqueue = \(array)")
            return true
        } else {
            return false
        }
    }

    func readElement() -> Int? {
        if !isEmpty() {
        let element = array[readIndex % array.count]
            readIndex += 1
            print("Queue after dequeu = \(array)")
            return element
        } else {
        return nil
        }
    }
    
    func enQueue(_ value: Int) -> Bool {
        return writeElement(element: value)
    }
    
    func deQueue() -> Bool {
        return isEmpty() ? false : (readElement() == nil ? false : true )
    }
    
    func Front() -> Int {
         if isEmpty() {
             return -1
         } else {
           return (readIndex > 0 && readIndex < array.count) ? array[readIndex] : array[(readIndex % array.count)]
         }
    }
    
    func Rear() -> Int {
         return !isEmpty() ? array[(writeIndex - 1) % array.count] : -1
    }

    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }

    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    func isEmpty() -> Bool {
        return availableSpaceForReading == 0
    }
    
    func isFull() -> Bool {
        return availableSpaceForWriting == 0
    }
}

var obj = MyCircularQueue(3)
obj.enQueue(1)
obj.enQueue(2)
obj.enQueue(3)
obj.enQueue(4)
print("Rear = \(obj.Rear())")
print("isFull = \(obj.isFull())")
print("dequeue Element = \(obj.deQueue())")
obj.enQueue(4)
print("Rear = \(obj.Rear())")
