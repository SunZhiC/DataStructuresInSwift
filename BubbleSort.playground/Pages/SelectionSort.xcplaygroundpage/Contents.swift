import Foundation

// SelectionSortForArray
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

func testSelectionSortForArray() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    selectionSort(&array)
    print("sorted array: \(array)")
}

testSelectionSortForArray()

// SelectionSortForCollection
public func selectionSort<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else { return }
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
            
        }
        if lowest != current {
            collection.swapAt(current, lowest)
        }
    }
}

func testSelectionSortForCollection() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    selectionSort(&array)
    print("sorted array: \(array)")
}

testSelectionSortForCollection()

