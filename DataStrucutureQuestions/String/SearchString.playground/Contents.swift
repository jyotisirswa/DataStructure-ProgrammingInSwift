import UIKit

//Brute Force It!
var greeting = "Hello, playground"


extension String {
    //1
    func index(of pattern: String) -> Index? {
      // 1
      for i in indices {
        // 2
        var j = i
        var found = true
        for p in pattern.indices {
          guard j != endIndex && self[j] == pattern[p] else { found = false; break }
          j = index(after: j)
        }
        if found {
            return i
        }
      }
      return nil
    }
    
    //Boyer Moore String Search
    func indexTwo(of pattern: String) -> Index? {
      return nil
    }
    
    
    fileprivate var skipTable: [Character: Int] {
      var skipTable: [Character: Int] = [:]
      for (i, c) in enumerated() {
        skipTable[c] = count - i - 1
      }
      return skipTable
    }
}

let text = "Hello World"
if let indexObj = text.index(of: "Wo") {
    print(indexObj.utf16Offset(in: text))
}
print(text.index(of: "ld")?.utf16Offset(in: text) ?? 0)
text.skipTable.forEach{print($0)}
print(text.count)

