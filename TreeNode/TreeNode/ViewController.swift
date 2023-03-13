//
//  ViewController.swift
//  TreeNode
//
//  Created by SuniMac on 2020/10/19.
//

import UIKit

class ViewController: UIViewController {
    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        
        return seven
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tree.traverseInOrder {
            print($0)
        }
//        print(tree.description)
//        let node = creatNode()
//        printEachLevel(for: node)
    }
    
    func creatNode() -> TreeNode<Int> {
        let node1 = TreeNode(1)
        
        let node7 = TreeNode(7)
        let node8 = TreeNode(8)
        let node9 = TreeNode(9)
        
        let node10 = TreeNode(10)
        let node12 = TreeNode(12)
        let node13 = TreeNode(13)
        
        let node22 = TreeNode(22)
        
        let node25 = TreeNode(25)
        let node26 = TreeNode(26)
        
        node1.add(node7)
        node1.add(node8)
        node1.add(node9)
        
        node7.add(node10)
        node7.add(node12)
        node7.add(node13)
        
        node8.add(node22)
        
        node9.add(node25)
        node9.add(node26)
        
        return node1
    }
    
    func printEachLevel<T>(for tree: TreeNode<T>) {
        var queue = Queue<TreeNode<T>>()
        var nodesLeftInCurrentLevel = 0
        queue.enqueue(tree)
        
        while !queue.isEmpty {
            nodesLeftInCurrentLevel = queue.count
            
            while nodesLeftInCurrentLevel > 0 {
                guard let node = queue.dequeue() else { break }
                print("\(node.value)", terminator: " ")
                node.children.forEach { queue.enqueue($0) }
                nodesLeftInCurrentLevel -= 1
            }
            print()
        }
    }
}
