//
//  ViewController.swift
//  Tries
//
//  Created by SuniMac on 2020/11/15.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        prefixMatching()
    }

    func prefixMatching() {
        let trie = Trie<String>()
        trie.insert("car")
        trie.insert("card")
        trie.insert("care")
        trie.insert("cared")
        trie.insert("cars")
        trie.insert("carbs")
        trie.insert("carapace")
        trie.insert("cargo")
        print(trie)
        print("\nCollections starting with \"car\"")
        let prefixedWithCar = trie.collections(startingWith: "car")
        print(prefixedWithCar)

        print("\nCollections starting with \"care\"")
        let prefixedWithCare = trie.collections(startingWith: "care")
        print(prefixedWithCare)
    }
}
