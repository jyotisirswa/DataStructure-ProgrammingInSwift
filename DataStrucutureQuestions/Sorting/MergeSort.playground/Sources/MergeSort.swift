import Foundation

//MARK: -  time complexity of O(n log n)  The idea behind merge sort is divide and conquer; to break up a big problem into several smaller, easier to solve problems and then combine those solutions into a final result.  O(log n) × O(n) = O(n log n), Space Complexity : - There are log2(n) levels of recursion and at each level n elements are used. That makes the total O(n log n) in space complexity.
public func mergeSort<Element>(_ array : [Element]) -> [Element] where Element : Comparable {
    guard array.count > 1 else {
        return array
    }
    let middle = array.count/2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    return merge(left, right)
}

/* 1. The strategy of merge sort is to divide and conquer, so that you solve many small
 problems instead of one big problem.
 2. It has two core responsibilities: a method to divide the initial array recursively, and
 a method to merge two arrays.
 3. The merging function should take two sorted arrays and produce a single sorted
 array.*/


private func merge<Element>(_ left : [Element], _ right : [Element]) -> [Element] where Element : Comparable {
    //1 The leftIndex and rightIndex variables track your progress as you parse through the two arrays.
    var leftIndex = 0
    var rightIndex = 0
    
    //2 The result array will house the combined array.
    var result : [Element] = []
    //3 Starting from the beginning, you compare the elements in the left and right arrays sequentially. If you’ve reached the end of either array, there’s nothing else to compare.
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        //4 The smaller of the two elements goes into the result array. If the elements were equal, they can both be added.
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        }
        else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        }
        else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    //5 The first loop guarantees that either left or right is empty. Since both arrays are sorted, this ensures that the leftover elements are greater than or equal to the ones currently in result. In this scenario, you can append the rest of the elements without comparison.
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}
