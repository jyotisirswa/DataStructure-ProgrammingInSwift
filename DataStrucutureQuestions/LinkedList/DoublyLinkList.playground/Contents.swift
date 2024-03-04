
//https://leetcode.com/problems/design-linked-list/description/

class MyLinkList  {
    var head : Node?
    var tail : Node?
    var size : Int
    
    init(){
        self.size = 0
        self.head = Node(value: 0)
    }
    
    var isEmpty : Bool {
        self.head == nil
    }
    
    func get(_ index: Int) -> Int? {
        if index < 0 || index >= self.size {
            return nil
        }
        var curr = self.head
        for _ in 0...(index) {
            curr = curr?.next
        }
        return curr?.value
    }
    
    func addAtHead(value : Int) {
        addAtIndex(index: 0, value: value)
    }
    
    func addAtTail(value : Int) {
        addAtIndex(index: self.size, value: value)
    }
    
    func addAtIndex(index : Int, value : Int) {
        if index > size {
            return
        }
        var index = index
        if index < 0 {
            index = -1
        }
        
        var prev = self.head
        var succ = prev?.next

        for _ in 0..<index {
            prev = prev?.next
            succ = prev?.next
        }
        self.size += 1
        var toAdd = Node(value:  value)
        toAdd.prev = prev
        toAdd.next = succ
        prev?.next = toAdd
        succ?.prev = toAdd
    }
    
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index >= self.size {
            return
        }
        
        var prev = self.head
        var succ = prev?.next

        for _ in 0..<index {
            prev = prev?.next
            succ = prev?.next
        }
        size -= 1
        prev?.next = succ?.next
        succ?.next?.prev = prev
    }
}

extension MyLinkList : CustomStringConvertible {
    
    public var description: String {
        return  "\(head)"
    }
}

class Node  {
    var value : Int
    var next : Node?
    var prev : Node?
    
    init(value: Int, next: Node? = nil, prev: Node? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension Node : CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return  "\(value)"
        }
        return  "\(value) -> " + String(describing : next) + " "
    }
}

var newObj = MyLinkList()
newObj.addAtHead(value: 1)
newObj.addAtTail(value: 3)
newObj.addAtIndex(index: 1, value: 2)
newObj.get(1)
newObj.deleteAtIndex(1)
newObj.get(1)
print(newObj)

var newObjTwo = MyLinkList()
newObjTwo.addAtHead(value: 1)
newObjTwo.deleteAtIndex(0)
print(newObjTwo)
