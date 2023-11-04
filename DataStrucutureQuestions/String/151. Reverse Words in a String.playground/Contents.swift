import UIKit

//https://leetcode.com/problems/reverse-words-in-a-string/?envType=study-plan-v2&envId=top-interview-150
// - Complexity:
//   - time: O(n), where n is the number of words in the input string.
//   - space: O(m), where m is the length of the input string.

func reverseWords(_ s: String) -> String {
  var arrayFromString = s.split(separator: " ")
  var startIndex = 0
  var endIndex = arrayFromString.count - 1
  
  while startIndex < endIndex {
      arrayFromString.swapAt(startIndex, endIndex)
      startIndex += 1
      endIndex -= 1
  }
  return arrayFromString.joined(separator: " ")
}
print("Reverse of the sky is blue is : \(reverseWords("the sky is blue"))")
