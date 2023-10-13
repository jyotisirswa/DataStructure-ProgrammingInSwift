import Foundation

//Just like bubble sort, selection sort has a best, worst, and average time complexity of O(n²), which is fairly dismal. It’s a simple one to understand, though, and it does perform better than bubble sort!
public func selectionSort<Element>(_ array : inout [Element]) where Element : Comparable {
    
    guard array.count >= 2 else {
        return
    }
    //1
    for current in 0..<array.count {
        var lowest = current
        //2
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        //3
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

//public func selectionSort<T>(_ collection: inout T)
//where T: MutableCollection, T.Element: Comparable {
//    guard collection.count >= 2 else {
//        return
//    }
//    for current in collection.indices {
//        var lowest = current
//        var other = collection.index(after: current)
//        while other < collection.endIndex {
//            if collection[lowest] > collection[other] {
//                lowest = other
//            }
//            other = collection.index(after: other)
//        }
//        if lowest != current {
//            collection.swapAt(lowest, current)
//        }
//    }
//}
