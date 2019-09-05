import Foundation

struct Queue<T> {
    private var list = [T]()

    var isEmpty: Bool {
        return list.isEmpty
    }

    mutating func enqueue(_ element: T) {
        list.append(element)
    }

    mutating func dequeue() -> T? {
        if !list.isEmpty {
            return list.removeFirst()
        } else {
            return nil
        }
    }
}

typealias FinishCheckingMethod = (String) -> Bool

func breadthFirstSearch(
    graph: [String: [String]],
    startNode: String,
    finishCheckingMethod: FinishCheckingMethod
) -> Bool {
    var queue = Queue<String>()
    var searched: [String: String] = [:]

    if let startNodeGraph = graph[startNode] {
        for node in startNodeGraph {
            if let node = node as? String {
                queue.enqueue(node)
            }
        }
    }

    while !queue.isEmpty {
        if let node = queue.dequeue() {
            if searched[node] == nil {
                if finishCheckingMethod(node) {
                    print("\(node) is a desired node.")
                    return true
                } else {
                    if let nodeGraph = graph[node] {
                        for nodeOfNode in nodeGraph {
                            if let nodeOfNode = nodeOfNode as? String {
                                queue.enqueue(nodeOfNode)
                            }
                        }
                    }
                    searched[node] = ""
                }
            }
        }
    }

    print("There is no desired node.")
    return false
}


func isNodeFisish(_ node: String) -> Bool {
    return node.last == "m"
}

var graph: [String: [String]] = [:]
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

breadthFirstSearch(graph: graph, startNode: "you", finishCheckingMethod: isNodeFisish)
