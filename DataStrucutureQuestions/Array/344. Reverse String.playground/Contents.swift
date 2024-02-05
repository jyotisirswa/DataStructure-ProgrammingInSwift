import UIKit

//https://leetcode.com/problems/reverse-string/description/
//Time complexity : O(n/2) hence O(n)

func reverseString(_ s: inout [Character]) {
    if !s.isEmpty {
        var leftPointer = 0
        var rightPointer = s.count - 1
        while leftPointer < rightPointer {
            (s[leftPointer], s[rightPointer]) = (s[rightPointer], s[leftPointer])
            leftPointer += 1
            rightPointer -= 1
        }
    }
    print(s)
}

func reverseStringMethodTwo(_ s: inout [Character]) {
    for index in 0..<s.count/2 {
        (s[index], s[s.count - 1 - index]) =  (s[s.count - 1 - index], s[index])
    }
    print(s)
}

var array : [Character] = ["h","e","l","l","o"]
var arrayTwo : [Character] = ["H","a","b","n","a","h"]

print(reverseString(&array))
print(reverseString(&arrayTwo))
