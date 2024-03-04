import UIKit

//https://leetcode.com/problems/interval-list-intersections/description/

func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
     var interSectionIntervals = [[Int]]()
     var i = 0, j = 0
    
    while i < firstList.count && j < secondList.count {
        var start = max(firstList[i][0], secondList[j][0])
        var end = min(firstList[i][1], secondList[j][1])
        
        if start <= end {
            interSectionIntervals.append([start, end])
        }
        
        if firstList[i][1] < secondList[j][1] {
            print("i = \(i) for \(firstList[i]) & \(secondList[j]) ")
            i += 1
        } else {
            print("j = \(i) for \(firstList[i]) & \(secondList[j]) ")
            j += 1
        }
    }
    
    return interSectionIntervals
}

print(intervalIntersection([[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]]))
