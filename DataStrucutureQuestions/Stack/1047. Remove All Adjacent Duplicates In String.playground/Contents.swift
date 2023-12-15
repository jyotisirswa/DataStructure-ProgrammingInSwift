import UIKit

//https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/description/

func removeDuplicates(_ s: String) -> String {
     var operationStack = [Character]()
    
    for character in s {
        if operationStack.last == character {
            operationStack.popLast()
        } else {
            operationStack.append(character)
        }
    }
    
    return String(operationStack)
}

print(removeDuplicates("abbaca"))
