//
//  PriorityQueueTests.swift
//  PriorityQueueTests
//
//  Created by SuniMac on 2021/3/7.
//

@testable import PriorityQueue
import XCTest

class PriorityQueueTests: XCTestCase {
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

    func testPriorityQueueArray() {
        var queue = PriorityQueueArray(sort: <, elements: [1, 3, 4, 9, 2, 0])
        queue.enqueue(5)
        queue.enqueue(10)
        queue.enqueue(8)

        XCTAssertEqual(queue.description, [0, 1, 2, 3, 4, 5, 8, 9, 10].description)
        while !queue.isEmpty {
            print(queue.dequeue()!)
        }
    }
}
