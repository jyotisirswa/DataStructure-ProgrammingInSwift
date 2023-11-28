import UIKit

//https://leetcode.com/problems/set-matrix-zeroes/


func setZeroes(_ matrix: inout [[Int]]) {
    var rows = matrix.count
    var columns = matrix[0].count
    var fRow = false
    var fColumn = false
    
    for i in 0..<rows {
        if matrix[i][0] == 0 {
            fColumn = true
        }
    }
    
    for j in 0..<columns {
        if matrix[0][j] == 0 {
            fRow = true
        }
    }
    
    for row in 1..<rows {
        for col in 1..<columns {
            if matrix[row][col] == 0 {
                matrix[0][col] = 0
                matrix[row][0] = 0
            }
        }
    }
    
    for row in 1..<rows {
        if matrix[row][0] == 0 {
            for col in 1..<columns {
                matrix[row][col] = 0
            }
        }
    }
    
    for col in 1..<columns {
        if matrix[0][col] == 0 {
            for row in 1..<rows {
                matrix[row][col] = 0
            }
        }
    }
    
    if fColumn == true {
        for row in 0..<rows {
            matrix[row][0] = 0
        }
    }
    
    if fRow == true {
        for col in 0..<columns {
            matrix[0][col] = 0
        }
    }
}
var matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]//   [[1,1,1],[1,0,1],[1,1,1]]
setZeroes(&matrix)
print(matrix)
