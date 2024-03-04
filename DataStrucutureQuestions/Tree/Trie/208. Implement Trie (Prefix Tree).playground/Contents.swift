import UIKit

//https://leetcode.com/problems/implement-trie-prefix-tree/description/

/*
 Time Complexity
 The time complexity to search in hash table is typically O(1), but will be O(logN) in the worst time if there are too many collisions and we solve collisions using height-balanced BST.
 The time complexity to search in Trie is O(M).
 The hash table wins in most cases.

 Space Complexity
 The space complexity of hash table is O(M * N). If you want hash table to have the same function with Trie, you might need to store several copies of the key. For instance, you might want to store "a", "ap", "app", "appl" and also "apple" for a keyword "apple" in order to search by prefix. The space complexity can be even much larger in that case.

 The space complexity of Trie is O(M * N) as we estimated above. But actually far smaller than the estimation since there will be a lot of words have the similar prefix in real cases.

 Trie wins in most cases.
 */

class Trie {
    class TrieNode {
        var isTerminating = false
        var key : Character?
        var parent : TrieNode?
        var children = [Character : TrieNode]()
        init(key: Character?, parent : TrieNode?) {
        self.key = key
        self.parent = parent
    }
    }
    var root = TrieNode(key: nil, parent: nil)
    
    init() {
        root = TrieNode(key: nil, parent: nil)
    }
    
    func insert(_ word: String) {
        var current = root
        for element in word {
            if current.children[element] == nil {
                current.children[element] = TrieNode(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        for character in word {
            guard let child =  currentNode.children[character] else {
                return false
            }
            currentNode = child
        }
        return currentNode.isTerminating
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        for character in prefix {
            guard let child =  currentNode.children[character] else {
                return false
            }
            currentNode = child
        }
        return true
    }
    
    private func collections(startingWith prefix: String,
                             after node: TrieNode) -> [String] {
        // 1
        var results: [String] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        // 2
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix,
                                                   after: child))
        }
        return results
    }
    
    func collections(startingWith prefix: String) -> [String]
    {
        // 1
        var current = root
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        
        // 2
        return collections(startingWith: prefix, after: current)
    }
}

var trieObj = Trie()
trieObj.insert("cute")
trieObj.insert("cuter")
trieObj.insert("cutest")
trieObj.insert("cutter")
trieObj.insert("bad")
trieObj.insert("devil")
print(trieObj.search("cuter"))
print(trieObj.startsWith("ev"))
print(trieObj.collections(startingWith: "cu"))
