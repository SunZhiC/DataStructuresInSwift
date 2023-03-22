import Foundation

class TreeNode {
    var value: Int
    var children: [TreeNode]

    init(_ value: Int, children: [TreeNode] = []) {
        self.value = value
        self.children = children
    }
}

func bfs(_ root: TreeNode?) {
    guard let rootNode = root else {
        return
    }

    var queue: [TreeNode] = [rootNode]

    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        print(currentNode.value)

        for child in currentNode.children {
            queue.append(child)
        }
    }
}

let node5 = TreeNode(5)
let node6 = TreeNode(6)
let node7 = TreeNode(7)

let node3 = TreeNode(3, children: [node5, node6])
let node4 = TreeNode(4, children: [node7])

let node1 = TreeNode(1, children: [node3, node4])
let node2 = TreeNode(2)

let root = TreeNode(0, children: [node1, node2])

bfs(root)
