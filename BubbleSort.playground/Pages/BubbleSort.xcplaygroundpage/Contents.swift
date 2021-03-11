import Foundation

public func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else { return }
    for end in (1 ..< array.count).reversed() {
        var swapped = false
        for current in 0 ..< end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }

        if !swapped {
            return
        }
    }
}

func testBubbleSort() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    bubbleSort(&array)
    print("sorted array: \(array)")
}

testBubbleSort()
