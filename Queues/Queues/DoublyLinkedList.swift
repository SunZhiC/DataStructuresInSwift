//
//  DoublyLinkedList.swift
//  Queues
//
//  Created by SuniMac on 2020/10/18.
//

public class Node<T> {
    public var value: T
    public var next: Node<T>?
    public var previous: Node<T>?
    
    public init(value: T) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return String(describing: value)
    }
}

public class DoublyLinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var first: Node<T>? {
        head
    }
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
      
        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }
      
        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }
    
    public func remove(_ node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
      
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
      
        next?.previous = prev
      
        if next == nil {
            tail = prev
        }
      
        node.previous = nil
        node.next = nil
      
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        var string = ""
        var current = head
        while let node = current {
            string.append("\(node.value) => ")
            current = node.next
        }
        return string + "end"
    }
}

extension DoublyLinkedList: Sequence {
    public func makeIterator() -> some IteratorProtocol {
        LinkedListIterator(node: head)
    }
}

public class LinkedListIterator<T>: IteratorProtocol {
    public var current: Node<T>?
    init(node: Node<T>?) {
        current = node
    }
    
    public func next() -> Node<T>? {
        defer {
            current = current?.next
        }
        
        return current
    }
}
