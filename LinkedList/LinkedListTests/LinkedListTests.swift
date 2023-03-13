//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by SuniMac on 2020/10/7.
//

import XCTest

class LinkedListTests: XCTestCase {
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
    
    func testPush() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        XCTAssertEqual(list.description, "1=>2=>3")
    }
    
    func testAppend() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        
        XCTAssertEqual(list.description, "1=>2=>3")
    }
    
    func testInsert() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        var middleNode = list.node(at: 1)!
        for _ in 1 ... 4 {
            middleNode = list.insert(-1, after: middleNode)
        }
        
        XCTAssertEqual(list.description, "1=>2=>-1=>-1=>-1=>-1=>3")
    }
    
    func testPop() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        let poppedValue = list.pop()
        XCTAssertEqual(list.description, "2=>3")
        XCTAssertEqual(poppedValue?.description, "1")
    }
    
    func testRemoveLast() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        let removeValue = list.removeLast()
        XCTAssertEqual(list.description, "1=>2")
        XCTAssertEqual(removeValue?.description, "3")
    }
    
    func testRemove() {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        let index = 1
        let node = list.node(at: index - 1)!
        let removedValue = list.remove(after: node)
        
        XCTAssertEqual(list.description, "1=>3")
        XCTAssertEqual(removedValue?.description, "2")
    }
    
    func testCollection() {
        var list = LinkedList<Int>()
        for i in 0 ... 9 {
            list.append(i)
        }
        XCTAssertEqual(list[list.startIndex], 0)
        XCTAssertEqual(Array(list.prefix(3)), [0, 1, 2])
        XCTAssertEqual(Array(list.suffix(3)), [7, 8, 9])
        let sum = list.reduce(0, +)
        XCTAssertEqual(sum, 45)
    }
    
    func testLinkedListROW() {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        var list2 = list1
        list2.append(3)
        
        XCTAssertEqual(list1.description, "1=>2")
        XCTAssertEqual(list2.description, "1=>2=>3")
        
        if let node = list2.node(at: 0) {
            list2.remove(after: node)
        }
        XCTAssertEqual(list2.description, "1=>3")
    }
}
