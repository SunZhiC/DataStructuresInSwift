import Foundation

public extension Array where Element == Int {
    mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)

            forEach { number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                if remainingPart > 0 {
                    done = false
                }
            }
            digits *= base
            self = buckets.flatMap { $0 }
        }
    }
}

func testRadixSort() {
    var array = [88, 199, 209, 7, 2223, 23737]
    print("before sort = \(array)")
    array.radixSort()
    print("after sort = \(array)")
}
testRadixSort()
