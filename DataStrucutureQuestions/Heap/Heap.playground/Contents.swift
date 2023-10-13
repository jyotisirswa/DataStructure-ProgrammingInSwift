import UIKit

struct Heap<Element : Equatable> {
    var elements : [Element] = [] // array to hold the elements in the heap
    let sort: (Element, Element) -> Bool // sort function that defines how the heap should be ordered
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    var isEmpty : Bool {
        return elements.isEmpty
    }
    var count : Int {
        return elements.count
    }
    func peek() -> Element? {
        return elements.first
    }
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
}

extension Heap {
    
    //Complexity: The overall compexity of insert(_:) is O(log n). Appending an element in an array takes only O(1), while sifting up elements in a heap takes O(log n).
    mutating func insert(_element : Element) {
        elements.append(_element) //appends the element to the array and then performs a sift up.
        siftUp(from: elements.count - 1)
    }
    
    //siftUp swaps the current node with its parent, as long as that node has a higher priority than its parent.
    mutating func siftUp(from index : Int) {
        var child = index
        var parent = parentIndex(ofChildAt: index)
        while child > 0 , sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    
    //Complexity: The overall complexity of remove() is O(log n). Swapping elements in an array takes only O(1), while sifting down elements in a heap takes O(log n) time.
    mutating func remove() -> Element? {
        guard !isEmpty else { //1 Check to see if the heap is empty. If it is, return nil.
            return nil
        }
        elements.swapAt(0, count - 1) //2 Swap the root with the last element in the heap.
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()//3 Remove the last element (the maximum or minimum value) and return it.
    }
    
    
    mutating func siftDown(from index : Int) {
        var parent = index //1 Store the parent index.
        while true {  //2  Continue sifting until you return.
            var leftChildIndex = leftChildIndex(ofParentAt: parent) //3 Get the parent’s left and right child index.
            var rightChildIndex = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent //4 The candidate variable is used to keep track of which index to swap with the parent.
            
            if leftChildIndex < count && sort(elements[leftChildIndex], elements[candidate]) {
                candidate = leftChildIndex //5 If there is a left child, and it has a higher priority than its parent, make it the candidate.
            }
            if rightChildIndex < count && sort(elements[rightChildIndex], elements[candidate]) {
                candidate = rightChildIndex //6 If there is a right child, and it has an even greater priority, it will become the candidate instead.
            }
            if candidate == parent {
                return //7 If candidate is still parent, you have reached the end, and no more sifting is required.
            }
            elements.swapAt(candidate, parent) //8 Swap candidate with parent and set it as the new parent to continue sifting.
            parent = candidate
        }
    }
    
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil // 1
        }
        if index == elements.count - 1 {
            return elements.removeLast() // 2
        } else {
            elements.swapAt(index, elements.count - 1) // 3
            defer {
                siftDown(from: index) // 5
                siftUp(from: index)
            }
            return elements.removeLast() // 4
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil // 1
        }
        if sort(element, elements[i]) {
            return nil // 2
        }
        if element == elements[i] {
            return i // 3
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt:
                                                                    i)) {
            return j // 4
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt:
                                                                    i)) {
            return j // 5
        }
        return nil // 6
    }
    
    func isMinHeap<Element: Comparable>(elements: [Element]) -> Bool {
        guard !elements.isEmpty else {
            return true
        }
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            let left = leftChildIndex(ofParentAt: i)
            let right = rightChildIndex(ofParentAt: i)
            if elements[left] < elements[i] {
                return false
            }
            if elements[right] < elements[i] {
                return false
            }
        }
        return true
    }
}

var heap = Heap(sort: <, elements:  [3, 10, 18, 5, 21, 100])
print(heap)
//print(heap.remove(at: 3))
//while !heap.isEmpty {
// print(heap.remove()!)
//}
