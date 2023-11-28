import UIKit

//https://leetcode.com/problems/where-will-the-ball-fall/

//Time complexity :- O(m * n) Here, mis the number of rows, and n is the number of columns.
//SpaceComplexity : O(1)

func findBall(_ grid: [[Int]]) -> [Int] {
    var result = Array(repeating: -1, count: grid[0].count)
    
    for col in 0..<grid[0].count {
        var current_col = col
        
        for row in 0..<grid.count {
            let next_col = current_col + grid[row][current_col]
            
            if next_col < 0 || next_col > grid[0].count - 1 || grid[row][current_col] != grid[row][next_col] {
                break
            }
            if row == grid.count - 1 {
                result[col] = next_col
            }
            current_col = next_col
        }
    }
    return result
}
print("--FIND BALL FALL EXAMPLE--")
print(findBall([[1,1,1,-1,-1],[1,1,1,-1,-1],[-1,-1,-1,1,1],[1,1,1,1,-1],[-1,-1,-1,-1,-1]]))
print(findBall([[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1],[1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1]]))

