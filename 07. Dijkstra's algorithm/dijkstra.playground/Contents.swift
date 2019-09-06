import Foundation

func findLowestCostNode(costs: [String: Int], processed: [String]) -> String? {
    var lowestCost: Int = Int.max
    var lowestCostNode: String? = nil

    for nodeCost in costs {
        let cost: Int = nodeCost.value
        let node: String = nodeCost.key
        if (cost < lowestCost) && (!processed.contains(node)) {
            lowestCost = cost
            lowestCostNode = node
        }
    }

    return lowestCostNode
}

func dijkstra(graph: [String: [String: Int]], startNode: String, finishNode: String) -> Int {
    var costs: [String: Int] = [:]
    var parents: [String: String] = [:]
    var processed: [String] = []
    var node: String? = startNode

    while true {
        if let nodeCur = node {
            let cost: Int = costs[nodeCur] ?? 0
            for n in Array(graph[nodeCur]!.keys) {
                let newCost: Int = cost + graph[nodeCur]![n]!
                if costs[n] == nil || newCost < costs[n]! {
                    costs[n] = newCost
                    parents[n] = nodeCur
                }
            }
            processed.append(nodeCur)
            node = findLowestCostNode(costs: costs, processed: processed)
        } else {
            break
        }
    }

    return costs[finishNode]!
}


let graph: [String: [String: Int]] = [
    "start": ["a": 6, "b": 2],
    "a": ["fin": 1],
    "b": ["a": 3, "fin": 5],
    "fin": [:]
]

print(dijkstra(graph: graph, startNode: "start", finishNode: "fin"))
