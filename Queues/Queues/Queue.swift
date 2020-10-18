//
//  Queue.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
