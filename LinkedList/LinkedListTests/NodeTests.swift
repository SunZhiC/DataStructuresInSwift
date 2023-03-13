//
//  NodeTests.swift
//  LinkedListTests
//
//  Created by SuniMac on 2020/10/18.
//

import XCTest

class NodeTests: XCTestCase {
    override func setUpWithError() throws {}

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

    func testCreatingAndLinkingNodes() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)

        node1.next = node2
        node2.next = node3
        print(node1.description)
        XCTAssertEqual(node1.description, "1=>2=>3")
    }
}
