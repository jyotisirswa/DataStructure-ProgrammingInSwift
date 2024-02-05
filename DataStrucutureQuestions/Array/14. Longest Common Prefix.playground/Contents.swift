import UIKit

//https://leetcode.com/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=top-interview-150

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return ""}
    if strs.count == 1 { return strs.last! }
    let sortedArray = strs.sorted()
    var output = ""
    print(sortedArray)
    for (char1, char2) in zip(strs.first!, strs.last!) {
        print(zip(sortedArray.first!, sortedArray.last!))
        print(char1)
        print(char2)
        if char1 == char2 {
            output += String(char1)
        } else {
            break
        }
    }
    return output
}


func longestCommonPrefixMethodTwo(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    var prefix = strs[0]
    for index in 1..<strs.count {
        while !strs[index].hasPrefix(prefix) {
            prefix = String(prefix.dropLast())
            if prefix.isEmpty {
                return ""
            }
            print("prefix = \(prefix) for comparing with \(strs[index])")
        }
    }
    
    
    return prefix
}

print("Longest common prefix of [flower, flow, flight] is :- \(longestCommonPrefixMethodTwo(["flower","flow","flight"]))")
print("Longest common prefix of is :- \(longestCommonPrefixMethodTwo(["dog","racecar","car"]))")
