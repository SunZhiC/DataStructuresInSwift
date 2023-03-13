//
//  TrieNode.swift
//  Tries
//
//  Created by SuniMac on 2020/11/15.
//

import Foundation

public class TrieNode<Key: Hashable> {
    public var key: Key?
    public weak var parent: TrieNode?
    public var children: [Key: TrieNode] = [:]

    public var isTerminating = false

    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
