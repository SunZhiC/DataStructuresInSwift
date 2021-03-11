import Foundation

public func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else { return }
    for current in 0..<(array.count - 1) {
        var lowest = current
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

func testSelectionSort() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    selectionSort(&array)
    print("sorted array: \(array)")
}

testSelectionSort()
