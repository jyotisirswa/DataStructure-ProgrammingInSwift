import UIKit

//https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/description/
/*
 Move the left boundary to the right: left = right.
 Extend the right boundary: right = right * 2. (until value at right is less than target)
 If the target value is equal to the middle element - we're done.
 If the target value is smaller - continue to search on the left.
 If the target value is larger - continue to search on the right.
 */

class ArrayReader {
    var array : [Int]
    init(array: [Int]) {
        self.array = array
    }

    public func get(_ index: Int) -> Int {
        if index < array.count {
            return array[index]
        } else {
            return Int.max
        }
    }
}

func search(_ reader: ArrayReader, _ target: Int) -> Int {
    if reader.get(0) == target {
        return 0
    }
    var left = 0, right = 1
    while reader.get(right) < target {
        left = right
        right <<= 1 //this will double the right
    }
    
    while left <= right {
        let middle = left + (right - left)/2
        let num = reader.get(middle)
        
        if num == target {
            return middle
        } else if num > target {
            right = middle - 1
        } else {
            left = middle + 1
        }
    }
    return -1
}
print(search(ArrayReader(array: [-1,0,3,5,9,12]) , 9))
print(search(ArrayReader(array: [-1,0,3,5,9,12]) , 2))
