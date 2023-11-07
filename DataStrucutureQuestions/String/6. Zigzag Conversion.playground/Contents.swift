import UIKit

//https://leetcode.com/problems/zigzag-conversion/description/?envType=study-plan-v2&envId=top-interview-150

func convert(_ s: String, _ numRows: Int) -> String {
    if numRows == 1 {
        return s
    }
    var res = ""
    let increment = 2 * (numRows - 1)
    //print("increament = \(increment)")
    for r in 0..<numRows {
        var i = r
        //print("in for loop i = \(i)")
        //print("in for loop r = \(r)")
        while i < s.count {
            //print("in while loop i = \(i)")
            res += String(s[s.index(s.startIndex, offsetBy: i)])
            //print("in while loop res = \(res)")
            if r > 0 && r < numRows - 1 && i + increment - 2 * r < s.count {
                res += String(s[s.index(s.startIndex, offsetBy: i + increment - 2 * r)])
                //print("in if condition res = \(res)")
            }
            i += increment
        }
    }
    return res
}

print("ZigZag conversion of PAYPALISHIRING is :-  \(convert("PAYPALISHIRING", 3))")
print("ZigZag conversion of PAYPALISHIRING is :-  \(convert("PAYPALISHIRING", 4))")
