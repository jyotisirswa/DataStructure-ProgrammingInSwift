import UIKit

//https://leetcode.com/problems/ransom-note/description/

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var hashMap = [Character : Int]()
    for character in magazine {
        if hashMap[character] == nil {
            hashMap[character] = 1
        } else {
            hashMap[character]! += 1
        }
    }
    
    for character in ransomNote {
        if let count = hashMap[character], count > 0 {
            hashMap[character]! -= 1
        } else {
            return false
        }
    }
    return true
}
print(canConstruct("a", "b"))
print(canConstruct("aa", "ab"))
print(canConstruct("aa", "aab"))
