import UIKit

//https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/description/?envType=study-plan-v2&envId=top-interview-150
func strStr(_ haystack: String, _ needle: String) -> Int {
    let lengthOfHay = haystack.count, lengthOfN = needle.count
    if lengthOfHay == 0 || haystack == needle { return 0 }
    guard lengthOfHay >=  lengthOfN else { return -1 }
    var indexInitialOfHay = haystack.startIndex
    
    for pointer in 0...(lengthOfHay - lengthOfN) { //O(n - m)
        var endIndex = haystack.index(indexInitialOfHay, offsetBy : lengthOfN) //O(m)
        if haystack[indexInitialOfHay..<endIndex] == needle { return pointer } //O(1)
        indexInitialOfHay = haystack.index(after: indexInitialOfHay)
    }
    return -1
}

print("Index of First occurance of sad in String sadbutsad is :-  \(strStr("sadbutsad", "sad"))")
print("Index of First occurance of leeto in String leetcode is :- \(strStr("leetcode", "leeto"))")
