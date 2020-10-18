//
//  RingBuffer.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public struct RingBuffer<T> {
    private var array: [T?]
    private var readIndex = 0
    private var writeIndex = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public var first: T? {
        array[readIndex]
    }
    
    public var availableSpaceForReading: Int {
        writeIndex - readIndex
    }
    
    public var availableSpaceForWriting: Int {
        array.count - availableSpaceForReading
    }
    
    public var isEmpty: Bool {
        array.count == 0
    }
    
    public var isFull: Bool {
        availableSpaceForWriting == 0
    }
    
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
}

extension RingBuffer: CustomStringConvertible {
    public var description: String {
        let values = (0 ..< availableSpaceForReading).map {
            String(describing: array[($0 + readIndex) % array.count]!)
        }
        return "[" + values.joined(separator: ", ") + "]"
    }
}
