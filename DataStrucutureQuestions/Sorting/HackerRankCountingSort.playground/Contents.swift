import UIKit

//Function with O(n) complexity to get counting sort :- https://www.hackerrank.com/challenges/one-week-preparation-kit-countingsort1/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=one-week-preparation-kit&playlist_slugs%5B%5D=one-week-day-two&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen


func countingSort(arr: [Int]) -> [Int] {
    // Write your code here
    var arrayOfOccurance = [Int](repeating: 0, count: 100)
    
    for element in arr {
      arrayOfOccurance[element] += 1
    }
    return arrayOfOccurance
}

let array = [1, 1, 3, 2, 1]
print(countingSort(arr: array))

