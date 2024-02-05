import UIKit

//https://leetcode.com/problems/add-binary/description/
//Time Complexity : O(max(N,M))
//Space Complexity : O(max(N,M))

func addBinary(_ a: String, _ b: String) -> String {
    let length = max(a.count, b.count)
    let firstString = String(a.reversed()).padding(toLength: length, withPad: "0", startingAt: 0)
    let secondString = String(b.reversed()).padding(toLength: length, withPad: "0", startingAt: 0)
    print("firstString = \(firstString)")
    print("secondString = \(secondString)")
    var carry = 0
    var answer = [String]()
    for i in 0..<length {
        if firstString[firstString.index(firstString.startIndex, offsetBy: i)] == "1" {
            carry += 1
        }
        if secondString[secondString.index(secondString.startIndex, offsetBy: i)] == "1" {
            carry += 1
        }
        print("carry b4 = \(carry)")
        answer.append((carry % 2 == 1) ? "1" : "0")
        print("answer = \(answer)")
        carry /= 2
        print("carry = \(carry)")
    }
    print("carry outer = \(carry)")
    if carry == 1 {
        answer.append("1")
    }
    return answer.reversed().joined()
}

func addBinaryBitwise(_ a: String, _ b: String) -> String {
    var x = Int(a, radix: 2) ?? 0
    var y = Int(b, radix: 2) ?? 0
    print("x = \(x)")
    print("y = \(y)")
    while y != 0 {
        let answer = x ^ y
        print("answer = \(answer)")
        print((x & y))
        let carry = (x & y) << 1
        print("carry = \(carry)")
        x = answer
        print("x = \(x)")
        y = carry
        print("y = \(y)")

    }
    return String(x, radix: 2)
}

print(addBinary("11", "1"))
print(addBinary("1011", "1011"))
print(addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"))
