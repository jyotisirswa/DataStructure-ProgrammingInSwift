import UIKit

//https://leetcode.com/problems/word-pattern/

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    var hashMap = [Character : String.SubSequence]()
    var patternArray = Array(pattern)
    var sArray = s.split(separator: " ")
    if patternArray.count != sArray.count {
        return false
    }
    for i in 0..<sArray.count {
        if hashMap[patternArray[i]] == nil {
            hashMap[patternArray[i]] = sArray[i]
        } else if hashMap[patternArray[i]] != sArray[i] {
            return false
        }
    }
    return hashMap.keys.count == Set(hashMap.values).count
}

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("aaaa", "dog cat cat dog"))

