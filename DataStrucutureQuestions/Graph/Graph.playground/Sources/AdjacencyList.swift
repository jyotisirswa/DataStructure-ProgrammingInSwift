import Foundation

public enum EdgeType {
    case directed
    case undirected
}

public protocol Graph {
    
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>,
                         to destination: Vertex<Element>,
                         weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    func add(_ edge: EdgeType, from source: Vertex<Element>,
             to destination: Vertex<Element>,
             weight: Double?)
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}

extension Graph {
    public func addUndirectedEdge(between source: Vertex<Element>,
     and destination: Vertex<Element>,
                                  weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    public func add(_ edge: EdgeType, from source: Vertex<Element>,
     to destination: Vertex<Element>,
                    weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}


public class AdjacencyList<T>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList {
    
    public func createVertex(data: T) -> Vertex<T> {
     let vertex = Vertex(index: adjacencies.count, data: data)
     adjacencies[vertex] = []
     return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>,
                                to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source,
                        destination: destination,
                        weight: weight)
        adjacencies[source]?.append(edge)
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        return adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        return edges(from: source).first{$0.destination == destination}?.weight
    }
}

extension AdjacencyList : CustomStringConvertible {
    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencies { //1
            var edgeString = ""
            for (index, edge) in edges.enumerated() { //2
                print(edge)
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination),")
                }
                else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n") //3
        }
        return result
    }
}

