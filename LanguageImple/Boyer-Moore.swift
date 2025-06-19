//
//  Boyer-Moore.swift
//  LanguageImple
//
//  Created by liudong on 2022/11/7.
//

import Foundation

// String search, include 2 loopers, first one is out looper, denote the index of the source string, from start index to endindex; inner looper means
// current substring compare with pattern string.
// Boyer-Moore algorithm decrease the outer loop counts by skip long enough steps.But not decrease the inner loop count, still use brute-force algorithm.
public extension String {
    public func indexByBoyerMoore(of pattern: String) -> String.Index? {
//        1、set up skip table
//        2、define helper function for brute-force search, but backward
//        3、star search from the start of the source string
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= count else {
            return nil
        }
//        step.1
        var skipTable = [String.Element: Int]()
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - 1 - i
        }
        let lastIndexInPattern = pattern.index(before: pattern.endIndex)
        let lastCharInPattern = pattern[lastIndexInPattern]

        var endIndexInSourceStringForCurrentMatchCompare = index(startIndex, offsetBy: patternLength - 1)
//        step.2
        func backwards() -> Index? {
            var p = lastIndexInPattern
            var j = endIndexInSourceStringForCurrentMatchCompare
            while p > pattern.startIndex {
                p = index(before: p)
                j = index(before: j)
                if self[j] != pattern[p] {
                    return nil
                }
            }
            return j
        }
//        step.3
        while endIndexInSourceStringForCurrentMatchCompare < endIndex {
            let endcharAtPatternLengthIndexForSourceString = self[endIndexInSourceStringForCurrentMatchCompare]
            if endcharAtPatternLengthIndexForSourceString == lastCharInPattern {
                if let j = backwards() {
                    return j
                } else {
                    endIndexInSourceStringForCurrentMatchCompare = index(after: endIndexInSourceStringForCurrentMatchCompare)
                }
            } else {
                endIndexInSourceStringForCurrentMatchCompare = index(endIndexInSourceStringForCurrentMatchCompare, offsetBy: skipTable[endcharAtPatternLengthIndexForSourceString] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
