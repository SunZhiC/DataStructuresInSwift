//
//  RingBufferQueue.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public struct RingBufferQueue<Element>: Queue {
    private var ringBuffer: RingBuffer<Element>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<Element>(count: count)
    }
    
    public var isEmpty: Bool {
        ringBuffer.isEmpty
    }
    
    public var peek: Element? {
        ringBuffer.first
    }
    
    @discardableResult
    public mutating func enqueue(_ element: Element) -> Bool {
        return ringBuffer.write(element)
    }
    
    @discardableResult
    public mutating func dequeue() -> Element? {
        ringBuffer.read()
    }
}

extension RingBufferQueue: CustomStringConvertible {
    public var description: String {
        String(describing: ringBuffer)
    }
}
