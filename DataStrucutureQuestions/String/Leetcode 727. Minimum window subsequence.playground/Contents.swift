import UIKit

//https://leetcode.com/problems/minimum-window-subsequence/description/ :- Premium subscription problem

/* Given strings S and T, find the minimum (contiguous) substring W of S, so that T is a subsequence of W.
 
 If there is no such window in S that covers all characters in T, return the empty string "". If there are multiple such minimum-length windows, return the one with the left-most starting index.
 */


func minWindow(_ str1: String, _ str2: String) -> String {
    var size_s1 = str1.count , size_s2 = str2.count
    var min_window_length = Int.max
    var min_window_subsequence = ""
    var index_s1 = 0, index_s2 = 0
    while index_s1 < size_s1 {
        if str1[str1.index(str1.startIndex, offsetBy: index_s1)] ==  str2[str2.index(str2.startIndex, offsetBy: index_s2)] {
            index_s2 += 1
            if index_s2 == size_s2 {
                var start = index_s1, end = index_s1
                index_s2 -= 1
                while index_s2 >= 0 {
                    if str1[str1.index(str1.startIndex, offsetBy: start)] ==  str2[str2.index(str2.startIndex, offsetBy: index_s2)] {
                        index_s2 -= 1
                    }
                    start -= 1
                }
                start += 1
                if end - start < min_window_length {
                    min_window_length = end - start
                    min_window_subsequence = String(str1[str1.index(str1.startIndex, offsetBy: start)...str1.index(str1.startIndex, offsetBy: end)])
                }
                index_s1 = start
                index_s2 = 0
            }
        }
        index_s1 += 1
    }
    return min_window_subsequence
}

print("minWindow example 1:- \(minWindow("abcdedeaqdweq", "adeq"))" )
print("minWindow example 2:- \(minWindow("fgrqsqsnodwmxzkzxwqegkndaa", "kzed"))" )
print("minWindow example 3:- \(minWindow("zxcvnhss", "css"))" )
print("minWindow example 4:- \(minWindow("beta", "ab"))" )
