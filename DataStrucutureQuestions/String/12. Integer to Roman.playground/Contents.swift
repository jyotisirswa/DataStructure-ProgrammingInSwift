import UIKit

//https://leetcode.com/problems/integer-to-roman/
//TimeComplexity : O(n)

func intToRoman(_ num: Int) -> String {
   let arrayOfRomanKeys = [["M": 1000], ["CM": 900], ["D": 500], ["CD": 400],
                            ["C": 100], ["XC": 90], ["L": 50], ["XL": 40], ["X": 10],
                            ["IX": 9], ["V": 5], ["IV": 4], ["I": 1]]

   var output = ""
   var num = num
   for (_, dictionary) in arrayOfRomanKeys.enumerated() {
       output += String(repeating: dictionary.keys.first!, count: num / dictionary.values.first!)
       if num / dictionary.values.first! != 0 {
           num -= dictionary.values.first! * (num / dictionary.values.first!)
       }
   }

   return output
}
print("Interger to Roman conversion of 3 = \(intToRoman(3))")
print("Interger to Roman conversion of 58 = \(intToRoman(58))")
print("Interger to Roman conversion of 1994 = \(intToRoman(1994))")

