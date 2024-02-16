import UIKit

//https://leetcode.com/problems/number-of-islands/
/*
 Time complexity : O(M×N) where MMM is the number of rows and
 NNN is the number of columns.

 Space complexity : O(min(M,N) because in worst case where the
 grid is filled with lands, the size of queue can grow up to min(M,NM,NM,N).
 */

func numIslands(_ grid: inout [[Character]]) -> Int {
    var num_islands = 0
    var directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
    let rows = grid.count
    let cols = grid[0].count
    
    for row in 0..<rows {
        for col in 0..<cols {
            if let valueOFIsland = Int(String(grid[row][col])), valueOFIsland == 1 {
                num_islands += 1
                grid[row][col] = "0"
                var queue = [(Int, Int)]()
                queue.append((row,col))
                while !queue.isEmpty {
                    var current = queue.removeFirst()
                    for direction in directions {
                        let nextPosition = (row : current.0 + direction.0, col : current.1 + direction.1)
                        print("nextPosition = \(nextPosition)")
                        if nextPosition.row >= 0 && nextPosition.0 < rows && nextPosition.1 >= 0 && nextPosition.1 < cols && grid[nextPosition.0][nextPosition.1] == "1"  {
                            queue.append(nextPosition)
                            grid[nextPosition.row][nextPosition.col] = "0"
                        }
                    }
                    
                }
            }
        }
    }
    return num_islands
}


class Solution {
    func numIslands(_ grid: inout [[Character]]) -> Int {
        let nr = grid.count
        if nr == 0 { return 0 }
        let nc = grid[0].count
        var num_islands = 0
        
        for r in 0..<nr {
            for c in 0..<nc {
                if grid[r][c] == "1" {
                    num_islands += 1
                    grid[r][c] = "0"
                    var neighbors = Queue<(Int, Int)>()
                    neighbors.enqueue((r, c))
                    while !neighbors.isEmpty {
                        let rc = neighbors.dequeue()!
                        let row = rc.0, col = rc.1
                        if row - 1 >= 0 && grid[row - 1][col] == "1" {
                            neighbors.enqueue((row - 1, col))
                            grid[row - 1][col] = "0"
                        }
                        if row + 1 < nr && grid[row + 1][col] == "1" {
                            neighbors.enqueue((row + 1, col))
                            grid[row + 1][col] = "0"
                        }
                        if col - 1 >= 0 && grid[row][col - 1] == "1" {
                            neighbors.enqueue((row, col - 1))
                            grid[row][col - 1] = "0"
                        }
                        if col + 1 < nc && grid[row][col + 1] == "1" {
                            neighbors.enqueue((row, col + 1))
                            grid[row][col + 1] = "0"
                        }
                    }
                }
            }
        }
        return num_islands
    }
}

// Queue implementation
struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
}

var matrix : [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]] //[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
print(numIslands(&matrix))
