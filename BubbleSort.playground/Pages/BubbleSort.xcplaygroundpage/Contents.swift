import Foundation

// BubbleSortForArray
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

func testBubbleSortForArray() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    bubbleSort(&array)
    print("sorted array: \(array)")
}

testBubbleSortForArray()


// BubbleSortForCollection
public func bubbleSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable  {
    guard collection.count >= 2 else {
        return
    }
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        if !swapped {
            return
        }
    }
}

func testBubbleSortForCollection() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    bubbleSort(&array)
    print("sorted array: \(array)")
}

testBubbleSortForCollection()
