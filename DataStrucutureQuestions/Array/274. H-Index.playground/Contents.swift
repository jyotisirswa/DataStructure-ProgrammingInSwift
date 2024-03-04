import UIKit

//https://leetcode.com/problems/h-index/description/?envType=study-plan-v2&envId=top-interview-150

//O(nlogn)
func hIndex(_ citations: [Int]) -> Int {
    let sortedCitations = citations.sorted { $0 > $1 }
     var i = 0
     var hIndex = 0
     while i < sortedCitations.count {
         if  sortedCitations[i] > i {
             hIndex += 1
         }
         i += 1
     }
     return hIndex
}

// O(n)
func hIndexApproachTwo(_ citations: [Int]) -> Int {
    let n = citations.count
    var papers = Array(repeating: 0, count: n + 1)
    
    for c in citations {
        if c >= n {
            papers[n] += 1
        } else {
            papers[c] += 1
        }
    }
    var count = 0
    for i in stride(from: n, through: 0, by: -1) {
        count += papers[i]
        if count >= i {
            return i
        }
    }
    return 0
}

print(hIndexApproachTwo([3,0,6,1,5]))
print(hIndexApproachTwo([1,3,1]))
