import UIKit

//https://leetcode.com/problems/pascals-triangle-ii/description/
//( n - r + 1)/r
//Time complexity : O(k). Each term is calculated once, in constant time.
//Space complexity : O(k). No extra space required other than that required to hold the output.

func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    }
    var ans: [Int] = [1]
    for k in 1...rowIndex {
        ans.append((ans.last! * (rowIndex - k + 1)) / k)
    }
    return ans
}
print(getRow(3))
print(getRow(0))
