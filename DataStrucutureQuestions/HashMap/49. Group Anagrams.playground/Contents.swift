import UIKit

//https://leetcode.com/problems/group-anagrams/

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var result = [String: [String]]()
    
    for string in strs {
        var countArray = [Int](repeating: 0, count: 26)
        
        for character in string {
            countArray[Int(character.asciiValue! - Character("a").asciiValue!)] += 1
        }
        let key = countArray.map { String($0) }.joined(separator: ",")
        result[key, default: []].append(string)
    }
    return Array(result.values)
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
