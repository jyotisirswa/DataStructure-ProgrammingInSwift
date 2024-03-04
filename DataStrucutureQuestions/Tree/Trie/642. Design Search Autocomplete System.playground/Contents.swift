
//https://leetcode.com/problems/implement-trie-prefix-tree/description/

/*
 Each time we call input(c), there are 3 possibilities:

 c == '#': We have finished typing the current sentence. Add currSentence as a string to the trie using the addToTrie function, and reset our class variables in preparation for the next sentence. Empty currSentence and set currNode = root, then return an empty list.
 c != '#', and c is a child of currNode: there are some existing sentences that have the current sentence we are typing as a prefix. First, let's add c to currSentence. Next, walk to the child node by doing currNode = currNode.children[c]. Now, fetch the sentences that have the current sentence as a prefix - we store them in the hash map currNode.sentences with the mapping sentence: count. Finally, sort these sentences according to their count, and return the top 3 sentences according to the criteria in the problem description.
 c != '#', but c is not a child of currNode: there are no existing sentences that have the current sentence we are typing as a prefix. We just need to add c to currSentence and return an empty list.
 */

/*
 Algorithm

 Create a TrieNode class with two attributes:
 children, a hash map that maps characters to TrieNode.
 sentences, a hash map that maps strings to integers.
 Create the function addToTrie(sentence, count) that adds sentence to the trie count times.
 AutocompleteSystem is initialized with the following attributes:
 root of type TrieNode, the root of our trie.
 currNode of type TrieNode, the current node we are located at in our trie.
 dead of type TrieNode, a dummy node.
 currSentence of type StringBuilder or list, depending on the language. This is the current sentence we are typing.
 In the constructor of AutocompleteSystem, call addToTrie(sentences[i], times[i]) for each index i.
 In input(c):
 If c == '#', convert currSentence to a string and add it to the trie with addToTrie. Reset currSentence and currNode to the root. Return an empty array.
 Otherwise, add c to currSentence. Now, check if c is in currNode.children.
 If it isn't, set currNode = dead and return an empty array.
 If it is, move currNode to the child with currNode = currNode.children[c]. Next, fetch the sentences in currNode.sentences, sort them, and return the top 3.
 */

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var sentences: [String: Int] = [:]
}

class AutocompleteSystem {
    private var root: TrieNode
    private var currSentence: [Character]
    private var currNode: TrieNode
    private var dead: TrieNode
    
    init(_ sentences: [String], _ times: [Int]) {
        self.root = TrieNode()
        self.currSentence = []
        self.currNode = self.root
        self.dead = TrieNode()
        
        for (sentence, count) in zip(sentences, times) {
            self.addToTrie(sentence: sentence, count: count)
        }
    }
    
    func input(_ c: Character) -> [String] {
        if c == "#" {
            let currSentenceStr = String(self.currSentence)
            self.addToTrie(sentence: currSentenceStr, count: 1)
            self.currSentence = []
            self.currNode = self.root
            return []
        }
        self.currSentence.append(c)
        guard let nextNode = self.currNode.children[c] else {
            self.currNode = self.dead
            return []
        }
        self.currNode = nextNode
        let sentences = self.currNode.sentences
        let sortedSentences = sentences.sorted { $0.value > $1.value || ($0.value == $1.value && $0.key < $1.key) }
        return Array(sortedSentences.prefix(3).map { $0.key })
    }
    
    private func addToTrie(sentence: String, count: Int) {
        var node = self.root
        for c in sentence {
            if node.children[c] == nil {
                node.children[c] = TrieNode()
            }
            node = node.children[c]!
            node.sentences[sentence, default: 0] += count
        }
    }
}

var trieObj = AutocompleteSystem(["i love you","island","iroman","i love leetcode"], [5,3,2,2])
let char : Character = "i"
print(trieObj.input(char))
print(trieObj.input(Character("#")))
