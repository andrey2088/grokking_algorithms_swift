import Foundation

func binarySearch(list: [Int], item: Int) -> Int? {
    var low: Int = 0
    var high: Int = list.count - 1

    while low <= high {
        let mid: Int = Int(floor(Float(low + high) / 2))
        let guess: Int = list[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return nil
}

let myList: [Int] = [1, 3, 5, 7, 9]

print(binarySearch(list: myList, item: 3))
print(binarySearch(list: myList, item: -1))
