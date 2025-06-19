//
//  Extension.swift
//  LanguageImple
//
//  Created by liudong on 2022/12/13.
//

import Foundation

public extension String {
    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    var length: Int {
          return count
      }

    
    subscript(r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

public class BinaryNode<Element> {
    var value:Element
    var left:BinaryNode<Element>?
    var right:BinaryNode<Element>?
    
    public init(value:Element) {
        self.value = value
    }
    
}

