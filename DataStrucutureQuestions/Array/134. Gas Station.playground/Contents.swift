import UIKit

//https://leetcode.com/problems/gas-station/?envType=study-plan-v2&envId=top-interview-150

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
     var result = 0
     var total = 0
     if  gas.reduce(0, +) < cost.reduce(0, +) {
         return -1
     }
     for index in 0..<gas.count {
         total += (gas[index] - cost[index])
         if total < 0 {
             total = 0
             result = index + 1
         }
     }
     return result
}

print("starting gas station's index is :- \(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))")
print("starting gas station's index is :- \(canCompleteCircuit([2,3,4], [3,4,3]))")
