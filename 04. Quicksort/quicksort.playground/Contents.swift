import Foundation

func quicksort(_ arr: [Int]) -> [Int] {
    if arr.count < 2 {
        return arr
    } else {
        let pivot: Int = arr[0]
        var less: [Int] = []
        var greater: [Int] = []
        var i: Int = 1

        while i < arr.count {
            if arr[i] <= pivot {
                less.append(arr[i])
            } else {
                greater.append(arr[i])
            }
            i += 1
        }

        return quicksort(less) + [pivot] + quicksort(greater)
    }
}

print(quicksort([10, 5, 2, 3]))
