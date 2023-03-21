import Foundation

public func quicksortNaive<Element: Comparable>(_ a: [Element]) -> [Element] {
    guard a.count > 1 else { return a }
    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    return quicksortNaive(less) + equal + quicksortNaive(greater)
}

func testQuickSort() {
    let beforeSort = [6, 29, 288, 11, 28]
    let afterSort = quicksortNaive(beforeSort)
    print("before sort: \(beforeSort)")
    print("after sort: \(afterSort)")
}

testQuickSort()
