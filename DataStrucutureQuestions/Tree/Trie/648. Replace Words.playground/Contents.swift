import UIKit

//https://leetcode.com/problems/replace-words/description/
class TrieNode {
    
    var value: Character?
    var children = [Character: TrieNode]()
    var isWord = false
    
    init(_ value: Character? = nil) { self.value = value }
    
    func addChild(_ char: Character) -> TrieNode {
        if let node = children[char] { return node }
        children[char] = TrieNode(char)
        return children[char]!
    }
    
    func getChild( _ char: Character) -> TrieNode? { children[char] }
}

class Trie {
    
    var root = TrieNode()
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty { return }
        var node = root
        for char in word { node = node.addChild(char) }
        node.isWord = true
    }
    
    func searchRoot(_ successor: String) -> String? {
        if successor.isEmpty { return nil }
        var node = root
        
        var result = ""
        
        for char in successor {
            if let nextNode = node.getChild(char){
                result.append(nextNode.value!)
                if nextNode.isWord { return result }
                node = nextNode
            } else { return nil }
        }
        
        return nil
    }
}

class Solution {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let trie = Trie()
        dictionary.forEach(trie.insert)
        
        var words = sentence
            .split(separator: " ")
            .map(String.init)
        
        for index in 0..<words.count { if let root = trie.searchRoot(words[index]) { words[index] = root } }
        
        return words
            .joined(separator: " ")
    }
    
}
