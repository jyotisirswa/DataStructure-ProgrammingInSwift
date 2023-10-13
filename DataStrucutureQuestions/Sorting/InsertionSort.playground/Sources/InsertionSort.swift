import Foundation

//MARK: Insertion sort will iterate once through the cards, from left to right. Each card is shifted to the left until it reaches its correct position.
public func insertionSort<Element>(_ array : inout [Element]) where Element : Comparable {
    
    guard array.count >= 2 else {
        return
    }
    //1 Insertion sort requires you to iterate from left to right once. This loop does that.
    for current in 1..<array.count {
       
        //2 Here, you run backwards from the current index so you can shift left as needed.
        for shifting in (1...current).reversed() {
            //Keep shifting the element left as long as necessary. As soon as the element is in position, break the inner loop and start with the next element.
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            }
            else {
                break
            }
        }
    }
}

//public func insertionSort<T>(_ collection: inout T)
//where T: BidirectionalCollection & MutableCollection,
//      T.Element: Comparable {
//          guard collection.count >= 2 else {
//              return
//          }
//          for current in collection.indices {
//              var shifting = current
//              while shifting > collection.startIndex {
//                  let previous = collection.index(before: shifting)
//                  if collection[shifting] < collection[previous] {
//                      collection.swapAt(shifting, previous)
//                  } else {
//                      break
//                  }
//                  shifting = previous
//              }
//          }
//      }
