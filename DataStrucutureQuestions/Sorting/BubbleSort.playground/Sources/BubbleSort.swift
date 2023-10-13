import Foundation

//MARK: - One of the simplest sorts is the bubble sort, which repeatedly compares adjacent values and swaps them, if needed, to perform the sort. The larger values in the set will therefore "bubble up" to the end of the collection.  At worst, this will require n-1 passes, where n is the count of members in the collection.
//best time complexity of O(n) if it’s already sorted, and a worst and average time complexity of O(n²),
public func bubbleSort<Element>(_ array : inout [Element]) where Element : Comparable {
    //1 There is no need to sort the collection if it has less than two elements.
    guard array.count > 2 else {
        return
    }
    //2 A single pass bubble the largest value to the end of the collection. Every pass needs to compare one less value than in the previous pass, so you essentially shorten the array by one with each pass.
    for end in (1..<array.count).reversed() {
        var swapped = false
        //3 This loop performs a single pass; it compares adjacent values and swaps them if needed.
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        //4 If no values were swapped this pass, the collection must be sorted, and you can exit early.
        if !swapped {
            return
        }
    }
}

//Bubble sort and selection sort really only traverse the collection front to back, so they can handle any Collection.
//public func bubbleSort<T>(_ collection: inout T)
//where T: MutableCollection, T.Element: Comparable {
//    guard collection.count >= 2 else {
//        return
//    }
//    for end in collection.indices.reversed() {
//        var swapped = false
//        var current = collection.startIndex
//        while current < end {
//            let next = collection.index(after: current)
//            if collection[current] > collection[next] {
//                collection.swapAt(current, next)
//                swapped = true
//            }
//            current = next
//        }
//        if !swapped {
//            return
//        }
//    }
//}
