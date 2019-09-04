import Foundation

func findSmallest(_ arr: [Int]) -> Int {
    var smallest: Int = arr[0]
    var smallestIndex: Int = 0
    var i: Int = 1

    while i < arr.count {
        if arr[i] < smallest {
            smallest = arr[i]
            smallestIndex = i
        }
        i += 1
    }

    return smallestIndex
}

func selectionSort(_ sourceArr: [Int]) -> [Int] {
    var arr: [Int] = sourceArr
    var newArr: [Int] = []

    for arrItem in arr {
        let smallestIndex: Int = findSmallest(arr)
        newArr.append(arr[smallestIndex])
        arr.remove(at: smallestIndex)
    }

    return newArr
}

print(selectionSort([5, 3, 6, 2, 10]))
