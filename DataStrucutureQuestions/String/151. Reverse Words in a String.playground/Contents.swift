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

//func reverseWords(_ s: String) -> String {
//    let words = s.split { $0.isWhitespace }.reversed()
//    return words.joined(separator: " ")
//}

func strRev(_ str: inout [Character], _ start: Int, _ end: Int) {
    var start = start
    var end = end
    while start < end {
        let temp = str[start]
        str[start] = str[end]
        str[end] = temp
        start += 1
        end -= 1
    }
}

func reverseWordsApproachTwo(_ sentence: String) -> String {
    var chars = Array(sentence)
    let strLen = chars.count
    strRev(&chars, 0, strLen - 1)
    
    var start = 0
    var end: Int
    while start < chars.count {
        while start < chars.count && chars[start] == " " {
            start += 1
        }
        if start == strLen {
            break
        }
        
        end = start + 1
        while end < strLen && chars[end] != " " {
            end += 1
        }
        
        strRev(&chars, start, end - 1)
        start = end
    }
    return String(chars)
}

func reverseWordsApproachThree(_ s: String) -> String {
    var result = ""
    var index = 0
    let length = s.count
    while index < length {
        print("index = \(index)")
        while index < length && s[s.index(s.startIndex, offsetBy: index)] == " " { index += 1 }
        if index >= length { break }
        print("index = \(index)")
        var endIndex = index + 1
        while endIndex < length && s[s.index(s.startIndex, offsetBy: endIndex)] != " " { endIndex += 1 }
        print(s[s.index(s.startIndex, offsetBy: index)..<s.index(s.startIndex, offsetBy: endIndex)])
        let sub = String(s[s.index(s.startIndex, offsetBy: index)..<s.index(s.startIndex, offsetBy: endIndex)]) // characters[index..<endIndex])
        if result.isEmpty {
            result = sub
        } else {
            result = sub + " " + result
        }
        index = endIndex + 1
    }
    return result
}

print("Reverse of the sky is blue : \(reverseWordsApproachThree("the sky is blue"))")
print("Reverse of a good   example : \(reverseWordsApproachThree("  hello world  "))")
