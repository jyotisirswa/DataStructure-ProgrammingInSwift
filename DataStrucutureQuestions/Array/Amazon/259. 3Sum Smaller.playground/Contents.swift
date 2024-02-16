import UIKit

//https://leetcode.com/problems/3sum-smaller/description/

func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    var cnt = 0
    var numsS = nums.sorted()
    for i in 0..<n {
        let num = numsS[i]
        var start = i+1
        var end = n-1
        while start < end {
            print("end = \(end)")
            print("start = \(start)")
            let sum = numsS[start] + numsS[end] + num
            print("sum = \(sum)")
            if sum < target {
                cnt += end - start
                print("count = \(cnt)")
                start += 1
            } else {
                end -= 1
            }
        }
    }
    return cnt
}

print(threeSumSmaller([1,2,3,4,5,6], 9))
