

class TrieNode<Key : Hashable>{
    var key : Key?
    weak var parent : TrieNode?
    var children : [Key : TrieNode] = [:]
    var isTerminating = false
    
    init(key: Key?, parent : TrieNode?) {
        self.key = key
        self.parent = parent
    }
}

class Trie<CollectionType : Collection & Hashable> where CollectionType.Element : Hashable {
    typealias Node = TrieNode<CollectionType.Element>
    private var root = Node(key: nil, parent: nil)
    public init() {}
    
    public func insert(collection : CollectionType) {
        var current = root
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        current.isTerminating = true
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
}

let trie = Trie<String>()
trie.insert(collection: "cute")
 if trie.contains("cute") {
     print("cute is in the trie")
 }
