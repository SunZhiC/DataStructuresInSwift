//
//  QueuesTests.swift
//  QueuesTests
//
//  Created by SuniMac on 2020/10/18.
//

@testable import Queues
import XCTest

class QueuesTests: XCTestCase {
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

    func testArrayQueue() {
        var queue = ArrayQueue<String>()
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")

        XCTAssertEqual(queue.description, "[\"A\", \"B\", \"C\"]")
    }

    func testLinkedListQueue() {
        let queue = LinkedListQueue<String>()
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")

        XCTAssertEqual(queue.description, "A => B => C => end")
    }

    func testRingBufferQueue() {
        var queue = RingBufferQueue<String>(count: 5)
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")
        queue.dequeue()
        queue.dequeue()

        XCTAssertEqual(queue.description, "[C]")
    }

    func testStackQueue() {
        var queue = StackQueue<String>()
        queue.enqueue("A")
        queue.enqueue("B")
        queue.enqueue("C")

        queue.dequeue()
        queue.dequeue()

        XCTAssertEqual(queue.description, "[\"C\"]")
        XCTAssertEqual(queue.peek?.description, "C")
    }
}
