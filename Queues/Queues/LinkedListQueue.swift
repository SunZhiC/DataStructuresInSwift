//
//  LinkedListQueue.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public class LinkedListQueue<Element>: Queue {
    private var list = DoublyLinkedList<Element>()
    public init() {}
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    public var peek: Element? {
        list.first?.value
    }
    
    @discardableResult
    public func enqueue(_ element: Element) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> Element? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
}

extension LinkedListQueue: CustomStringConvertible {
    public var description: String {
        String(describing: list)
    }
}
