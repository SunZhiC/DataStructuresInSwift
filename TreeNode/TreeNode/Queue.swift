//
//  Queue.swift
//  TreeNode
//
//  Created by SuniMac on 2020/10/19.
//

public struct Queue<T> {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
  
    public init() {}
  
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
  
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public var count: Int {
        return leftStack.count + rightStack.count
    }
  
    @discardableResult public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
  
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
}
