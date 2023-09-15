import Foundation


struct Fruit : Hashable {
    let serialNumber: String
    var color: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}
