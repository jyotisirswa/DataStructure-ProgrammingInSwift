import UIKit

//https://leetcode.com/problems/word-break/description/
//Time Complexity : O(n*m*n) , where n is length of string & m is length of array

print(wordBreak("leetcode", ["leet","code"]))
print(wordBreak("aaaaaa", ["aaaa","aaa"]))


func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let length = s.count
    var dp = [Bool](repeating: false, count: length + 1)
    dp[length] = true
    for i in stride(from: length - 1, through: 0, by: -1) {
        for word in wordDict {
            if i + word.count <= length && s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i + word.count)] == word {
                dp[i] = dp[i + word.count]
            }
            if dp[i] {
                break
            }
        }
    }
    return dp[0]
}
