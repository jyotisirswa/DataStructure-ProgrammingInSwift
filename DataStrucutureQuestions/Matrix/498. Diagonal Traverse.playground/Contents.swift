import UIKit

//https://leetcode.com/problems/diagonal-traverse/description/

func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty || matrix[0].isEmpty {
        return []
    }
    
    let rows = matrix.count
    let columns = matrix[0].count
    
    var result = [Int]()
    var intermediate = [Int]()
    
    for diagonal in 0..<(rows + columns - 1) {
        intermediate.removeAll()
        print("diagonal =\(diagonal)")
        var row = diagonal < columns ? 0 : diagonal - columns + 1
        var column = diagonal < columns ? diagonal : columns - 1
        print("\(row) \(column)")
        while row < rows && column >= 0 {
            intermediate.append(matrix[row][column])
            row += 1
            column -= 1
            print("Inner \(row) \(column)")
        }
        
        if diagonal % 2 == 0 {
            result.append(contentsOf: intermediate.reversed())
        } else {
            result.append(contentsOf: intermediate)
        }
    }
    return result
}

print(findDiagonalOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))


func findDiagonalOrderTwo(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty || matrix[0].isEmpty {
        return []
    }
    
    let rows = matrix.count
    let columns = matrix[0].count
    
    var row = 0
    var column = 0
    var direction = 1
    var result = [Int]()
    
    while row < rows && column < columns {
        result.append(matrix[row][column])
        let new_row = row + (direction == 1 ? -1 : 1)
        let new_column = column + (direction == 1 ? 1 : -1)
        
        if new_row < 0 || new_row == rows || new_column < 0 || new_column == columns {
            if direction == 1 {
                row += (column == columns - 1) ? 1 : 0
                column += (column < columns - 1) ? 1 : 0
            } else {
                column += (row == rows - 1) ? 1 : 0
                row += (row < rows - 1) ? 1 : 0
            }
            direction = 1 - direction
        } else {
            row = new_row
            column = new_column
        }
    }
    return result
}



