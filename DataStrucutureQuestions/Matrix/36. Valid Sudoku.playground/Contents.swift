import UIKit

//https://leetcode.com/problems/valid-sudoku/description/

func isValidSudoku(_ board: [[Character]]) -> Bool {
   var col = [Int : Set<Character>]()
   var row = [Int : Set<Character>]()
   var square = [Int : Set<Character>]() //keys r/3 * 3 + c/3
   
    for r in 0..<9 {
       for c in 0..<9 {
           let value = board[r][c]
           if value == "." {
               continue
           }
           if row[r]?.contains(value) == true || col[c]?.contains(value) == true || square[(r/3)*3 + c/3]?.contains(value) == true {
               return false
           }
           row[r, default: Set<Character>()].insert(value)
           col[c, default: Set<Character>()].insert(value)
           square[(r/3)*3 + c/3, default: Set<Character>()].insert(value)
       }
   }
    return true
}

print(isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]))
