import UIKit

//https://leetcode.com/problems/longest-palindrome/description/

func longestPalindrome(_ s: String) -> Int {
    var hashMap = [Character : Int]()
    var palindromCount = 0
    for character in s {
        if hashMap[character] == nil {
            hashMap[character] = 1
        } else {
            hashMap[character]! += 1
        }
    }
    for (_, element) in hashMap {
        if element % 2 == 0 {
           palindromCount += element
        } else {
            palindromCount += element - 1
        }
    }
    return palindromCount < s.count ? palindromCount + 1 : palindromCount
}

print(longestPalindrome("abccccdddeeeeeeff"))
