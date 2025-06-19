//
//  UnionFind.swift
//  LanguageImple
//
//  Created by liudong on 2022/10/28.
//

import Foundation

/// 主要用于将独立的元素进行合并，并且能很快地判断任意2个元素是否位于同一个组。
/// 应用：类似于图片处理工具中，针对某个像素点，选取周边与其颜色相近或者相似的点的算法。
public class UnionFindWeightedPathCompression<T: Hashable> {
    var index = [T: Int]() // index of element
    var parent = [Int]() // index of element's parent
    var size = [Int]() // size of subsets of i
    
    public func addNewSetWithElement(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        size.append(1)
    }
    
    /// find
    /// - Parameter e: target element
    /// - Returns: index of the tree label, means the index of the root element.
    public func setForElement(_ e: T) -> Int? {
        if let elementIndex = index[e] {
            return setByIndex(elementIndex)
        } else {
            return nil
        }
    }
    
    public func setByIndex(_ index: Int) -> Int {
        if parent[index] == index {
            return index
        } else {
            parent[index] = setByIndex(parent[index]) //做了优化，将遍历经过的点的父节点统一设置为该树的根节点。每当对index执行过一次搜索后，那么再次对该index执行搜索时，setByIndex(:)函数只需要递归执行2次即可找到根节点。
            return parent[index]
        }
    }
    
    func inSameSet(_ a:T,_ b:T) -> Bool {
        if let firstSet = setForElement(a),let secondSet = setForElement(b) {
            return firstSet == secondSet
        }
        return false
    }
    
    public func unionSetsContaining(_ a:T,_ b:T)  {
        if let firstSet = setForElement(a),let secondSet = setForElement(b)  {
            if firstSet != secondSet {
                if size[firstSet] < size[secondSet] {
//                    把firstset挂到secondSet
                    parent[firstSet] = parent[secondSet]
                    size[secondSet] += size[firstSet]
                } else {
                    parent[secondSet] = parent[firstSet]
                    size[firstSet] += size[secondSet]
                }
            }
        }
    }
    
}
