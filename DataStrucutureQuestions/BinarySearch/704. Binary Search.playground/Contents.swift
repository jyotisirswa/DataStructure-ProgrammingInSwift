import UIKit

//https://leetcode.com/problems/binary-search/description/
//O(nlogn)

public extension RandomAccessCollection where Element : Comparable {
    
    func binarySearch(for value : Element, in range : Range<Index>? = nil) -> Index? {
        // 1
        let range = range ?? startIndex..<endIndex
        // 2
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        // 3
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        // 4
        if self[middle] == value {
            return middle
            // 5
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: index(after:
                                                        middle)..<range.upperBound)
        }
    }
}

func search(_ nums: [Int], _ target: Int) -> Int {
     //print("1")
     return binarySearch(in : nums, value : target, range : nil)!
}

//To return -1 instead of nil in case item is not found like mentioned in leetcode problem
func binarySearch(in array : [Int], value : Int, range : Range<Int>?) -> Int? {
    let rangeObj = range ?? 0..<array.count
    guard rangeObj.lowerBound < rangeObj.upperBound else {
        return -1
    }
    let size = rangeObj.upperBound - rangeObj.lowerBound
    let middle = array.index(rangeObj.lowerBound, offsetBy: size/2)
    if array[middle] == value {
        return Int(middle)
    }
    else if array[middle] > value {
        return binarySearch(in : array, value : value, range : rangeObj.lowerBound..<middle)!
    }
    else {
        return binarySearch(in : array, value : value, range : (middle + 1)..<rangeObj.upperBound)!
    }
}

let array = [-1,0,3,5,9,12]
let search = array.firstIndex(of: 2)
let binarySearch = array.binarySearch(for: 2)
let binarySearchSecondMethod = search(array, 2)
print("index(of:): 2 in \(array) is \(String(describing: search))")
print("binarySearch(for:): 2 in \(array) is \(String(describing: binarySearch))")
print("binarySearch(for:) 2 in \(array) is in second method is : \(String(describing: binarySearchSecondMethod))")
let arrayTwo = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
print("index(of:): 31 in \(arrayTwo) is \(String(describing: array.firstIndex(of: 31)))")
print("binarySearch(for:): 31 in \(arrayTwo) is \(String(describing: array.binarySearch(for: 31)))")
print("binarySearch(for:) 31 in \(arrayTwo) is in second method is : \(String(describing: search(arrayTwo, 31)))")


func binarySearch(array : [Int], targetValue : Int, range : Range<Int>?) -> Int? {
    let rangeObj = range ?? 0..<array.count
    
    guard rangeObj.lowerBound < rangeObj.upperBound else {
        return -1
    }
    let size = rangeObj.distance(from: rangeObj.lowerBound, to: rangeObj.upperBound)
    let middleIndex = array.index(rangeObj.lowerBound, offsetBy: size/2)
    
    if array[middleIndex] == targetValue {
        return middleIndex
    }
    else if array[middleIndex] > targetValue {
        return binarySearch(array: array, targetValue: targetValue, range: rangeObj.lowerBound..<middleIndex)
    } else {
        return binarySearch(array: array, targetValue: targetValue, range: middleIndex..<rangeObj.upperBound)
    }
}
