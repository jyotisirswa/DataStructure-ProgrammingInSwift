import UIKit

//MARK: -  https://leetcode.com/problems/valid-palindrome/?envType=study-plan-v2&envId=top-interview-150
/*Time complexity:
The time complexity is O(n), where n is the number of characters in the string. However, our algorithm will only run O(n/2)times, since two pointers are traversing toward each other.

Space complexity:
The space complexity is O(1), since we use constant space to store two indexes. */

func isPalindrome(_ s: String) -> Bool {
    var lower = s.startIndex
    var upper = s.index(before: s.endIndex)
    while lower < upper {
        if !s[lower].isLetter, !s[lower].isNumber {
            lower = s.index(after: lower)
            continue
        }
        
        if !s[upper].isLetter, !s[upper].isNumber {
            upper = s.index(before: upper)
            continue
        }
        
        if s[lower].lowercased() != s[upper].lowercased() {
            return false
        }
        lower = s.index(after: lower)
        upper = s.index(before: upper)
    }
    return true
}

let string = "A man, a plan, a canal: Panama"
print(isPalindrome(string))

