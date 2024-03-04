import UIKit

public class TrieNode<Key: Hashable> {
    // 1
    public var key: Key?
    
    // 2
    public weak var parent: TrieNode?
    
    // 3
    public var children: [Key: TrieNode] = [:]
    // 4
    public var isTerminating = false
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}


public class Trie<CollectionType: Collection & Hashable>
where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    public init() {}
    
    public private(set) var collections: Set<CollectionType> = []
    
    public var count: Int {
        return collections.count
    }
    public var isEmpty: Bool {
        return collections.isEmpty
    }
    
    public func insert(_ collection : CollectionType) {
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key : element, parent : current)
            }
            current = current.children[element]!
        }
        if current.isTerminating {
            return
        }
        else {
            current.isTerminating = true
            collections.insert(collection)
        }
    }
    
    public func contains(_ collection : CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }
    
    //Removing a node
    public func remove(_ collection: CollectionType) {
        // 1 set current to root
        var current = root
        //2 run loop till all elements of collection & set current to last element of collection
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        //3 check is current is terminating is yes move to next step else we can return as there is no word in tree
        guard current.isTerminating else {
            return
        }
        // 4 set cureent to isTerminating false so we can use this further to remove elements
        current.isTerminating = false
        collections.remove(collection)
        // 5 in this step we will back track and will remove element only in case if current is having parent , current is having no more children (that means current is not shared with other collections), and current is not terminating
        while let parent = current.parent,
              current.children.isEmpty && !current.isTerminating {
            parent.children[current.key!] = nil
            current = parent
        }
    }
}

//Prefix matching
public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType]
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
    
    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType] {
        // 1
        var results: [CollectionType] = []
        
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
 
}

let trie = Trie<String>()
trie.insert("cut")
if trie.contains("cute") {
    print("cute is in the trie")
}
trie.insert("cute")
print("\n*** Before removing ***")
assert(trie.contains("cut"))
print("\"cut\" is in the trie")
assert(trie.contains("cute"))
print("\"cute\" is in the trie")

print("\n*** After removing cut ***")
trie.remove("cut")
assert(!trie.contains("cut"))
assert(trie.contains("cute"))
print("\"cute\" is still in the trie")


trie.insert("car")
trie.insert("card")
trie.insert("care")
trie.insert("cared")
trie.insert("cars")
trie.insert("carbs")
trie.insert("carapace")
trie.insert("cargo")
print("\nCollections starting with \"car\"")
let prefixedWithCar = trie.collections(startingWith: "car")
print(prefixedWithCar)
print("\nCollections starting with \"care\"")
let prefixedWithCare = trie.collections(startingWith: "care")
print(prefixedWithCare)
