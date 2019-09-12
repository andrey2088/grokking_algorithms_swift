import Foundation

var statesNeeded: Set<String> = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
let stations: [String: Set<String>] = [
    "kone": ["id", "nv", "ut"],
    "ktwo": ["wa", "id", "mt"],
    "kthree": ["or", "nv", "ca"],
    "kfour": ["nv", "ut"],
    "kfive": ["ca", "az"]
]
var finalStations: Set<String> = []

while !statesNeeded.isEmpty {
    var bestStation: String? = nil
    var statesCovered: Set<String> = []
    for stationStatesPair in stations {
        let station = stationStatesPair.key
        let stationStates = stationStatesPair.value
        let covered: Set<String> = statesNeeded.intersection(stationStates)
        if covered.count > statesCovered.count {
            bestStation = station
            statesCovered = covered
        }
    }
    finalStations.insert(bestStation!)
    statesNeeded = statesNeeded.subtracting(statesCovered)
}

print(finalStations)
