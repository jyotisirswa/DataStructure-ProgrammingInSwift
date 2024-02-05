import UIKit

//https://leetcode.com/problems/spiral-matrix/description/

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var rows = matrix.count
    var cols = matrix[0].count
    var row = 0
    var col = -1
    var direction = 1
    var result = [Int]()
    
    while rows > 0 && cols > 0 {
        for _ in 0..<cols {
            col += direction
            result.append(matrix[row][col])
        }
        rows -= 1
        for _ in 0..<rows {
            row += direction
            result.append(matrix[row][col])
        }
        cols -= 1
        direction *= -1
    }
    return result
}

print(spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
print(spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]))
