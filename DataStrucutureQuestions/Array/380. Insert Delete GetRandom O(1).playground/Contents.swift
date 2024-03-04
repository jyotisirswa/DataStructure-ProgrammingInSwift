import UIKit

//https://leetcode.com/problems/insert-delete-getrandom-o1/?envType=study-plan-v2&envId=top-interview-150

/*
 First of all - why this weird combination? The structure looks quite theoretical, but it's widely used in popular statistical algorithms like Markov chain Monte Carlo and Metropolis–Hastings algorithm. These algorithms are for sampling from a probability distribution when it's difficult to compute the distribution itself.

 Let's figure out how to implement such a structure. Starting from the Insert, we immediately have two good candidates with O(1)\mathcal{O}(1)O(1) average insert time:

 Hashmap (or HashSet, the implementation is very similar): Java HashMap / Python dictionary

 Array List: Java ArrayList / Python list

 Let's consider them one by one.

 Hashmap provides Insert and Delete in average constant time, although has problems with GetRandom.

 The idea of GetRandom is to choose a random index and then retrieve an element with that index. There are no indexes in the hashmap, and hence to get a true random value, one has first to convert hashmap keys in a list, which would take linear time. The solution here is to build a list of keys aside and use this list to compute GetRandom in constant time.

 Array List has indexes and could provide Insert and GetRandom in average constant time, though has problems with Delete.

 Deleting a value at an arbitrary index takes linear time. The solution here is to always delete the last value:

 Swap the element to delete with the last one.

 Pop the last element out.

 For that, one has to compute an index of each element in constant time and hence needs a hashmap which stores element -> its index dictionary.

 Both ways converge into the same combination of data structures:

 Hashmap element -> its index.

 Array List of elements.
 */

class RandomizedSet {
    
    var dictionary = [Int : Int]()
    var list = [Int]()

    init() {
        dictionary = [:]
    }
    
    func insert(_ val: Int) -> Bool {
        guard let index = dictionary[val] else {
            dictionary[val] = list.count - 1
            list.append(val)
            return true
        }
        return false
    }
    
    func remove(_ val: Int) -> Bool {
        guard let indexOfElement = dictionary[val] else {
            return false
        }
        let lastElement = list.last!
        print("list = \(list)")
        print("lastElement = \(list)")
        list[indexOfElement] = lastElement
        dictionary[lastElement] = indexOfElement
        list.removeLast()
        dictionary.removeValue(forKey: val)
        return true
    }
    
    func getRandom() -> Int {
        return list.randomElement() ?? 0
    }
}
var randomObj = RandomizedSet()
randomObj.insert(0)
randomObj.insert(1)
randomObj.insert(2)
randomObj.insert(3)
print(randomObj.list)
print(randomObj.remove(3))
print(randomObj.list)
print(randomObj.getRandom())
