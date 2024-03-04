struct Heap<Element : Equatable> {
    var elements = [Element]()
    let sorting : (Element, Element) -> Bool
    
    init(sorting: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        self.sorting = sorting
        self.elements = elements
        if !elements.isEmpty {
            for index in stride(from: elements.count/2 - 1, through: 0, by: -1) {
                siftDown(from: index)
            }
        }
    }
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    func leftChildIndex(ofParentAt index : Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index : Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index : Int) -> Int {
        return (index - 1)/2
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer {
            
        }
        return elements.removeLast()
    }
    
    func isMinHeap<Element : Comparable>(elements: [Element]) -> Bool {
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
    
    mutating public func merge(_ heap: Heap) {
        elements = elements + heap.elements
        //buildHeap()
    }
    
//    func getNthSmallestElement(n: Int, elementss: [Element]) -> Int? {
//        var heap = Heap(sorting: <, elements:  elementss)
//        var current = 1
//        while !heap.isEmpty {
//            let element = heap.remove()
//            if current == n {
//                return element
//            }
//            current += 1
//        }
//        return nil
//    }
    
    //O(log n)
    mutating func siftDown(from index : Int) {
        var parent = index
        while true {
            var leftChildIndex = leftChildIndex(ofParentAt: parent)
            var rightChildIndex = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if leftChildIndex < count, sorting(elements[leftChildIndex], elements[candidate]) {
               candidate = leftChildIndex
            }
            if rightChildIndex < count, sorting(elements[rightChildIndex], elements[candidate]) {
               candidate = rightChildIndex
            }
            if candidate == parent {
                return
            }
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
    
    mutating func insert(element : Element) {
        elements.append(element)
    }
    
    mutating func siftUp(from index : Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while true  {
            if child > 0, sorting(elements[child], elements[parent]) {
                elements.swapAt(child, parent)
                child = parent
                parent = parentIndex(ofChildAt: child)
            }
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
        if sorting(element, elements[i]) {
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
}

var heap = Heap(sorting: <, elements:  [4, 3, 10, 18, 5, 21, 100])
while !heap.isEmpty {
 print(heap.remove()!)
}
