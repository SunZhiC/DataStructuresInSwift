import Foundation

public func insertionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else {
        return
    }

    for current in 1..<array.count {
        for shifting in (1..<current).reversed() {
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

func testInsertionSort() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    insertionSort(&array)
    print("sorted array: \(array)")
}

testInsertionSort()
