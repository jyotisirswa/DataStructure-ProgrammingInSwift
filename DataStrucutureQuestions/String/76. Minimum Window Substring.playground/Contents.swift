import UIKit

func minWindow(_ s: String, _ t: String) -> String {
    if t == "" {
        return ""
    }
    var reqCount: [Character: Int] = [:]
    var window: [Character: Int] = [:]
    for c in t {
        reqCount[c] = 1 + reqCount[c, default: 0]
    }
    for c in t {
        window[c] = 0
    }
    var current = 0
    let required = reqCount.count
    var res: [Int] = []
    var resLen = Int.max
    var left = 0
    let s = Array(s)
    for right in 0..<s.count {
        let c = s[right]
        if t.contains(c) {
            window[c] = 1 + (window[c] ?? 0)
        }
        if let count = reqCount[c], window[c] == count {
            current += 1
        }
        while current == required {
            if (right - left + 1) < resLen {
                res = [left, right]
                resLen = (right - left + 1)
            }
            if t.contains(s[left]) {
                window[s[left], default: 0] -= 1
            }
            
            if let count = reqCount[s[left]], let windowCount = window[s[left]] {
                if windowCount < count {
                    current -= 1
                }
            }
            left += 1
        }
    }
    let firstIndex = res[0]
    let secondIndex = res[1]
    if resLen != Int.max {
        return String(s[firstIndex...secondIndex])
    } else {
        return ""
    }
}

print(minWindow("PATTERN", "TN"))
print(minWindow("ADOBECODEBANC", "ABC"))
