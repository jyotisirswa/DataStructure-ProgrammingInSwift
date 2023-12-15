import UIKit

//https://leetcode.com/problems/valid-anagram/

func isAnagram(_ s: String, _ t: String) -> Bool {
    var sCountHashMap = [Character: Int]()
    var tCountHashMap = [Character: Int]()
    
    if s.count != t.count {
        return false
    }
    
    for index in s.indices {
        sCountHashMap[s[index]] = 1 + sCountHashMap[s[index], default: 0]
        tCountHashMap[t[index]] = 1 + tCountHashMap[t[index], default: 0]
    }
    
    for key in sCountHashMap.keys {
        if sCountHashMap[key] != tCountHashMap[key] {
            return false
        }
    }
    return true
}
print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
