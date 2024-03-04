import UIKit

//https://leetcode.com/problems/rotate-image/


func rotate(_ matrix: inout [[Int]]) {
     var left = 0
     var right = matrix.count - 1
     while left < right {
         for i in 0..<(right - left) {
             let top = left
             let bottom = right
             //save top left value in temp variable
             let topLeft = matrix[top][left + i]
             //save bottom left to top left
             matrix[top][left + i] = matrix[bottom - i][left]
             //save bottom right to bottom left
             matrix[bottom - i][left] = matrix[bottom][right - i]
             //save top right to bottom right
             matrix[bottom][right - i] = matrix[top + i][right]
             //save temporary variable to top right
             matrix[top + i][right] = topLeft
         }
         left += 1
         right -= 1
     }
 }

var rotateImage = [[1,2,3],[4,5,6],[7,8,9]]
print(rotateImage)
print(rotate(&rotateImage))
print(rotateImage)
