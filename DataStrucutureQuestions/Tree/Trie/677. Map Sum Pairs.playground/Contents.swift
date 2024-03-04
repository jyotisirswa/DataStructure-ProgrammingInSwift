import UIKit

//https://leetcode.com/problems/map-sum-pairs/description/

class MapSum {
    
    class TrieNode {
        var isTerminating = false
        var key : Character?
        var value : Int
        var parent : TrieNode?
        var children = [Character : TrieNode]()
        init(key: Character?, parent : TrieNode?, value : Int) {
        self.key = key
        self.parent = parent
        self.value = value
    }
    }
    private var map = [String: Int]()
    var root = TrieNode(key: nil, parent: nil, value : 0)


    init() {
        root = TrieNode(key: nil, parent: nil, value: 0)
    }
    
    func insert(_ key: String, _ val: Int) {
        let delta = val - (self.map[key] ?? 0)
        self.map[key] = val
        var current = root
        for element in key {
            if current.children[element] == nil {
                current.children[element] = TrieNode(key: element, parent: current, value: 0)
            }
            current = current.children[element]!
            current.value += delta
        }
        current.isTerminating = true
    }
    
    func sum(_ prefix: String) -> Int {
        var currentNode = root
        for character in prefix {
            guard let child =  currentNode.children[character] else {
                return 0
            }
            currentNode = currentNode.children[character]!
        }
        return currentNode.value
    }
    

}

var trieObj = MapSum()
trieObj.insert("apple", 3)
print(trieObj.sum("ap"))
trieObj.insert("app", 2)
trieObj.insert("apple", 2)
print(trieObj.sum("ap"))
