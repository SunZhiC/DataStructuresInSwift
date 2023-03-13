//
//  StackQueue.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public struct StackQueue<Element>: Queue {
    private var leftStack: [Element] = []
    private var rightStack: [Element] = []
    public init() {}
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: Element? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        rightStack.append(element)
        return true
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
}

extension StackQueue: CustomStringConvertible {
    public var description: String {
        String(describing: leftStack.reversed() + rightStack)
    }
}
