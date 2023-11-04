import UIKit

//https://leetcode.com/problems/roman-to-integer/description/?envType=study-plan-v2&envId=top-interview-150

func romanToInt(_ s: String) -> Int {
    var romanToInt : [Character : Int] = [ "I": 1,
                                           "V": 5,
                                           "X": 10,
                                           "L": 50,
                                           "C": 100,
                                           "D": 500,
                                           "M": 1000]
    var integerNumber = 0
    for i in 0..<s.count-1 {
        let currentCharacter = s[s.index(s.startIndex, offsetBy: i)]
        let nextCharacter = s[s.index(s.startIndex, offsetBy: i + 1)]
        if romanToInt[currentCharacter]! >= romanToInt[nextCharacter]! {
            integerNumber += romanToInt[currentCharacter]!
        }
        else {
            integerNumber -= romanToInt[currentCharacter]!
        }
    }
    integerNumber += romanToInt[s.last!]!
    return integerNumber
}
print("Roman to integer conversion of III is :- \(romanToInt("III"))")
print("Roman to integer conversion of LVIII is :- \(romanToInt("LVIII"))")
print("Roman to integer conversion of MCMXCIV is :- \(romanToInt("MCMXCIV"))")
