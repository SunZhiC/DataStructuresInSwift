//
//  ViewController.swift
//  AVLTree
//
//  Created by SuniMac on 2020/11/9.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatedInsertions()
        removingValue()
    }

    func repeatedInsertions() {
        var tree = AVLTree<Int>()
        for i in 0 ..< 15 {
            tree.insert(i)
        }
        tree.insert(20)
//        tree.insert(22)
        print(tree)
    }

    func removingValue() {
        var tree = AVLTree<Int>()
        tree.insert(15)
        tree.insert(10)
        tree.insert(16)
        tree.insert(18)
        print(tree)
        tree.remove(10)
        print(tree)
    }
}
