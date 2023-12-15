import UIKit

//https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/

func findMinArrowShots(_ points: [[Int]]) -> Int {
    var pointsSorted = points.sorted(by: { $0[1] < $1[1] })
    var end = pointsSorted[0][1]
    var arrows = 1

    
    for point in pointsSorted {
        if point[0] > end {
            arrows += 1
            end = point[1]
        }
    }
    
    return arrows
}


print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
