//
//  Queue.swift
//  PriorityQueue
//
//  Created by SuniMac on 2021/3/7.
//

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct PriorityQueue<Element: Equatable>: Queue {
    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        heap.remove()
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek()
    }
    
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
}

public struct PriorityQueueArray<Element: Equatable>: Queue {
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        for (index, otherElement) in elements.enumerated() {
            if sort(element, otherElement) {
                elements.insert(element, at: index)
                return true
            }
        }
        elements.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        isEmpty ? nil : elements.removeFirst()
    }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var peek: Element? {
        elements.first
    }
    
    private var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    public init(sort: @escaping (Element, Element) -> Bool, elements: [Element]) {
        self.elements = elements
        self.sort = sort
        self.elements.sort(by: sort)
    }
}

extension PriorityQueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: elements)
    }
}
