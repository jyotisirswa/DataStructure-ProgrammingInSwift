import UIKit

//https://leetcode.com/problems/longest-common-prefix/description/?envType=study-plan-v2&envId=top-interview-150

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return ""}
    if strs.count == 1 { return strs.last! }
    let sortedArray = strs.sorted()
    var output = ""
    print(zip(strs.first!, strs.last!))
    for (char1, char2) in zip(strs.first!, strs.last!) {
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


func longestCommonPrefixApproach3(_ strs: [String]) -> String {
    if strs.isEmpty {
        return ""
    }
    return longestCommonPrefix(strs, 0, strs.count - 1)
}

private func longestCommonPrefix(_ strs: [String], _ l: Int, _ r: Int) -> String {
    if l == r {
        return strs[l]
    } else {
        let mid = (l + r) / 2
        let lcpLeft = longestCommonPrefix(strs, l, mid)
        let lcpRight = longestCommonPrefix(strs, mid + 1, r)
        return commonPrefix(lcpLeft, lcpRight)
    }
}

private func commonPrefix(_ left: String, _ right: String) -> String {
    let min = min(left.count, right.count)
    for i in 0..<min {
        if left[left.index(left.startIndex, offsetBy: i)] != right[right.index(right.startIndex, offsetBy: i)] {
            return String(left.prefix(i))
        }
    }
    return String(left.prefix(min))
}

print("Longest common prefix of [flower, flow, flight] is :- \(longestCommonPrefix(["flower","flow","flight"]))")
print("Longest common prefix of is :- \(longestCommonPrefixMethodTwo(["dog","racecar","car"]))")
