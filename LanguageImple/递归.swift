//
//  递归.swift
//  SwiftLanguageImple
//
//  Created by Dong Liu on 2025/6/19.
//

//题目描述
//给定一个二叉树的根节点 root，返回该二叉树的最大深度。
//
//二叉树的最大深度是指从根节点到最远叶子节点的最长路径上的节点数。

//输入：
//    3
//   / \
//  9  20
//    /  \
//   15   7



public class Recursion {


    func test() {
        let root = BinaryNode(value: 3)
        let left = BinaryNode(value: 9)
        let right = BinaryNode(value: 20)
        let rightLeft = BinaryNode(value: 15)
        let rightRight = BinaryNode(value: 7)
        
        root.left = left
        root.right = right
        right.left = rightLeft
        right.right = rightRight
        let depth = getDepth(root: root)
        print(depth)
    }
    
    func getDepth<T>(root:BinaryNode<T>) -> Int  {
        
        var depth = 1
        var leftMaxDepth = 0
        var rightMaxDepth = 0
        if let left = root.left {
            leftMaxDepth =  getDepth(root: left)
        }
        if let right = root.right {
            rightMaxDepth = getDepth(root: right)
        }
        return 1 + max(leftMaxDepth, rightMaxDepth)
        
    }
    
    
    
}


