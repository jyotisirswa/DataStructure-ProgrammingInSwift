import UIKit

//https://leetcode.com/problems/length-of-last-word/?envType=study-plan-v2&envId=top-interview-150
//timeComplexity : O(n), spaceComplexity : O(1)

func lengthOfLastWord(_ s: String) -> Int {
    // var lastWord = s.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
    // return lastWord.last?.count ?? 0
    var countOfLastWord = 0
    for index in s.indices.reversed() {
        if s[index] != " " {
            countOfLastWord += 1
        } else if countOfLastWord > 0 {
            return countOfLastWord
        }
    }
    return countOfLastWord
}

print("Length of Last word of Hello World is :- \(lengthOfLastWord("Hello World"))")
print("Length of Last word of    fly me   to   the moon   is :- \(lengthOfLastWord("   fly me   to   the moon  "))")

