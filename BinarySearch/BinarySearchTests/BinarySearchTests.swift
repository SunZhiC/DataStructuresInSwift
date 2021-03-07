//
//  BinarySearchTests.swift
//  BinarySearchTests
//
//  Created by SuniMac on 2020/11/15.
//

import XCTest
@testable import BinarySearch

class BinarySearchTests: XCTestCase {

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

    func testBinarySearch() {
        let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
        let search31 = array.firstIndex(of: 31)
        let binarySearch31 = array.binarySearch(for: 31)
        print("firstIndex(of:): \(String(describing: search31))")
        print("binarySearch(for:) \(String(describing: binarySearch31))")
        XCTAssertEqual(search31, binarySearch31)
    }
    
    func testGlobalBinarySearch() {
        let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
        let search105 = array.firstIndex(of: 105)
        let globalSearch = binarySearch(for: 105, in: array)
        print("firstIndex(of:): \(String(describing: search105))")
        print("binarySearch(for:) \(String(describing: globalSearch))")
        XCTAssertEqual(search105, globalSearch)
    }
}
