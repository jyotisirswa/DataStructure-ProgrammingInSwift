import UIKit

//https://leetcode.com/problems/integer-to-roman/
/*
 Complexity Analysis

 Time complexity : O(1).

 As there is a finite set of roman numerals, there is a hard upper limit on how many times the loop can iterate. This upper limit is 15 times, and it occurs for the number 3888, which has a representation of MMMDCCCLXXXVIII. Therefore, we say the time complexity is constant, i.e. O(1)O(1)O(1).

 Space complexity : O(1).

 The amount of memory used does not change with the size of the input integer, and is therefore constant.
 */

func intToRoman(_ num: Int) -> String {
   let arrayOfRomanKeys = [["M": 1000], ["CM": 900], ["D": 500], ["CD": 400],
                            ["C": 100], ["XC": 90], ["L": 50], ["XL": 40], ["X": 10],
                            ["IX": 9], ["V": 5], ["IV": 4], ["I": 1]]

   var output = ""
   var num = num
   for (_, dictionary) in arrayOfRomanKeys.enumerated() {
       output += String(repeating: dictionary.keys.first!, count: num / dictionary.values.first!)
       if num / dictionary.values.first! != 0 {
           num = num % dictionary.values.first!
          // num -=  dictionary.values.first! * (num / dictionary.values.first!)
       }
   }

   return output
}
print("Interger to Roman conversion of 3 = \(intToRoman(3))")
print("Interger to Roman conversion of 58 = \(intToRoman(58))")
print("Interger to Roman conversion of 1994 = \(intToRoman(1994))")
print("Interger to Roman conversion of 3888 = \(intToRoman(3888))")

