import UIKit

//https://leetcode.com/problems/gas-station/?envType=study-plan-v2&envId=top-interview-150

/*
 Algorithm

 Initialize curr_gain, total_gain and answer to 0.

 Traverse through gas and cost. For each index i, increment total_gain and curr_gain by gas[i] - cost[i].

 If curr_gain is smaller than 0, we will test if station i + 1 is a valid starting station by setting answer as i + 1, resetting curr_gain to 0, and repeating step 2.

 When the iteration is complete, if total_gain is smaller than 0, return -1. Otherwise, return answer.
 */

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
     var answer = 0
     var totalGain = 0, currGain = 0
     for index in 0..<gas.count {
         totalGain += (gas[index] - cost[index])
         currGain += (gas[index] - cost[index])
         if currGain < 0 {
             currGain = 0
             answer = index + 1
         }
     }
    return totalGain >= 0 ? answer : -1
}
print("starting gas station's index is :- \(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))")
print("starting gas station's index is :- \(canCompleteCircuit([2,3,4], [3,4,3]))")
