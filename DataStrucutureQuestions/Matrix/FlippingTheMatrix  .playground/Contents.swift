import UIKit

func flippingMatrix(matrix : [[Int]]) -> Int {
    let n = matrix.count/2
    var sum = 0
    for i in 0..<n {
        for j in 0..<n {
            sum = sum + max(matrix[i][j], matrix[2 * n - i - 1][j], matrix[i][2 * n - j - 1], matrix[2 * n - i - 1][ 2 * n - j - 1])
        }
    }
    return sum
}

print(flippingMatrix(matrix: [[1, 2, 6], [3, 4, 8], [5, 6, 8]]))
