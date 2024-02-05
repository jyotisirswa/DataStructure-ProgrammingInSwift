import UIKit

//https://leetcode.com/problems/pascals-triangle/description/
//Time complexity: O(numRows^2)
//Space complexity: O(numRows^2) space is used to store the output, the input and output generally do not count towards the space complexity.

func generate(_ numRows: Int) -> [[Int]] {
    var res = [[1]]
    for _ in 0..<(numRows - 1) {
        var temp = [0] + res[res.count - 1] + [0] //res[res.count - 1]  = res.last
        var rows = [Int]()
        for j in 0..<res[res.count - 1].count + 1 { //res[res.count - 1].count = res.last.count
            rows.append(temp[j] + temp[j+1])
        }
        res.append(rows)
    }
    return res
}

print(generate(5))

