import Foundation

// InsertionSortForArray
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

func testInsertionSortForArray() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    insertionSort(&array)
    print("sorted array: \(array)")
}

testInsertionSortForArray()

// InsertionSortForCollection
public func insetionSort<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else { return }
    for current in collection.indices {
        var shifting = current
        while shifting > collection.startIndex {
            let previous = collection.index(before: shifting)
            if collection[shifting] < collection[previous] {
                collection.swapAt(shifting, previous)
            } else {
                break
            }
            shifting = previous
        }
    }
}

func testInsertionSortForCollection() {
    var array = [1, 9, 2, 5]
    print("start array: \(array)")
    insertionSort(&array)
    print("sorted array: \(array)")
}

testInsertionSortForCollection()
