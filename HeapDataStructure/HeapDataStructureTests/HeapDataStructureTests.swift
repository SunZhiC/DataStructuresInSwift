//
//  HeapDataStructureTests.swift
//  HeapDataStructureTests
//
//  Created by SuniMac on 2021/3/6.
//

@testable import HeapDataStructure
import XCTest

class HeapDataStructureTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testHeap() {
        var heap = Heap(sort: >, elements: [1, 12, 14, 15, 2, 3, 9])
        while !heap.isEmpty {
            print(heap.remove()!)
        }
    }

    func testGetNthSmallestElement() {
        let array = [3, 10, 11, 14, 20, 1, 5]
        let element = getNthSmallestElement(n: 2, elements: array)
        XCTAssertEqual(element, 3)
    }
}
