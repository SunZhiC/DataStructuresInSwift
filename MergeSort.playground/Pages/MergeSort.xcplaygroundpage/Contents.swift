import UIKit

public func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else { return array }
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    print("left = \(left), right = \(right)")
    return merge(left, right)
}

private func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0

    var result: [Element] = []
    while leftIndex < left.count, rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }

    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }

    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    return result
}


func testMergeSort() {
    let array = [1, 10, 4, 8, 21]
    let sortedArray = mergeSort(array)
    print(sortedArray)
}
testMergeSort()
