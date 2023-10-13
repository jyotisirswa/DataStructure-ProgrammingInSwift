import Foundation

public func partitionLomuto<T : Comparable>(_ a : inout [T], low : Int, high : Int) -> Int {
     print("a = \(a) , low = \(low), high = \(high), pivot = \(a[high] )")
     var pivot = a[high] //1 Set the pivot. Lomuto always chooses the last element as the pivot.
     var i = low //2  The variable i indicates how many elements are less than the pivot. Whenever you encounter an element that is less than the pivot, you swap it with the element at index i and increase i.
    
    for j in low..<high{  //3 Loop through all the elements from low to high, but not including high since it’s the pivot
        if a[j] <= pivot { //4 Check to see if the current element is less than or equal to the pivot.
            a.swapAt(i, j) //5 If it is, swap it with the element at index i and increase i.
            i += 1
        }
    }
    a.swapAt(i, high) //6 Once done with the loop, swap the element at i with the pivot. The pivot always sits between the less and greater partitions.
    return i //7 Return the index of the pivot.
}

public func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int,
                                           high: Int) {
    print("running main function ")
    if low < high {
        let pivot = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}
