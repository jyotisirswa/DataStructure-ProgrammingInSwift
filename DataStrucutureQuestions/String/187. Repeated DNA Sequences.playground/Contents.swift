import UIKit

//https://leetcode.com/problems/repeated-dna-sequences/description/
//The average case time complexity of this solution is O(n), where n is the length of the input string.
func find_repeated_sequences(s: String, k: Int) -> [String] {
    let window_size = k
    if s.count <= window_size {
        return []
    }
    let base = 4
    let hi_place_value = pow(Double(base), Double(window_size - 1))
    let mapping: [Character: Int] = ["A": 1, "C": 2, "G": 3, "T": 4]
    var numbers: [Int] = []
    for char in s {
        numbers.append(mapping[char]!)
    }
    var hashing = 0
    var substring_hashes: Set<Int> = []
    var output: Set<String> = []
    for start in 0..<(s.count - window_size + 1) {
        if start != 0 {
            hashing = (hashing - numbers[start - 1] * Int(hi_place_value)) * base
                + numbers[start + window_size - 1]
        } else {
            for end in 0..<window_size {
                hashing = hashing * base + numbers[end]
            }
        }
        if substring_hashes.contains(hashing) {
            output.insert(String(s[s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: start + window_size)]))
        }
        substring_hashes.insert(hashing)
    }
    return Array(output)
}

print(find_repeated_sequences(s: "AAAAACCCCCAAAAACCCCCC", k: 10))
//print(pow(4.00, 9.00) + pow(4.00, 8.00) + pow(4.00, 7.00) + pow(4.00, 6.00) + pow(4.00, 5.00) + (pow(4.00, 4.00) * 2) + (pow(4.00, 3.00) * 2) + (pow(4.00, 2.00) * 2) + (pow(4.00, 1.00) * 2) + (pow(4.00, 0.00) * 2) )
print(find_repeated_sequences(s: "AGACCTAGAC", k: 10))
