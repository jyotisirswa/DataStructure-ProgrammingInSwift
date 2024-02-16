import UIKit

//https://leetcode.com/problems/walls-and-gates/description/
//time complexity O(m*n)
//Space complexity O(m*n) The space complexity depends on the queue's size. We insert at most m×n points into the queue.

func wallsAndGates(_ rooms: inout [[Int]]) {
     var emptyRoomValue = 2147483647
     var directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
    
    var rows = rooms.count
    var columns = rooms[0].count
    var queue = [(Int, Int)]()
    for row in 0..<rows {
        for colum in 0..<columns {
            if rooms[row][colum] == 0 {
                queue.append((row, colum))
            }
        }
    }
    
    var distance = 0
    while !queue.isEmpty {
        var lengthOfQueue = queue.count
        distance += 1
        for _ in 0..<lengthOfQueue {
            let current = queue.removeFirst()
            for direction in directions {
                let nextPosition = (row : current.0 + direction.0, col : current.1 + direction.1)
                if nextPosition.row >= 0 && nextPosition.row < rows && nextPosition.col >= 0 && nextPosition.col < columns && rooms[nextPosition.row][nextPosition.col] == emptyRoomValue {
                    rooms[nextPosition.row][nextPosition.col] = distance
                    queue.append((nextPosition.row, nextPosition.col))
                }
            }
        }
    }
}
var matrix = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
print("mextrix before calculation is : \(matrix)")
print(wallsAndGates(&matrix))
print("mextrix after calculation of distance from empty room to gate is : \(matrix)")
