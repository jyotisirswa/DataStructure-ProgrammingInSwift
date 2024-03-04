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
        print("integer number for \(currentCharacter) is \(integerNumber)")
    }
    integerNumber += romanToInt[s.last!]!
    return integerNumber
}

func romanToIntApproachTwo(_ s: String) -> Int {
    let values: [String: Int] = [
        "I": 1, "IV": 4, "V": 5, "IX": 9,
        "X": 10, "XL": 40, "L": 50, "XC": 90,
        "C": 100, "CD": 400, "D": 500, "CM": 900,
        "M": 1000
    ]
    var total = 0
    var i = s.startIndex
    
    while i < s.endIndex {
        let nextIndex = s.index(i, offsetBy: 1, limitedBy: s.endIndex) ?? s.endIndex
        let nextNextIndex = s.index(i, offsetBy: 2, limitedBy: s.endIndex) ?? s.endIndex
        
        let oneChar = String(s[i..<nextIndex])
        let twoChar = nextNextIndex > nextIndex ? String(s[i..<nextNextIndex]) : ""
        
        if let value = values[twoChar] {
            total += value
            i = nextNextIndex
        } else if let value = values[oneChar] {
            total += value
            i = nextIndex
        }
    }
    
    return total
}

//print("Roman to integer conversion of III is :- \(romanToInt("III"))")
//print("Roman to integer conversion of LVIII is :- \(romanToInt("LVIII"))")
print("Roman to integer conversion of MCMXCIV is :- \(romanToInt("MCMXCIV"))")
//print("Roman to integer conversion of III is :- \(romanToIntApproachTwo("III"))")
//print("Roman to integer conversion of LVIII is :- \(romanToIntApproachTwo("LVIII"))")
//print("Roman to integer conversion of MCMXCIV is :- \(romanToIntApproachTwo("MCMXCIV"))")
