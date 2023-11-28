import UIKit

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var lowerIndex = 0, higherIndex = numbers.count - 1
    while lowerIndex < higherIndex {
        if numbers[lowerIndex] + numbers[higherIndex] > target {
            higherIndex -= 1
        } else if numbers[lowerIndex] + numbers[higherIndex] < target {
            lowerIndex += 1
        } else {
            return [lowerIndex + 1, higherIndex + 1]
        }
    }
    return []
}

print("\(twoSum([2,7,11,15], 9))")
print("\(twoSum([2,3,4], 6))")
print("\(twoSum([-1,0], -1))")
