import UIKit

//https://leetcode.com/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=top-interview-150

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return ""}
    if strs.count == 1 { return strs.last! }
    let sortedArray = strs.sorted()
    var output = ""
    for (char1, char2) in zip(sortedArray.first!, sortedArray.last!) {
        char1
        if char1 == char2 {
            output += String(char1)
        } else {
            break
        }
    }
    return output
}

print("Longest common prefix of [flower, flow, flight] is :- \(longestCommonPrefix(["flower","flow","flight"]))")
