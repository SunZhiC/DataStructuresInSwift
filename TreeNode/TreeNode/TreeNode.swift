//
//  TreeNode.swift
//  TreeNode
//
//  Created by SuniMac on 2020/10/19.
//

import Foundation

public class TreeNode<T> {
    public weak var parent: TreeNode?
    public var value: T
    public var children: [TreeNode] = []

    public init(_ value: T) {
        self.value = value
    }
}

extension TreeNode {
    public func add(_ child: TreeNode) {
        children.append(child)
    }

    func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach(visit)
    }

    func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}
