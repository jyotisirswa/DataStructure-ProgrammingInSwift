import Foundation

extension Array where Element == Int {
    public mutating func radixSort() {
        // 1
        let base = 10
        // 2
        var done = false
        var digits = 1
        
        while !done {
            done = true
            // 1
            var buckets: [[Int]] = .init(repeating: [], count: base)
            // 2
            forEach {
                number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                if remainingPart > 0 {
                 done = false
                }
            }
            // 3
            digits *= base
            print(buckets)
            self = buckets.flatMap { $0 }
        }
    }
}
