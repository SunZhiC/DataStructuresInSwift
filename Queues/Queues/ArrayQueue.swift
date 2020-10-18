//
//  ArrayQueue.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public struct ArrayQueue<Element>: Queue {
    private var array: [Element] = []
    public init() {}
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var peek: Element? {
        array.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> Element? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension ArrayQueue: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}
